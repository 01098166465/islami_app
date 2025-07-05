import 'package:flutter/material.dart';
import 'home_screen.dart';

class IntroScreen extends StatefulWidget {
  static const String routeName = "intro_screen";
  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  PageController _controller = PageController();
  int currentIndex = 0;

  List<Map<String, String>> pages = [
    {
      "title": "Welcome To Islmi App",
      "desc": "",
      "image": "assets/images/intro1.png",
    },
    {
      "title": "Welcome To Islami",
      "desc": "We Are Very Excited To Have You In Our Community",
      "image": "assets/images/intro2.png",
    },
    {
      "title": "Reading the Quran",
      "desc": "Read, and your Lord is the Most Generous",
      "image": "assets/images/intro3.png",
    },
    {
      "title": "Besm Allah",
      "desc": "Praise the name of your Lord, the Most High",
      "image": "assets/images/intro4.png",
    },
    {
      "title": "Holy Quran Radio",
      "desc":
          "You can listen to the Holy Quran Radio through the application for free and easily",
      "image": "assets/images/intro5.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        controller: _controller,
        itemCount: pages.length,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                Image.asset("assets/images/header.png", height: 80),

                const SizedBox(height: 20),
                Spacer(),
                Image.asset(pages[index]["image"]!, height: 200),

                const SizedBox(height: 40),
                Spacer(),
                Text(
                  pages[index]["title"]!,
                  style: TextStyle(fontSize: 22, color: Colors.white),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 12),
                Spacer(),
                Text(
                  pages[index]["desc"]!,
                  style: TextStyle(fontSize: 14, color: Colors.amberAccent),
                  textAlign: TextAlign.center,
                ),
                Spacer(),
                const SizedBox(height: 50),

                // ✅ Dots Indicators
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    pages.length,
                    (dotIndex) => Container(
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      width: currentIndex == dotIndex ? 12 : 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: currentIndex == dotIndex
                            ? Colors.amber
                            : Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    index != 0
                        ? TextButton(
                            onPressed: () {
                              _controller.previousPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.ease,
                              );
                            },
                            child: Text(
                              "Back",
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        : SizedBox(width: 60),
                    TextButton(
                      onPressed: () {
                        if (index == pages.length - 1) {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                          );
                        } else {
                          _controller.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.ease,
                          );
                        }
                      },
                      child: Text(
                        index == pages.length - 1 ? "Finish" : "Next",
                        style: TextStyle(color: Colors.amber),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:islami_app/widgets/app_theme.dart';
import '../../home/home_screen.dart';

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
      "title": "Bearish",
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
      backgroundColor: AppTheme.black,
      body: PageView.builder(
        controller: _controller,
        itemCount: pages.length,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        itemBuilder: (context, index) {
          TextTheme textThem = Theme.of(context).textTheme;
          double screenHeight = MediaQuery.sizeOf(context).height;
          double screenWidth = MediaQuery.sizeOf(context).width;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                Image.asset(
                  "assets/images/header.png",
                  width: screenWidth * 0.9,
                ),
                Spacer(),
                Image.asset(
                  pages[index]["image"]!,
                  height: screenHeight * 0.5,
                  width: double.infinity,
                ),
                Spacer(),
                Text(
                  pages[index]["title"]!,
                  style: textThem.headlineSmall!.copyWith(
                    color: AppTheme.primay,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40),
                Text(
                  pages[index]["desc"]!,
                  style: textThem.titleMedium!.copyWith(color: AppTheme.primay),
                  textAlign: TextAlign.center,
                ),
                Spacer(),
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
                              style: textThem.titleMedium!.copyWith(
                                color: AppTheme.primay,
                              ),
                            ),
                          )
                        : SizedBox(width: 60),

                    Row(
                      children: List.generate(
                        pages.length,
                        (dotIndex) => Container(
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          width: currentIndex == dotIndex ? 12 : 6,
                          height: 6,
                          decoration: BoxDecoration(
                            color: currentIndex == dotIndex
                                ? AppTheme.primay
                                : Color(0xff707070),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
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
                        style: textThem.titleMedium!.copyWith(
                          color: AppTheme.primay,
                        ),
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

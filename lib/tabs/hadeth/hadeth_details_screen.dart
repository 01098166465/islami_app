import 'package:flutter/material.dart';

import 'package:islami_app/app_theme.dart';
import 'package:islami_app/tabs/hadeth/hadeth1.dart';

class HadethDetailsScreen extends StatelessWidget {
  static const String routeName = "hadeth-details";

  @override
  Widget build(BuildContext context) {
    Hadeth1 hadeth = ModalRoute.of(context)!.settings.arguments as Hadeth1;
    TextTheme textThem = Theme.of(context).textTheme;
    double screenHeight = MediaQuery.sizeOf(context).height;

    return Scaffold(
      appBar: AppBar(title: Text("Hadeth ${hadeth.num}")),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "assets/images/details_header_left.png",
                  height: screenHeight * 0.1,
                  fit: BoxFit.fill,
                ),
                Expanded(
                  child: Text(
                    hadeth.title,
                    style: textThem.headlineSmall!.copyWith(
                      color: AppTheme.primay,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Image.asset(
                  "assets/images/details_header_right.png",
                  height: screenHeight * 0.1,
                  fit: BoxFit.fill,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 20),
              itemBuilder: (_, index) => Text(
                hadeth.content[index],
                style: textThem.titleLarge!.copyWith(color: AppTheme.primay),
                textAlign: TextAlign.center,
              ),
              separatorBuilder: (_, __) => SizedBox(height: 12),
              itemCount: hadeth.content.length,
            ),
          ),
          Image.asset(
            "assets/images/details_footer.png",
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}

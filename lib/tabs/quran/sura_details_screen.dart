import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/app_theme.dart';
import 'package:islami_app/tabs/quran/sura.dart';

class SuraDetailsScreen extends StatelessWidget {
  static const String routrName = "sura-details";
  @override
  Widget build(BuildContext context) {
    TextTheme textThem = Theme.of(context).textTheme;
    Sura sura = ModalRoute.of(context)!.settings.arguments as Sura;
    double screenHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(title: Text(sura.englishSuraNames)),
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
                Text(
                  sura.arabicSuraNames,
                  style: textThem.headlineSmall!.copyWith(
                    color: AppTheme.primay,
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
          Spacer(),
          Image.asset(
            "assets/images/details_footer.png",
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}

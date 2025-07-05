import 'package:flutter/material.dart';
import 'package:islami_app/app_theme.dart';
import 'package:islami_app/tabs/quran/quran_service.dart';
import 'package:islami_app/tabs/quran/sura.dart';
import 'package:islami_app/tabs/quran/sura_details_screen.dart';
import 'package:islami_app/tabs/quran/sura_item.dart';

class QuranTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            "Sura List",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 20),
            itemBuilder: (_, index) {
              Sura sura = QuranService.suras[index];
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    SuraDetailsScreen.routrName,
                    arguments: sura,
                  );
                },
                child: SuraItem(sura),
              );
            },
            itemCount: QuranService.suras.length,

            separatorBuilder: (context, index) => Divider(
              thickness: 1,
              color: AppTheme.white,
              indent: screenWidth * 0.1,
              endIndent: screenWidth * 0.1,
            ),
          ),
        ),
      ],
    );
  }
}

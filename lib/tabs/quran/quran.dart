import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami_app/app_theme.dart';
import 'package:islami_app/tabs/quran/quran_service.dart';
import 'package:islami_app/tabs/quran/sura.dart';
import 'package:islami_app/tabs/quran/sura_details_screen.dart';
import 'package:islami_app/tabs/quran/sura_item.dart';

class QuranTab extends StatefulWidget {
  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            style: Theme.of(context).textTheme.titleMedium,
            decoration: InputDecoration(
              prefixIcon: SvgPicture.asset(
                "assets/icons/quran.svg",
                width: 28,
                height: 28,
                fit: BoxFit.scaleDown,
                colorFilter: ColorFilter.mode(AppTheme.primay, BlendMode.srcIn),
              ),
              hintText: "Sura Name",
            ),
            onChanged: (query) {
              QuranService.searchSura(query);
              setState(() {});
            },
          ),
        ),
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
            itemCount: QuranService.suras.length,
            itemBuilder: (context, index) {
              final Sura sura = QuranService.suras[index];
              return InkWell(
                onTap: () {
                  debugPrint(
                    "Tapped on sura ${sura.num}: ${sura.englishSuraNames}",
                  );
                  Navigator.pushNamed(
                    context,
                    SuraDetailsScreen.routrName,
                    arguments: sura,
                  );
                },
                child: SuraItem(sura),
              );
            },
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

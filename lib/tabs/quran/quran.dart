import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami_app/widgets/app_theme.dart';
import 'package:islami_app/tabs/quran/most_recently_section.dart';
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
        MostRecentlySection(),
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
                onTap: () async {
                  QuranService.addSuraToMostRecently(sura);
                  await Navigator.pushNamed(
                    context,
                    SuraDetailsScreen.routeName,
                    arguments: sura,
                  );
                  setState(() {});
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

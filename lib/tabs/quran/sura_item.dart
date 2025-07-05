import 'package:flutter/material.dart';
import 'package:islami_app/tabs/quran/sura.dart';

class SuraItem extends StatelessWidget {
  Sura sura;
  SuraItem(this.sura);
  @override
  Widget build(BuildContext context) {
    TextTheme textThem = Theme.of(context).textTheme;
    return Row(
      children: [
        Container(
          height: 52,
          width: 52,
          margin: EdgeInsets.only(right: 24),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/sura_number_frame.png"),
            ),
          ),
          child: Text("${sura.num}", style: textThem.titleSmall),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(sura.englishSuraNames, style: textThem.titleLarge),
            Text("${sura.ayatCounts} Verses ", style: textThem.titleSmall),
          ],
        ),
        Spacer(),
        Text(sura.arabicSuraNames, style: textThem.titleLarge),
      ],
    );
  }
}

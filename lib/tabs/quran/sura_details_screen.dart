import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/widgets/app_theme.dart';
import 'package:islami_app/tabs/quran/quran_service.dart';
import 'package:islami_app/tabs/quran/sura.dart';
import 'package:islami_app/widgets/loading_indecator.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = "sura-details";

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  late Sura sura;
  List<String> ayat = [];
  bool isLoaded = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!isLoaded) {
      final args = ModalRoute.of(context)?.settings.arguments;
      if (args != null && args is Sura) {
        sura = args;
        loadSura();
        isLoaded = true;
      }
    }
  }

  Future<void> loadSura() async {
    try {
      String suraFileContent = await QuranService.loadSuraFile(sura.num);

      ayat = suraFileContent.split("\r\n");

      setState(() {});
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textThem = Theme.of(context).textTheme;
    double screenHeight = MediaQuery.sizeOf(context).height;

    return Scaffold(
      appBar: AppBar(title: Text(isLoaded ? sura.englishSuraNames : "")),
      body: Column(
        children: [
          if (isLoaded)
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
          Expanded(
            child: ayat.isEmpty
                ? LoadingIndecator()
                : ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    itemBuilder: (_, index) => Text(
                      ayat[index],
                      style: textThem.titleLarge!.copyWith(
                        color: AppTheme.primay,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    separatorBuilder: (_, __) => SizedBox(height: 12),
                    itemCount: ayat.length,
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

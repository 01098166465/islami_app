import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/widgets/app_theme.dart';
import 'package:islami_app/tabs/hadeth/hadeth1.dart';
import 'package:islami_app/tabs/hadeth/hadeth_details_screen.dart';
import 'package:islami_app/widgets/loading_indecator.dart';

class HadethItem extends StatefulWidget {
  int index;
  HadethItem({required this.index});
  @override
  State<HadethItem> createState() => _HadethItemState();
}

class _HadethItemState extends State<HadethItem> {
  Hadeth1? hadeth1;
  @override
  Widget build(BuildContext context) {
    if (hadeth1 == null) {
      loadHadeth();
    }
    TextTheme textTheme = Theme.of(context).textTheme;
    double screenheight = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {
        Navigator.of(
          context,
        ).pushNamed(HadethDetailsScreen.routeName, arguments: hadeth1);
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.primay,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/images/hadeth_header_left.png",
                    height: screenheight * 0.1,
                    fit: BoxFit.fill,
                  ),
                  if (hadeth1 != null)
                    Expanded(
                      child: Text(
                        hadeth1!.title,
                        style: textTheme.headlineSmall!.copyWith(
                          color: AppTheme.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  Image.asset(
                    "assets/images/hadeth_header_rigt.png",
                    height: screenheight * 0.1,
                    fit: BoxFit.fill,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/images/hadeth_card_background.png",
                    ),
                  ),
                ),
                child: hadeth1 == null
                    ? LoadingIndecator(color: AppTheme.black)
                    : ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        itemBuilder: (_, index) => Text(
                          hadeth1!.content[index],
                          textAlign: TextAlign.center,
                          style: textTheme.titleMedium!.copyWith(
                            color: AppTheme.black,
                          ),
                        ),
                        separatorBuilder: (_, __) => SizedBox(height: 4),
                        itemCount: hadeth1!.content.length,
                      ),
              ),
            ),
            Image.asset(
              "assets/images/hadeth_footer.png",
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> loadHadeth() async {
    String hadethFileContent = await rootBundle.loadString(
      "assets/text/h${widget.index + 1}.txt",
    );
    List<String> hadethLines = hadethFileContent.split("\n");
    String title = hadethLines[0];
    hadethLines.removeAt(0);
    List<String> context = hadethLines;
    hadeth1 = Hadeth1(title: title, content: context, num: widget.index + 1);
    setState(() {});
  }
}

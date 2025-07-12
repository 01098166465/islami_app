import 'package:flutter/material.dart';
import 'package:islami_app/widgets/app_theme.dart';
import 'package:islami_app/tabs/radio/radio_card.dart';

class RadioTab extends StatefulWidget {
  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  int selectedTab = 0;

  List<String> radioStations = [
    'Radio Ibrahim Al-Akdar',
    'Radio Al-Qaria Yassen',
    'Radio Ahmed Al-trabulsi',
    'Radio Addokali Mohammad Alalim',
  ];

  List<String> reciters = [
    'Ibrahim Al-Akdar',
    'Akram Alalaqmi',
    'Majed Al-Enezi',
    'Malik shaibat Alhamed',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        Container(
          width: 320,
          height: 40,
          decoration: BoxDecoration(
            color: AppTheme.black.withValues(alpha: 0.7),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedTab = 0;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: selectedTab == 0
                          ? AppTheme.primay
                          : AppTheme.black.withValues(alpha: 0.7),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomLeft: Radius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Radio',
                      style: TextStyle(
                        color: selectedTab == 0 ? Colors.black : Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedTab = 1;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: selectedTab == 1
                          ? AppTheme.primay
                          : AppTheme.black.withValues(alpha: 0.7),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Reciters',
                      style: TextStyle(
                        color: selectedTab == 1 ? Colors.black : Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: selectedTab == 0
                ? radioStations.length
                : reciters.length,
            itemBuilder: (context, index) {
              String name = selectedTab == 0
                  ? radioStations[index]
                  : reciters[index];
              bool isSpecial =
                  (selectedTab == 0 && name == 'Radio Al-Qaria Yassen') ||
                  (selectedTab == 1 && name == 'Akram Alalaqmi');
              return RadioCard(name: name, isSpecial: isSpecial);
            },
          ),
        ),
      ],
    );
  }
}

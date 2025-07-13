import 'package:flutter/material.dart';
import 'package:islami_app/widgets/app_theme.dart';

class TimeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.35,
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: AppTheme.primay,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "16 Jul,\n 2024",
                      textAlign: TextAlign.start,
                      style: textTheme.titleMedium,
                    ),
                    Text(
                      "Pray Time",
                      style: textTheme.titleLarge!.copyWith(
                        color: Color(0xff856B3F),
                      ),
                    ),
                    Text("09 Muh,\n 1446", style: textTheme.titleMedium),
                  ],
                ),

                Text(
                  "Tuesday",
                  style: textTheme.titleLarge!.copyWith(color: AppTheme.black),
                ),
                SizedBox(height: 10),
                Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SizedBox(width: 8),
                        _buildPrayerCard("Fajr", "04:04 ", "AM"),
                        SizedBox(width: 8),
                        _buildPrayerCard("Dhuhr", "01:01 ", "PM"),
                        SizedBox(width: 8),
                        _buildPrayerCard("ASR", "04:38 ", "PM"),
                        SizedBox(width: 8),
                        _buildPrayerCard("Maghrib", "07:57 ", "PM"),
                        SizedBox(width: 8),
                        _buildPrayerCard("Isha", "09:11 ", "PM"),
                        SizedBox(width: 8),
                      ],
                    ),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Next Pray${"- 02:32"}",
                      style: textTheme.titleMedium!.copyWith(
                        color: Color(0xff202020).withValues(alpha: 0.75),
                      ),
                    ),

                    Icon(Icons.volume_off, size: 25),
                  ],
                ),
              ],
            ),
          ),

          Row(
            children: [
              SizedBox(width: 15),

              Text(
                "Azkar",
                textAlign: TextAlign.start,
                style: textTheme.titleMedium,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: MediaQuery.of(context).size.width * 0.4,
                  decoration: BoxDecoration(
                    color: AppTheme.black.withValues(alpha: 0.7),
                    border: Border.all(color: AppTheme.primay, width: 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Image.asset("assets/images/bell_time_icon.png"),
                      Text("Evening Azkar", style: textTheme.titleLarge),
                    ],
                  ),
                ),

                Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: MediaQuery.of(context).size.width * 0.4,
                  decoration: BoxDecoration(
                    color: AppTheme.black.withValues(alpha: 0.7),
                    border: Border.all(color: AppTheme.primay, width: 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Image.asset("assets/images/radio_icon2.png"),
                      Text("Morning Azkar", style: textTheme.titleLarge),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPrayerCard(String title, String time, String period) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppTheme.black, Color(0xffB19768)],
          begin: Alignment.topLeft,
          end: Alignment.bottomLeft,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4),
          Text(
            time,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          ),
          Text(
            period,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

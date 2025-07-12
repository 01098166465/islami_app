import 'package:flutter/material.dart';

class TimeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          // ✅ Container مواقيت الصلاة
          Container(
            height: 250,
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            decoration: BoxDecoration(
              color: Color(0xFFF0C77A),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              children: [
                // التاريخ واليوم
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("16 Jul, 2024", style: TextStyle(fontSize: 14)),
                    Text(
                      "Pray Time",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("09 Muh, 1446", style: TextStyle(fontSize: 14)),
                  ],
                ),
                SizedBox(height: 4),
                Text(
                  "Tuesday",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),

                SizedBox(height: 12),

                // ✅ Scroll أفقي للكروت
                Container(
                  height: 80,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SizedBox(width: 8),
                        _buildPrayerCard("Fajr", "04:04 AM"),
                        SizedBox(width: 8),
                        _buildPrayerCard("Dhuhr", "01:01 PM"),
                        SizedBox(width: 8),
                        _buildPrayerCard("ASR", "04:38 PM", isActive: true),
                        SizedBox(width: 8),
                        _buildPrayerCard("Maghrib", "07:57 PM"),
                        SizedBox(width: 8),
                        _buildPrayerCard("Isha", "09:11 PM"),
                        SizedBox(width: 8),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 12),

                // الوقت المتبقي وأيقونة الصوت
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Next Pray - 02:32", style: TextStyle(fontSize: 14)),
                    Icon(Icons.volume_off, size: 18),
                  ],
                ),
              ],
            ),
          ),

          // ✅ محتوى إضافي تقدر تضيفه هنا
          Text("Azkar", style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  // ✅ كروت الصلاة
  Widget _buildPrayerCard(String title, String time, {bool isActive = false}) {
    return Container(
      width: 70,
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: isActive ? Colors.black : Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              color: isActive ? Colors.white70 : Colors.black87,
              fontSize: 12,
            ),
          ),
          SizedBox(height: 4),
          Text(
            time,
            style: TextStyle(
              color: isActive ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}

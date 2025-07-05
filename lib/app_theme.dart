import 'package:flutter/material.dart';

class AppTheme {
  static const Color primay = Color(0xffE2BE7F);
  static const Color black = Color(0xff202020);
  static const Color white = Color(0xffffffff);

  static ThemeData lightThem = ThemeData();
  static ThemeData darkThem = ThemeData(
    primaryColor: primay,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: primay,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: white,
    ),

    textTheme: TextTheme(
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: white,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: white,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: white,
      ),
      headlineSmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: white,
      ),
    ),
  );
}

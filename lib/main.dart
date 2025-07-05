import 'package:flutter/material.dart';
import 'package:islami_app/app_theme.dart';
import 'package:islami_app/home_screen.dart';
<<<<<<< HEAD
import 'package:islami_app/tabs/quran/sura_details_screen.dart';
=======
import 'package:islami_app/intro_screen.dart';
>>>>>>> feature/intro

void main() {
  runApp(IslamiApp());
}

class IslamiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
<<<<<<< HEAD
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraDetailsScreen.routrName: (context) => SuraDetailsScreen(),
=======
      initialRoute: IntroScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),

        IntroScreen.routeName: (context) => IntroScreen(),
>>>>>>> feature/intro
      },
      theme: AppTheme.lightThem,
      darkTheme: AppTheme.darkThem,
      themeMode: ThemeMode.dark,
    );
  }
}

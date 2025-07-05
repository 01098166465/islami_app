import 'package:flutter/material.dart';
import 'package:islami_app/app_theme.dart';
import 'package:islami_app/home_screen.dart';
<<<<<<< HEAD
import 'package:islami_app/intro_screen.dart';
=======

import 'package:islami_app/tabs/quran/sura_details_screen.dart';
=======
import 'package:islami_app/intro_screen.dart';
>>>>>>> feature/intro
>>>>>>> development

void main() {
  runApp(IslamiApp());
}

class IslamiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
<<<<<<< HEAD
=======
<<<<<<< HEAD
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraDetailsScreen.routrName: (context) => SuraDetailsScreen(),
=======
>>>>>>> development
      initialRoute: IntroScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),

        IntroScreen.routeName: (context) => IntroScreen(),
<<<<<<< HEAD
=======
>>>>>>> feature/intro
>>>>>>> development
      },
      theme: AppTheme.lightThem,
      darkTheme: AppTheme.darkThem,
      themeMode: ThemeMode.dark,
    );
  }
}

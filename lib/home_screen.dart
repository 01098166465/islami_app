import 'package:flutter/material.dart';
import 'package:islami_app/nav_bar_selected_icon.dart';
import 'package:islami_app/nav_bar_unselected_icon.dart';
import 'package:islami_app/tabs/hades.dart';
import 'package:islami_app/tabs/quran.dart';
import 'package:islami_app/tabs/sabaha.dart';
import 'package:islami_app/tabs/time.dart';
import 'package:islami_app/tabs/radioTab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  List<Widget> tads = [Quran(), Hades(), Sabaha(), Radiotab(), Time()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tads[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          if (currentIndex == index) return;
          currentIndex = index;

          setState(() {});
        },
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: NavBarUnselectedIcon(imageName: "quran"),
            activeIcon: NavBarSelectedIcon(imageName: "quran"),
            label: "Quran",
          ),
          BottomNavigationBarItem(
            icon: NavBarUnselectedIcon(imageName: "hades"),
            activeIcon: NavBarSelectedIcon(imageName: "hades"),
            label: "hades",
          ),
          BottomNavigationBarItem(
            icon: NavBarUnselectedIcon(imageName: "sebaha"),
            activeIcon: NavBarSelectedIcon(imageName: "sebaha"),
            label: "Sabaha",
          ),
          BottomNavigationBarItem(
            icon: NavBarUnselectedIcon(imageName: "radio"),
            activeIcon: NavBarSelectedIcon(imageName: "radio"),
            label: "Radio",
          ),
          BottomNavigationBarItem(
            icon: NavBarUnselectedIcon(imageName: "time"),
            activeIcon: NavBarSelectedIcon(imageName: "time"),
            label: "Time",
          ),
        ],
      ),
    );
  }
}

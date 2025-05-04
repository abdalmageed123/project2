import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/features/pages/screen/lessons.dart';
import 'package:project2/features/pages/screen/profile.dart';

class Teachermaincontroller extends GetxController {
  int currentpage = 0;

  List<Widget> listPage = [
    const LessonsScreen(),
    Text('s'),
    Text('d'),
    const ProfileScreen(),
  ];
  List<BottomNavigationBarItem> bottombar = [
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'الملف الشخصي',
      backgroundColor: Colors.white,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.card_membership),
      label: 'الباقات',
      backgroundColor: Colors.white,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.account_balance_wallet),
      label: 'الرصيد',
      backgroundColor: Colors.white,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.menu_book),
      label: 'الدروس',
      backgroundColor: Colors.white,
    ),
  ];
  changePage(int i) {
    currentpage = i;
    print(i);
    update();
  }
}

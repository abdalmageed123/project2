  import 'package:flutter/material.dart';
import 'package:project2/core/constants/colors.dart';

 buildDot(int index,int  _currentPage) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: _currentPage == index ? 20 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: _currentPage == index ? AppColor.color1: Colors.grey,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
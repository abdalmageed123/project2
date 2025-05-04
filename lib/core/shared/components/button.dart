import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project2/core/constants/colors.dart';

class Elevatedbutton extends StatelessWidget {
  void Function() onPressed;
  String text;
  Elevatedbutton({super.key,required this.onPressed,required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed:onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.color1,
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(
            vertical: 14.h,
          ), // حجم الزر بالنسبة للطول
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16.sp, // حجم النص بالنسبة لعرض الشاشة
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project2/core/constants/colors.dart';
 Widget buildOption({
    required String title,
    required IconData icon,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 18.h),
        decoration: BoxDecoration(
          color: selected ? Colors.white : Colors.grey[100],
          border: Border.all(
            color: selected ? AppColor.color1 : Colors.grey,
            width: selected ? 2.w : 1.w,
          ),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          children: [
            Icon(icon, size: 40.sp, color: selected ? AppColor.color1 : Colors.grey),
            SizedBox(height: 8.h),
            Text(title, style: TextStyle(fontSize: 18.sp, color: selected ? AppColor.color1 : Colors.grey)),
          ],
        ),
      ),
    );
  }

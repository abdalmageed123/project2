import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildTile(IconData icon, String title, VoidCallback onTap) {
  return ListTile(
    contentPadding: EdgeInsets.zero,
    leading: Icon(icon, size: 22.sp, color: Colors.black54),
    title: Text(title, style: TextStyle(fontSize: 15.sp)),
    trailing: Icon(Icons.arrow_forward_ios, size: 16.sp),
    onTap: onTap,
  );
}

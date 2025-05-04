 import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget notificationTile({
    required String title,
    required String body,
    required String date,
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.notifications_active, color: Colors.deepPurple, size: 28.sp),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: TextStyle(
                        fontSize: 15.sp, fontWeight: FontWeight.bold)),
                SizedBox(height: 4.h),
                Text(body,
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: Colors.black87,
                    )),
                SizedBox(height: 6.h),
                Text(date,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.grey,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

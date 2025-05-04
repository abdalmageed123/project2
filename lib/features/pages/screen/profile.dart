import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project2/core/constants/colors.dart';
import 'package:project2/features/pages/widget/buildtitle.dart'; // للترجمة

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'profile_title'.tr,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(height: 10.h),
            
            // أيقونة المستخدم الكبيرة
            CircleAvatar(
              radius: 45.r,
              backgroundColor: Colors.blue.shade100,
              child: Icon(Icons.person, size: 50.sp, color: AppColor.color1),
            ),

            SizedBox(height: 12.h),

            // اسم المستخدم (تقدر تخليها ديناميكية)
            Text(
              'اسم المستخدم',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),

            // البريد أو رقم الهاتف
            Text(
              'email@example.com',
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey,
              ),
            ),

            SizedBox(height: 30.h),

            // خيارات القائمة
            buildTile(Icons.edit, 'edit_profile'.tr, () {}),
            buildTile(Icons.payment, 'payment_methods'.tr, () {}),
            buildTile(Icons.policy, 'privacy_policy'.tr, () {}),
            buildTile(Icons.notifications, 'notifications'.tr, () {}),
          buildTile(Icons.delete_forever, 'delete_account'.tr, () {}),

            Spacer(),

            // زر تسجيل الخروج
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.color1,
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                ),
                child: Text('logout'.tr, style: TextStyle(fontSize: 16.sp,color: Colors.white)),
              ),
            ),

            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

}

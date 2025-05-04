import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project2/core/constants/colors.dart';
import 'package:project2/core/constants/images.dart';
import 'package:project2/core/constants/string.dart';
import 'package:project2/features/controller/teachermain.dart';

class TeacherMainScreen extends GetView<Teachermaincontroller> {
  const TeacherMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Teachermaincontroller());
    return GetBuilder<Teachermaincontroller>(
      builder:
          (controller) => Scaffold(
            drawer: Drawer(),
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '0'.tr,
                    style: TextStyle(
                      color: AppColor.color1,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(Icons.school, color: AppColor.color1),
                ],
              ),
              centerTitle: true,

              actions: [
                IconButton(
                  icon: Icon(Icons.notifications_none, color: Colors.black),
                  onPressed: () {
                    Get.toNamed(AppString.notifications);
                    // تنفيذ عند الضغط على الإشعار
                  },
                ),
              ],
            ),
            body: controller.listPage[controller.currentpage],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: controller.currentpage,
              selectedFontSize: 12.sp,
              unselectedFontSize: 11.sp,
              selectedItemColor: AppColor.color1,
              unselectedItemColor: Colors.grey,
              onTap: (index) {
                controller.changePage(index);
              },
              items: controller.bottombar,
            ),
          ),
    );
  }
}

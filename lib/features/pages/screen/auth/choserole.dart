import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project2/core/constants/colors.dart';
import 'package:project2/core/shared/components/button.dart';
import 'package:project2/features/pages/widget/buildoption.dart';

class ChooseRoleScreen extends StatelessWidget {
  final ValueNotifier<String?> selectedRole = ValueNotifier(null);

  ChooseRoleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 32.h),
              Center(
                child: Text(
                  'create_account'.tr,
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              Center(
                child: Text(
                  'choose_role'.tr,
                  style: TextStyle(fontSize: 16.sp),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 40.h),
              ValueListenableBuilder<String?>(
                valueListenable: selectedRole,
                builder: (context, value, _) {
                  return Column(
                    children: [
                      buildOption(
                        title: 'student'.tr,
                        icon: Icons.person,
                        selected: value == 'student',
                        onTap: () => selectedRole.value = 'student',
                      ),
                      SizedBox(height: 20.h),
                      buildOption(
                        title: 'teacher'.tr,
                        icon: Icons.school,
                        selected: value == 'teacher',
                        onTap: () => selectedRole.value = 'teacher',
                      ),
                    ],
                  );
                },
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: Elevatedbutton( onPressed: () {
                    if (selectedRole.value == null) {
                      Get.snackbar('تنبيه', 'اختر أحد الخيارين');
                    } else {
                      // تنفيذ الإجراء المناسب
                    }
                  },
                text: 'next'.tr,
                ),
              ),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }
}

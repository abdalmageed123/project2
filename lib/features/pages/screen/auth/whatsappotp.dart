import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project2/core/constants/colors.dart';
import 'package:project2/core/constants/images.dart';
import 'package:project2/core/constants/string.dart';
import 'package:project2/core/services/checknet.dart';
import 'package:project2/core/services/sharedprefrence.dart';
import 'package:project2/core/shared/components/button.dart';
import 'package:project2/features/controller/controller.dart';

class WhatsAppOtpScreen extends StatelessWidget {
  final String phoneNumber;

  const WhatsAppOtpScreen({Key? key, required this.phoneNumber})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    Sharedpreferences sharedpreferences = Get.find();
    final AuthController controller = Get.put(AuthController());
    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 30.h),

                // SizedBox(height: 40.h),
                Image.asset(AppImage.whats, height: 100.h),
                SizedBox(height: 30.h),
                Text(
                  'verification_title'.tr,
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 12.h),
                Text(
                  'verification_description'.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14.sp),
                ),
                SizedBox(height: 4.h),
                Text(
                  phoneNumber,
                  style: TextStyle(fontSize: 16.sp, color: Colors.blue),
                ),
                SizedBox(height: 30.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    4,
                    (index) => Container(
                      width: 50.w,
                      height: 60.h,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Center(
                        child: TextField(
                          controller: controller.otpControllers[index],
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          maxLength: 1,
                          decoration: InputDecoration(
                            counterText: '',
                            border: InputBorder.none,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: AppColor.color1),
                            ),
                          ),

                          style: TextStyle(fontSize: 20.sp),
                          onChanged: (value) {
                            if (value.isNotEmpty && index < 3) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20.h),
                GetBuilder<AuthController>(
                  builder:
                      (controller) =>
                          controller.canResend
                              ? TextButton(
                                onPressed: () {
                                  controller.startTimer();
                                  // هنا ترسل كود جديد
                                },
                                child: Text(
                                  'resend_code'.tr,
                                  style: TextStyle(color: Colors.blue),
                                ),
                              )
                              : Text(
                                '${'wait'.tr} ${controller.secondsRemaining}s',
                                style: TextStyle(color: Colors.blue),
                              ),
                ),

                SizedBox(height: 30.h),
                SizedBox(
                  width: double.infinity,
                  child: Elevatedbutton(
                    onPressed: () {
                      if (!controller.validateOtp()) {
                        Get.snackbar(
                          'error'.tr,
                          'otp_invalid'.tr,
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                        );
                        return;
                      }

                      // تحقق ناجح
                      checkConnectionAndNavigate(
                        context,
                        function: () {
                          Get.snackbar(
                            'success'.tr,
                            'otp_valid'.tr,
                            backgroundColor: Colors.green,
                            colorText: Colors.white,
                          );
                          sharedpreferences.set(key: 'step', value: '2');
                          // الانتقال إلى الصفحة الرئيسية بعد تأخير 2 ثانية
                          Future.delayed(Duration(seconds: 2), () {
                            Get.toNamed(AppString.chooserolescreen);
                          });
                        },
                      );

                      // sharedpreferences.set(key: 'step', value: '2');
                    },
                    text: 'confirm_code'.tr,
                  ),
                ),

                // Spacer(),
                SizedBox(height: 30.h),
                Text.rich(
                  TextSpan(
                    text: 'need_help'.tr,
                    children: [
                      TextSpan(
                        text: ' ' + 'contact_us'.tr,
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

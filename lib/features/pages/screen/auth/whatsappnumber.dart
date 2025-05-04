import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project2/core/constants/colors.dart';
import 'package:project2/core/constants/string.dart';
import 'package:project2/core/localization/localization.dart';
import 'package:project2/core/services/checknet.dart';
import 'package:project2/core/services/sharedprefrence.dart';
import 'package:project2/core/shared/components/button.dart';
import 'package:project2/core/utils/validate.dart';
//import 'package:project2/core/localization/localization.dart';// تأكد من تفعيل التوليد

class WhatsAppNumberScreen extends StatelessWidget {
  const WhatsAppNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    GlobalKey<FormState> key = GlobalKey<FormState>();
    Sharedpreferences sharedpreferences = Get.find();
    Get.find<LocalController>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Form(
          key: key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 80.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.school_rounded,
                    color: AppColor.color1,
                    size: 40.sp,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    '0'.tr,
                    style: TextStyle(
                      color: AppColor.color1,
                      fontSize: 28.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 40.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.menu_book_rounded,
                    color: AppColor.color1,
                    size: 28.sp,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    'lets_start'.tr,
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10.h),
              Text(
                "enter_whatsapp_number".tr,
                style: TextStyle(fontSize: 16.sp, color: Colors.black54),
              ),

              SizedBox(height: 30.h),

              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                child: Row(
                  children: [
                    Image.network(
                      'https://flagcdn.com/w40/sy.png',
                      width: 30.w,
                      height: 20.h,
                    ),
                    SizedBox(width: 8.w),
                    Text('+963', style: TextStyle(fontSize: 16.sp)),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: TextFormField(
                        validator: (v) {
                          return validateSyrianWhatsappNumber(v);
                        },
                        controller: controller,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          hintText: "whatsapp_number".tr,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 12.h),
              Text(
                "verification_note".tr,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13.sp, color: Colors.black54),
              ),

              SizedBox(height: 40.h),

            Elevatedbutton(onPressed:(){checkConnectionAndNavigate(
                          context,
                          function: () {
                            Get.offNamed(AppString.whatsappotp);
                                        },
                        );} ,text:'next'.tr,),

              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("need_help".tr, style: TextStyle(fontSize: 13.sp)),
                  SizedBox(width: 4.w),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "contact_us".tr,
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: Colors.blueAccent,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

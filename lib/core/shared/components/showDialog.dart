import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/core/constants/images.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

showDialog1(
  BuildContext context, {
  List<Widget>? action,
  Widget? content,
  Widget? title,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    // ignore: deprecated_member_use
    barrierColor: Colors.black.withOpacity(0.5),
    builder:
        (context) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: title,
          content: content,
          actionsAlignment: MainAxisAlignment.center,
          actions: action,
        ),
  );
}

showDialog2(BuildContext context) {
  return showDialog(
    context: context,
    barrierDismissible: true,
    builder:
        (context) => RatingDialog(
          initialRating: 1.0,
starSize: 25.sp,
          title: Text(
            'Rating Dialog',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
          ),

          message: Text(
            'Tap a star to set your rating. Add more description here if you want.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12.sp),
          ),

          image: Image.asset(AppImage.logo, width: 150.w, height: 150.h),

          submitButtonText: 'Submit',

          submitButtonTextStyle: TextStyle(color: Colors.red, fontSize: 12.sp),

          commentHint: 'Set your custom comment hint',

          onSubmitted: (response) {
            if (response.rating < 3.0) {
              Get.rawSnackbar(
                message: 'سنسعى لنكون عند حسن ظنك في التجربة القادمة',
                title: 'rating',
              );
            } else {
              Get.rawSnackbar(message: 'شكرا على تقييمك', title: 'rating');
            }
          },
        ),
  );
}

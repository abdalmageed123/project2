import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/core/constants/images.dart';
import 'package:rating_dialog/rating_dialog.dart';

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

showDialog2(BuildContext context, String orderid) {
  return showDialog(
    context: context,
    barrierDismissible: true,
    builder:
        (context) => RatingDialog(
          initialRating: 1.0,
          // your app's name?
          title: Text(
            'Rating Dialog',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          // encourage your user to leave a high rating?
          message: Text(
            'Tap a star to set your rating. Add more description here if you want.',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 15),
          ),
          // your app's logo?
          image: Image.asset(AppImage.logo, width: 200, height: 200),
          submitButtonText: 'Submit',
          submitButtonTextStyle: TextStyle(color: Colors.red),
          commentHint: 'Set your custom comment hint',
          onSubmitted: (response) {
          
            // TODO: add your own logic
            if (response.rating < 3.0) {
              Get.rawSnackbar(
                message: 'سنسعى لنكون عند حسن ظنك في التجربة القادمة',
                title: 'rating',
              );
              // send their comments to your email or anywhere you wish
              // ask the user to contact you instead of leaving a bad review
            } else {
              Get.rawSnackbar(message: 'شكرا على تقييمك', title: 'rating');
            }
          },
        ),
  );
}

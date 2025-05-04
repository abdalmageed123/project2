import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final List<TextEditingController> otpControllers = List.generate(
    4,
    (_) => TextEditingController(),
  );

  int secondsRemaining = 60;
  late Timer timer;
  bool canResend = false;

  @override
  void onInit() {
    startTimer();
    super.onInit();
  }

  void startTimer() {
    canResend = false;
    secondsRemaining = 60;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (secondsRemaining > 0) {
        secondsRemaining--;
        update();
      } else {
        canResend = true;
        timer.cancel();
        update();
      }
    });
  }

  String getOtp() {
    return otpControllers.map((c) => c.text).join();
  }

  bool validateOtp() {
    final otp = getOtp();
    return otp.length == 4 && !otp.contains(RegExp(r'[^0-9]'));
  }

  @override
  void onClose() {
    timer.cancel();
    super.onClose();
  }
}

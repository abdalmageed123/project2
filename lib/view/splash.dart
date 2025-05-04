import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/core/constants/images.dart';
import 'package:project2/core/constants/string.dart';
import 'package:project2/core/services/checknet.dart';
import 'package:project2/core/services/sharedprefrence.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Sharedpreferences sharedpreferences = Get.find();
    String? page = sharedpreferences.get(key: 'step');
    if (page == '2') {
      page = AppString.chooserolescreen;
    }if (page == '1') {
      page = AppString.whatappnumber;
    }  else {
      page = AppString.boarding;
    }

    checkConnectionAndNavigate(
      context,
      function: () {
        Get.offAllNamed(page!);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(AppImage.splash), // صورة الـ splash
      ),
    );
  }
}

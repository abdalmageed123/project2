import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/core/services/sharedprefrence.dart';

class LocalController extends GetxController {
  Locale? language;
  Sharedpreferences service = Get.find();
  ThemeData? theme;
  changelang(String lang) {
    language = Locale(lang);
    if (lang == 'ar') {
      //theme = themaribac;
    } else {
      //theme = themenglish;
    }
    service.sharedPreferences.setString('lang', lang);
    Get.updateLocale(language!);
  }

  

  @override
  void onInit() {
    if (service.sharedPreferences.getString('lang') == 'ar') {
      language = const Locale('ar');
      //theme = themaribac;
    } else if (service.sharedPreferences.getString('lang') == 'en') {
      language = const Locale('en');
      //theme = themenglish;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      if (Get.deviceLocale!.languageCode == 'ar') {
        //theme = themaribac;
          service.sharedPreferences.setString('lang', 'ar');
    language = const Locale('ar');
      } else {
          service.sharedPreferences.setString('lang', 'en');
   language = const Locale('en');
        //theme = themenglish;
      }
    }
    super.onInit();
  }
}

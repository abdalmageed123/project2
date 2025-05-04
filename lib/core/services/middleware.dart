import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:project2/core/constants/string.dart';
import 'package:project2/core/services/sharedprefrence.dart';

class Mymiddleware extends GetMiddleware {
  @override
  int? get priority => 1;
 Sharedpreferences sharedpreferences = Get.find();
  RouteSettings? redicet(String route) {
    String boarding=sharedpreferences.get(key: "boarding");
    if ( boarding=='1') {
      return RouteSettings(name: AppString.home);
    }
    return null;
  }
}

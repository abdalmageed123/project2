import 'package:get/get.dart';
import 'package:project2/core/constants/string.dart';
import 'package:project2/main.dart';
import 'package:project2/view/boarding.dart';
import 'package:project2/view/splash.dart';

List<GetPage<dynamic>>? routes = [
  GetPage( name: AppString.splash,page: () => const SplashScreen(),
  ),
GetPage(name: AppString.home, page: () =>MyHomePage(title: 'abd',)),
  GetPage(name: AppString.boarding, page: () =>OnboardingScreen()),
];

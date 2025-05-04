import 'package:get/get.dart';
import 'package:project2/core/constants/string.dart';
import 'package:project2/core/services/middleware.dart';
import 'package:project2/features/pages/screen/auth/choserole.dart';
import 'package:project2/features/pages/screen/auth/whatsappotp.dart';
import 'package:project2/features/pages/screen/auth/whatsappnumber.dart';
import 'package:project2/features/pages/screen/notifications.dart';
import 'package:project2/main.dart';
import 'package:project2/view/boarding.dart';
import 'package:project2/view/splash.dart';

List<GetPage<dynamic>>? routes = [
  
  GetPage( name: AppString.splash,page: () => const SplashScreen(),
  ),GetPage( name: AppString.notifications,page: () => const NotificationsScreen(),),
    GetPage( name: AppString.whatappnumber,page: () => const WhatsAppNumberScreen(),),
     GetPage( name: AppString.chooserolescreen,page: () =>  ChooseRoleScreen(),),
      GetPage( name: AppString.whatsappotp,page: () =>  WhatsAppOtpScreen(phoneNumber: '0994734403',),),
 
GetPage(name: AppString.home, page: () =>MyHomePage(title: 'abd',)),
  GetPage(name: AppString.boarding, page: () =>OnboardingScreen(),middlewares: [Mymiddleware()]),
];

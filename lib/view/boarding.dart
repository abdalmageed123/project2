import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/core/constants/colors.dart';
import 'package:project2/core/constants/images.dart';
import 'package:project2/core/constants/string.dart';
import 'package:project2/core/localization/localization.dart';
import 'package:project2/core/models/onboardingmodel.dart';
import 'package:project2/core/services/checknet.dart';
import 'package:project2/core/services/sharedprefrence.dart';
import 'package:project2/core/shared/components/anmation.dart';
import 'package:project2/core/shared/components/button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;
  late Timer _timer;
  int _currentPage = 0;
  late String selectedLanguage;
  @override
  void initState() {
    super.initState();

    Sharedpreferences sharedpreferences = Get.find();

    selectedLanguage = sharedpreferences.get(key: 'lang');
    _pageController = PageController(initialPage: 0);

    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage < pages.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Sharedpreferences sharedpreferences = Get.find();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    print(width);
    print(height);
    LocalController controller = Get.find();
    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          '0'.tr,
          style: TextStyle(color: AppColor.color1, fontSize: 20.sp),
        ),
        actions: [
          // Language selector dropdown
          PopupMenuButton<String>(
            icon: GetBuilder<LocalController>(
              builder:
                  (controller) => Image.asset(
                    selectedLanguage == 'en' ? AppImage.u : AppImage.s,
                    width: 24.w,
                    height: 24.h,
                  ),
            ),
            onSelected: (String value) {
              setState(() {
                selectedLanguage = value;
                controller.changelang(value);
              });
            },
            itemBuilder:
                (BuildContext context) => [
                  PopupMenuItem(
                    value: 'en',
                    child: Row(
                      children: [
                        Image.asset(
                          AppImage.u,
                          width: 24.w,
                          height: 24.h,
                        ), // USA flag
                        SizedBox(width: 8.w),
                        Text("English", style: TextStyle(fontSize: 14.sp)),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 'ar',
                    child: Row(
                      children: [
                        Image.asset(
                          AppImage.s,
                          width: 24.w,
                          height: 24.h,
                        ), // Saudi flag
                        SizedBox(width: 8.w),
                        Text("العربية", style: TextStyle(fontSize: 14.sp)),
                      ],
                    ),
                  ),
                ],
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 14.w,
        ), // لتحديد المسافة من الجوانب بشكل نسبي
        child: GetBuilder<LocalController>(
          builder:
              (controller) => Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: pages.length,
                      onPageChanged: (int index) {
                        setState(() {
                          _currentPage = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.all(
                            10.w,
                          ), // تقليل padding حول الصورة والنص
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                pages[index].image,
                                height:
                                    270.h, // تخصيص ارتفاع الصورة بالنسبة لحجم الشاشة
                              ),
                              SizedBox(height: 24.h), // مسافة بين الصورة والنص
                              Text(
                                pages[index].title.tr,
                                style: TextStyle(
                                  fontSize:
                                      24.sp, // حجم الخط بالنسبة لعرض الشاشة
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 16.h,
                              ), // مسافة بين العنوان والوصف
                              Text(
                                pages[index].description.tr,
                                style: TextStyle(
                                  fontSize:
                                      14.sp, // حجم الخط بالنسبة لعرض الشاشة
                                  color: Colors.grey[700],
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ), // تقليل المسافة بين الدوائر وزر "لنبدأ"
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      pages.length,
                      (index) => buildDot(index, _currentPage),
                    ),
                  ),
                  SizedBox(height: 20.h), 
                  Elevatedbutton(onPressed:(){checkConnectionAndNavigate(
                          context,
                          function: () {
                            Get.offNamed(AppString.whatappnumber);
                            sharedpreferences.set(key: 'step', value: '1');
                          },
                        );} ,text:'1'.tr,),
                  SizedBox(height: 24.h), // مسافة أسفل الزر
                ],
              ),
        ),
      ),
    );
  }
}

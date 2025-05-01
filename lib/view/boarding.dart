import 'dart:async';

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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    LocalController controller = Get.put(LocalController());
    return Scaffold(
      appBar: AppBar(
        title: Text('0'.tr,style: TextStyle(color:  AppColor.color1,),),
        actions: [
          // Language selector dropdown
          PopupMenuButton<String>(
            icon: GetBuilder<LocalController>(
              builder:
                  (controller) => Image.asset(
                    selectedLanguage == 'en' ? AppImage.u : AppImage.s,
                    width: 24,
                    height: 24,
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
                          width: 24,
                          height: 24,
                        ), // USA flag
                        SizedBox(width: 8),
                        Text("English"),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 'ar',
                    child: Row(
                      children: [
                        Image.asset(
                          AppImage.s,
                          width: 24,
                          height: 24,
                        ), // Saudi flag
                        SizedBox(width: 8),
                        Text("العربية"),
                      ],
                    ),
                  ),
                ],
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.05,
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
                          padding: const EdgeInsets.all(
                            10.0,
                          ), // تقليل padding حول الصورة والنص
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                pages[index].image,
                                height:
                                    height *
                                    0.35, // تخصيص ارتفاع الصورة بالنسبة لحجم الشاشة
                              ),
                              SizedBox(
                                height: height * 0.05,
                              ), // مسافة بين الصورة والنص
                              Text(
                                pages[index].title.tr,
                                style: TextStyle(
                                  fontSize:
                                      width *
                                      0.08, // حجم الخط بالنسبة لعرض الشاشة
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: height * 0.03,
                              ), // مسافة بين العنوان والوصف
                              Text(
                                pages[index].description.tr,
                                style: TextStyle(
                                  fontSize:
                                      width *
                                      0.05, // حجم الخط بالنسبة لعرض الشاشة
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
                    height: height * 0.03,
                  ), // تقليل المسافة بين الدوائر وزر "لنبدأ"
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      pages.length,
                      (index) => buildDot(index, _currentPage),
                    ),
                  ),
                  SizedBox(height: height * 0.03), // مسافة أسفل الدوائر
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        checkConnectionAndNavigate(context,page: AppString.home,of: true);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.color1,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(
                          vertical: height * 0.015,
                        ), // حجم الزر بالنسبة للطول
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        '1'.tr,
                        style: TextStyle(
                          fontSize:
                              width * 0.05, // حجم النص بالنسبة لعرض الشاشة
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.05), // مسافة أسفل الزر
                ],
              ),
        ),
      ),
    );
  }
}

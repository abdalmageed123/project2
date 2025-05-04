import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project2/core/constants/string.dart';
import 'package:project2/core/localization/localization.dart';
import 'package:project2/core/localization/translation.dart';
import 'package:project2/core/services/crud.dart';
import 'package:project2/core/services/sharedprefrence.dart';
import 'package:project2/core/shared/components/showDialog.dart';
import 'package:project2/core/shared/routes/routes.dart';
import 'package:project2/features/pages/screen/teachermain.dart';
import 'package:project2/view/drawer/aboutus.dart';
import 'package:project2/view/drawer/privacy.dart';
import 'package:project2/view/drawer/refundpolicy.dart';
import 'package:project2/view/drawer/term.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialService();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    LocalController controller = Get.put(LocalController());

    return ScreenUtilInit(
      designSize: Size(360, 773),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          home: TeacherMainScreen(),
          //initialRoute: AppString.splash,
          translations: Translation(),
          locale: controller.language,
          getPages: routes,
          debugShowCheckedModeBanner: false,
          theme: controller.theme,
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    Sharedpreferences sharedpreferences = Get.find();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: GetBuilder<LocalController>(
          builder:
              (controller) => ListView(
                padding: EdgeInsets.zero,
                children: [
                  SizedBox(height: 80.h),
                  Icon(Icons.menu, size: 48.sp),
                  SizedBox(height: 20.h),
                  const Divider(),
                  ListTile(
                    leading: Icon(Icons.info_outline, size: 24.sp),
                    title: Text('about'.tr, style: TextStyle(fontSize: 16.sp)),
                    onTap: () => Get.to(AboutUsPage()),
                  ),
                  ListTile(
                    leading: Icon(Icons.lock_outline, size: 24.sp),
                    title: Text('terms'.tr, style: TextStyle(fontSize: 16.sp)),
                    onTap: () => Get.to(TermsPage()),
                  ),
                  ListTile(
                    leading: Icon(Icons.security, size: 24.sp),
                    title: Text(
                      'privacy'.tr,
                      style: TextStyle(fontSize: 16.sp),
                    ),
                    onTap: () => Get.to(PrivacyPage()),
                  ),
                  ListTile(
                    leading: Icon(Icons.refresh, size: 24.sp),
                    title: Text('refund'.tr, style: TextStyle(fontSize: 16.sp)),
                    onTap: () => Get.to(RefundPolicyPage()),
                  ),
                  ListTile(
                    leading: Icon(Icons.star, size: 24.sp),
                    title: Text('rate'.tr, style: TextStyle(fontSize: 16.sp)),
                    onTap: () {
                      showDialog2(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.share, size: 24.sp),
                    title: Text('share'.tr, style: TextStyle(fontSize: 16.sp)),
                    onTap: () {},
                  ),
                  const Divider(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Text(
                      'language'.tr,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        onPressed: () => controller.changelang('ar'),
                        style: TextButton.styleFrom(
                          backgroundColor:
                              controller.language!.languageCode == 'ar'
                                  ? Colors.redAccent
                                  : Colors.grey[200],
                          foregroundColor: Colors.white,
                        ),
                        child: Text(
                          'arabic'.tr,
                          style: TextStyle(fontSize: 14.sp),
                        ),
                      ),
                      TextButton(
                        onPressed: () => controller.changelang('en'),
                        style: TextButton.styleFrom(
                          backgroundColor:
                              controller.language!.languageCode == 'en'
                                  ? Colors.redAccent
                                  : Colors.grey[200],
                          foregroundColor: Colors.white,
                        ),
                        child: Text(
                          'english'.tr,
                          style: TextStyle(fontSize: 14.sp),
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Text(
                      'currency'.tr,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                  DropdownButton<String>(
                    value: 'USD',
                    onChanged: (value) {
                      // controller.changeCurrency(value!);
                    },
                    items: [
                      DropdownMenuItem(
                        value: 'USD',
                        child: Text(
                          'usd'.tr,
                          style: TextStyle(fontSize: 14.sp),
                        ),
                      ),
                    ],
                  ),
                  //SizedBox(height: 20.h),
                  ListTile(
                    leading: Icon(Icons.logout, size: 24.sp),
                    title: Text('logout'.tr, style: TextStyle(fontSize: 16.sp)),
                    onTap: () {
                      Get.offNamed(AppString.whatappnumber);
                      sharedpreferences.set(key: 'step', value: '1');
                    },
                  ), //SizedBox(height: 20.h),
                  Center(
                    child: Text(
                      '${'version'.tr} 1.0.0',
                      style: TextStyle(fontSize: 12.sp),
                    ),
                  ),
                ],
              ),
        ),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for ea          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

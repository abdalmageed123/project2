import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/core/constants/string.dart';
import 'package:project2/core/localization/localization.dart';
import 'package:project2/core/localization/translation.dart';
import 'package:project2/core/services/crud.dart';
import 'package:project2/core/services/sharedprefrence.dart';
import 'package:project2/core/shared/routes/routes.dart';
import 'package:project2/view/drawer/aboutus.dart';
import 'package:project2/view/drawer/privacy.dart';
import 'package:project2/view/drawer/refundpolicy.dart';
import 'package:project2/view/drawer/term.dart';
import 'package:project2/view/splash.dart';

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
    //  Sharedpreferences s = Get.find();
    return GetMaterialApp(
      initialRoute: AppString.splash,
      translations: Translation(),
      locale: controller.language,
      getPages: routes,
      debugShowCheckedModeBanner: false,
      theme: controller.theme,
      home: SplashScreen(),
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
                  const DrawerHeader(child: Icon(Icons.menu, size: 48)),

                  ListTile(
                    leading: Icon(Icons.info_outline),
                    title: Text('about'.tr),
                    onTap: () {
                      Get.to(AboutUsPage());
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.lock_outline),
                    title: Text('terms'.tr),
                    onTap: () {
                      Get.to(TermsPage());
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.security),
                    title: Text('privacy'.tr),
                    onTap: () {
                      Get.to(PrivacyPage());
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.refresh),
                    title: Text('refund'.tr),
                    onTap: () {
                      Get.to(RefundPolicyPage());
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.star),
                    title: Text('rate'.tr),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.share),
                    title: Text('share'.tr),
                    onTap: () {},
                  ),

                  const Divider(),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'language'.tr,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        onPressed: () => controller..changelang('ar'),
                        child: Text('arabic'.tr),
                        style: TextButton.styleFrom(
                          backgroundColor:
                              controller.language!.languageCode == 'ar'
                                  ? Colors.redAccent
                                  : Colors.grey[200],
                          foregroundColor: Colors.white,
                        ),
                      ),
                      TextButton(
                        onPressed: () => controller.changelang('en'),
                        child: Text('english'.tr),
                        style: TextButton.styleFrom(
                          backgroundColor:
                              controller.language!.languageCode == 'en'
                                  ? Colors.redAccent
                                  : Colors.grey[200],
                          foregroundColor: Colors.white,
                        ),
                      ),
                    ],
                  ),

                  const Divider(),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'currency'.tr,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DropdownButton<String>(
                    value: 'USD',
                    onChanged: (value) {
                      //=> controller.changeCurrency(value!)
                    },
                    items: [
                      DropdownMenuItem(value: 'USD', child: Text('usd'.tr)),
                    ],
                  ),

                  const SizedBox(height: 20),
                  Center(child: Text('${'version'.tr} 1.0.0')),
                ],
              ),
        ),
      ),
      body: Center(
 
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
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

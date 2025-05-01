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
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
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
          // wireframe for each widget.
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

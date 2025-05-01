import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Sharedpreferences extends GetxService {
  late SharedPreferences sharedPreferences;
  Future<Sharedpreferences> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }

  get({key}) {
   return sharedPreferences.getString(key);
  }
   set({key,value}) {
    sharedPreferences.setString(key, value);
  }
}

initialService() async {
  await Get.putAsync(() => Sharedpreferences().init());
}

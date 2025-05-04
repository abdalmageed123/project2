import 'package:get/get.dart';

String? validateSyrianWhatsappNumber(String? value) {
  if (value == null || value.isEmpty) {
    return 'enterwhats'.tr;
  }

  // إزالة الفراغات
  value = value.replaceAll(' ', '');

  // Regex لرقم سوري: يبدأ بـ 09 أو +9639 أو 009639 ويتبعه 8 أرقام
  final regex = RegExp(r'^(?:\+?963|00963|0)?9[0-9]{8}$');

  if (!regex.hasMatch(value)) {
    return "invalidwhats".tr;
  }

  return null; // رقم صحيح
}

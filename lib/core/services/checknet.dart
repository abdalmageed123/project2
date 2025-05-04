import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/core/shared/components/showDialog.dart';

Future<void> checkConnectionAndNavigate(
  context, {
  bool b = true,

  Function? function,
}) async {
  final result = await Connectivity().checkConnectivity();

  if (result[0] != ConnectivityResult.none) {
    // في اتصال - الانتقال للهوم
    if (b == true) {
      Future.delayed(
        const Duration(seconds: 2),
        function as FutureOr Function()?,
      );
    } else {
      Navigator.pop(context);
      Future.delayed(
        const Duration(seconds: 2),
        function as FutureOr Function()?,
      );
    }
  } else {
    // لا يوجد اتصال - إظهار نافذة تنبيه
    if (b) {
      showDialog1(
        context,
        content: const Text(
          'لا يوجد اتصال بالإنترنت',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
        title: const Icon(Icons.wifi_off, size: 64, color: Colors.redAccent),
        action: [
          ElevatedButton(
            onPressed: () {
              checkConnectionAndNavigate(context, b: false, function: function);
              //Navigator.pop(context);// إعادة المحاولة
            },
            child: const Text('إعادة المحاولة'),
          ),
        ],
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('تأكد من الاتصال بالأنترنت'),
          duration: Duration(seconds: 1),
        ),
      );
    }
  }
}

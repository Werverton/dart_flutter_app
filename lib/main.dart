import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:baid_health_dev/controller/auth_controller.dart';
import 'package:baid_health_dev/screens/login.dart';
import 'dart:io';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(GetMaterialApp(
    home: LoginScreen(),
    debugShowCheckedModeBanner: false,
    initialBinding: BindingsBuilder(() {
      Get.lazyPut<AuthController>(() => AuthController());
    }),
  ));
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

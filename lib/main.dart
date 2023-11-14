import 'package:baid_health_dev/controller/care_plan_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:baid_health_dev/controller/user_controller.dart';
import 'package:baid_health_dev/screens/login_screen.dart';
import 'dart:io';
import 'package:baid_health_dev/controller/auth_controller.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(GetMaterialApp(
    home: loginScreen(),
    debugShowCheckedModeBanner: false,
    initialBinding: BindingsBuilder(() {
      Get.lazyPut<UserController>(() => UserController());
      //Get.lazyPut(() => CarePlanController(myHttpClient: myHttpClient))
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

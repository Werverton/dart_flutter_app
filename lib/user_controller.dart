import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:baid_health_dev/model/user.dart';
import 'package:baid_health_dev/screens/homescreen.dart';

class UserController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  void onInit() {
    super.onInit();
  }

  String token = '';

  void setToken(String newToken) {
    token = newToken;
  }

  ///final user = User().obs;

  Future<void> fetchUser() async {
    //final String email = emailController.text;
    //final String password = passwordController.text;
    final response = await http.post(
      Uri.parse('https://baid.devlivery.com.br/api/auth/login'),
      body: json.encode({
        "username": emailController.text,
        "password": passwordController.text,
      }),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.acceptHeader: "application/json"
      },
    );

    if (response.statusCode == 200) {
      //final Map<String, dynamic> userData = json.decode(response.body);
      //user.value = User.fromJson(userData);
      final Map<String, dynamic> userData = json.decode(response.body);

      final data = json.decode(response.body);
      final token = data['token'];
      print(token);
      Get.to(() => HomeScreen());
    } else {
      print("Login mal sucedido");
    }
  }
}

import 'dart:io';

import 'package:baid_health_dev/controller/user_controller.dart';
import 'package:baid_health_dev/model/user.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get/get.dart';
import 'package:baid_health_dev/controller/auth_controller.dart';
import 'package:baid_health_dev/screens/profile/homescreen.dart';
import 'dart:developer' as developer;

class LoginScreen extends StatelessWidget {
  
  final UserController userController = Get.put(UserController());


  @override
  Widget build(BuildContext context) {
    //UserController userController = Get.find<UserController>();
    return Scaffold(
      appBar: AppBar(title: Text('Tela de Login')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: userController.emailController,
                decoration: InputDecoration(labelText: 'E-mail'),
              ),
              TextField(
                controller: userController.passwordController,
                decoration: InputDecoration(labelText: 'Senha'),
                obscureText: true,
              ),
              ElevatedButton(
                onPressed: ()=> userController.loginUser(),
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

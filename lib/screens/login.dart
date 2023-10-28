import 'dart:io';

import 'package:baid_health_dev/user_controller.dart';
import 'package:baid_health_dev/model/user.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get/get.dart';
import 'package:baid_health_dev/controller/auth_controller.dart';
import 'package:baid_health_dev/screens/homescreen.dart';
import 'dart:developer' as developer;

class LoginScreen extends StatelessWidget {
  //UserController userController;

  //UserController userController = Get.find<UserController>();
  final UserController userController = Get.put(UserController());

  //final TextEditingController emailController = TextEditingController();
  //final TextEditingController passwordController = TextEditingController();
/*
  void _login() async {
    //final String email = emailController.text;
    //final String password = passwordController.text;

    

    if (userController.user.value.token.isNotEmpty) {
      /*
    final response = await http.post(
      Uri.parse('https://baid.devlivery.com.br/api/auth/login'),
      body: json.encode({
        "username": "${email}",
        "password": "${password}",
      }),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.acceptHeader: "application/json"
      },
    );
    print(response.body);

    if (response.statusCode == 200) {
      final Map<String, dynamic> userData = json.decode(response.body);

      final data = json.decode(response.body);
      final token = data['token'];

      // Armazene o token no GetX para uso posterior
      //Get.find<UserController>().fetchUser(userData);
      //Get.find<AuthController>().setToken(token);
      developer.log('Mostrando se deu certo', name: jsonEncode(token));

      // Navegue para a tela inicial*/
      Get.off(() => HomeScreen());
    } else {
      // Lidar com erro de login
      Get.snackbar(
        'Erro de Login',
        'Credenciais inválidas. Por favor, tente novamente.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }*/

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
                onPressed: ()=> userController.fetchUser(),
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

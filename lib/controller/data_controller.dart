/*import 'dart:async';
import 'dart:io';

import 'package:baid_health_dev/controller/user_controller.dart';
import 'package:baid_health_dev/model/user.dart';
import 'package:baid_health_dev/screens/user_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DataController extends GetxController {
  final UserController userController = Get.put(UserController());
  //var user = User().obs;

  Future<void> getDataUser() async {
    var user = await fetchData();
    print(user.name);
    print(user.email);
    print(user.genero);
    // ignore: unnecessary_null_comparison
    if (user != null) {
      Get.to(() => UserData());
    } else {
      Get.snackbar('Erro', 'Falha ao carregar os dados.');
    }
  }

  Future<User> fetchData() async {
    try {
      final response = await http.get(
        Uri.parse('https://baid.devlivery.com.br/api/users/me'),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.authorizationHeader: 'Bearer ${userController.token}'
        },
      );

      if (response.statusCode == 200) {
        final jsonData = response.body;
        print(jsonData);
        return User.fromRawJson(jsonData);
      } else {
        // Trate o erro ou status de resposta diferente de 200 conforme necessário
        // Exemplo: mostrar uma mensagem de erro
        Get.snackbar('Erro', 'Falha ao carregar os dados.');
        throw "";
      }
    } catch (error) {
      // Trate erros de conexão, etc.
      // Exemplo: mostrar uma mensagem de erro
      Get.snackbar('Erro', 'Falha na conexão.');
      print(error);
      throw (error);
    }
  }
}
*/
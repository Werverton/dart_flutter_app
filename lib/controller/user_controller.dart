import 'dart:io';

import 'package:baid_health_dev/model/doenca.dart';
import 'package:baid_health_dev/screens/profile/doencas_screen.dart';
import 'package:baid_health_dev/screens/profile/habitos_screen.dart';
import 'package:baid_health_dev/widgets/navbar_roots.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:baid_health_dev/model/user.dart';

import 'package:baid_health_dev/screens/home_screen.dart';
import 'package:baid_health_dev/services/remote_services.dart';

class UserController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //campos para editar o perfil
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController cardSusController = TextEditingController();
  final TextEditingController healthUnityIdController = TextEditingController();
  final TextEditingController diabetesTypeIdController =
      TextEditingController();
  final TextEditingController diabetesTimeController = TextEditingController();
  final TextEditingController doencasController = TextEditingController();
  final TextEditingController habitosController = TextEditingController();

  var user = User().obs;

  var doencasList2 = <Doenca>[].obs;

  var habitosList = <Habito>[].obs;

  RxString token = ''.obs;

  void setToken(String newToken) {
    token.value = newToken;
  }

  Future<void> getDataUser() async {
    var user = await fetchData();
  }

  Future<User> fetchData() async {
    try {
      final response = await http.get(
        Uri.parse('https://baid.devlivery.com.br/api/users/me'),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.authorizationHeader: 'Bearer ${token}'
        },
      );

      if (response.statusCode == 200) {
        final jsonData = response.body;
        print(jsonData);
        user.value = User.fromRawJson(jsonData);
        //Get.to(UserData());
        return user.value;
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

  Future<void> loginUser() async {
    final response = await http.post(
      Uri.parse('https://baid.devlivery.com.br/api/auth/login'),
      body: json.encode({
        "username": emailController.text,
        "password": passwordController.text,
      }),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
      },
    );
    print(response);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final token = data['token'];
      setToken(token);
      fetchData();
      //fetchHabito();
      //fetchDoencas();

      Get.to(() => NavBarRoots()); // Passe o usuário para a HomeScreen
    } else {
      Get.snackbar(
        'Erro de Login',
        'Credenciais inválidas. Por favor, tente novamente.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  //Future<List<Doenca>> fetchDoencas() async {
  void fetchDoencas() async {
    var doencas = await RemoteServices.getDoencas(token.string);

    if (doencas.isNotEmpty) {
      doencasList2.value = doencas;
      Get.to(() => DoencasScreen());
    } else {
      print("erro");
    }
  }

  void fetchHabito() async {
    var habitos = await RemoteServices.getHabitos(token.string);
    if (habitos.isNotEmpty) {
      habitosList.value = habitos;
      Get.to(() => HabitosScreen()); //criar a screen de hábitos
    } else {
      print("erro");
    }
  }

  void editUser() async {}
}

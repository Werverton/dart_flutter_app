import 'dart:io';
import 'dart:convert';

import 'package:baid_health_dev/model/itens_care_plan.dart';
import 'package:baid_health_dev/model/user.dart';
import 'package:baid_health_dev/screens/profile/doencas_screen.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import 'package:baid_health_dev/model/doenca.dart';

const urlBase = 'https://baid.devlivery.com.br';

class RemoteServices {
  static var client = http.Client();
  //final String url;
  //final dynamic body;

  //RequestServices({required this.url, this.body});

  static Future<String> loginUser(String email, String pass) async {
    var response = await http.post(
      Uri.parse('https://baid.devlivery.com.br/api/auth/login'),
      body: json.encode({"username": "${email}", "password": "${pass}"}),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.acceptHeader: "application/json",
      },
    );
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return jsonString;
    } else {
      return "erro";
    }
  }

  static Future<http.Response> getData(String token) async {
    print(token);
    final response = await http.get(
      Uri.parse('https://baid.devlivery.com.br/api/users/me'),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.acceptHeader: "application/json",
        HttpHeaders.authorizationHeader: "Bearer ${token}"
      },
    );
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception();
    }
  }

  static Future<List<Doenca>> getDoencas(String token) async {
    print(token);
    final response = await client.get(
      Uri.parse('https://baid.devlivery.com.br/api/doencas'),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.acceptHeader: "application/json",
        HttpHeaders.authorizationHeader: "Bearer ${token}"
      },
    );
    if (response.statusCode == 200) {
      //var jsonString = json.decode(response.body);
      var doencas = Doenca.doencaFromJson(response.body);

      return doencas;
    } else {
      throw Exception();
    }
  }

  static Future<List<Habito>> getHabitos(String token) async {
    final response = await client.get(
      Uri.parse('https://baid.devlivery.com.br/api/habitos'),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.acceptHeader: "application/json",
        HttpHeaders.authorizationHeader: "Bearer ${token}"
      },
    );
    if (response.statusCode == 200) {
      //var jsonString = json.decode(response.body);
      print(response);
      var habitos = Habito.habitoFromJson(response.body);

      return habitos;
    } else {
      throw Exception();
    }
  }

  static Future<String> getItensCarePlan(String token) async {
    final response = await client.get(
      Uri.parse('https://baid.devlivery.com.br/api/plano-cuidado'),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.acceptHeader: "application/json",
        HttpHeaders.authorizationHeader: "Bearer ${token}"
      },
    );
    if (response.statusCode == 200) {
      print(response.body);

      return response.body;
    } else {
      throw Exception();
    }
  }
}

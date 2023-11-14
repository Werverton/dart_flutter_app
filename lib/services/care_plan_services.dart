import 'dart:io';
import 'dart:convert';
import 'package:baid_health_dev/model/itens_care_plan.dart';
import 'package:http/http.dart' as http;

class MyService {
  //final http.Client client;

  //MyHttpClient({required this.http});
  
  

  Future<List<ItemCarePlan>> getItensCarePlan(String token) async {
    final response = await http.get(
      Uri.parse('https://baid.devlivery.com.br/api/plano-cuidado'),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.acceptHeader: "application/json",
        HttpHeaders.authorizationHeader: "Bearer ${token}"
      },
    );
    if (response.statusCode == 200) {
      print(response.body);
      //var jsonString = json.decode(response.body);
      // Decodifique a string JSON em uma lista de objetos JSON
      List<Map<String, dynamic>> jsonList = json.decode(response.body);

      // Extraia a lista de itens do JSON
      List<Map<String, dynamic>> itemJsonList = jsonList[0]['itens'];

      // Converta a lista de itens em objetos ItemCarePlan
      List<ItemCarePlan> itemCarePlanList = itemJsonList
          .map((itemJson) => ItemCarePlan.fromJson(itemJson))
          .toList();

      return itemCarePlanList;
    } else {
      throw Exception();
    }
  }
}

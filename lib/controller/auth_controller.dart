import 'package:get/get.dart';
import 'package:http/http.dart';

class AuthController extends GetxController {
  String token = '';

  void setToken(String newToken) {
    token = newToken;
  }

  
}

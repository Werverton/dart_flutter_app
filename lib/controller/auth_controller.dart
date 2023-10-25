import 'package:get/get.dart';

class AuthController extends GetxController {
  String token = '';

  void setToken(String newToken) {
    token = newToken;
  }
}

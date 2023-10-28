import 'package:baid_health_dev/screens/doencas_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:baid_health_dev/user_controller.dart';

class HomeScreen extends StatelessWidget {
  //final UserController userController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tela Inicial')),
      body: Center(child: Obx(() {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Bem-vindo à sua tela inicial!'),
            Text('Olá, '),
            //Text('Name: ${userController.user.value.name}'),
            //Text('Email: ${userController.user.value.email}'),
            ElevatedButton(
              onPressed: () {
                // Exemplo de como fazer outra solicitação usando o token armazenado
                final token = Get.find<UserController>().token;

                print(token);
                Get.off(() => DoencasScreen());
                // Faça sua solicitação HTTP aqui com o token, se necessário
              },
              child: Text('Fazer outra solicitação'),
            ),
          ],
        );
      })),
    );
  }
}

import 'package:baid_health_dev/screens/doencas_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:baid_health_dev/controller/auth_controller.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tela Inicial')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Bem-vindo à sua tela inicial!'),
            ElevatedButton(
              onPressed: () {
                // Exemplo de como fazer outra solicitação usando o token armazenado
                final token = Get.find<AuthController>().token;
                print(token);
                Get.off(()=> DoencasScreen());
                // Faça sua solicitação HTTP aqui com o token, se necessário
              },
              child: Text('Fazer outra solicitação'),
            ),
          ],
        ),
      ),
    );
  }
}

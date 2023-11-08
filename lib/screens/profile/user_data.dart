import 'package:baid_health_dev/controller/data_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:baid_health_dev/controller/user_controller.dart';
import 'package:baid_health_dev/model/user.dart';

class UserData extends StatelessWidget {
 
  final UserController userController = Get.put(UserController());
  //final DataController dataController = Get.put(DataController());
  //var user = User().obs;
  

  @override
  Widget build(BuildContext context) {
    print(userController.user.value.name);
    return Scaffold(
      appBar: AppBar(title: Text('Tela Inicial')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Bem-vindo à sua tela inicial!'),
            Obx(() {
              if (userController.user.value != null) {
                return Column(
                  children: [
                    Text(
                        'Olá, ${userController.user.value.name}'), // Exibe o nome do usuário
                    Text(
                        'Email: ${userController.user.value.email}'), // Exibe o email do usuário
                    // Adicione mais widgets para outros dados do usuário
                  ],
                );
              } else {
                return Text(
                    'Carregando dados do usuário...'); // Exibe uma mensagem enquanto os dados são carregados
              }
            }),
            ElevatedButton(
              onPressed: () async {
                try {
                  await () => userController.fetchData();
                } catch (error) {
                  Get.snackbar('Erro', error.toString());
                }
              },
              child: Text('Buscar Dados do Usuário'),
            ),
          ],
        ),
      ),
    );
  }
}

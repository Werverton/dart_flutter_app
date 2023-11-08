/*import 'package:baid_health_dev/controller/data_controller.dart';
import 'package:baid_health_dev/model/user.dart';
import 'package:baid_health_dev/screens/profile/doencas_screen.dart';
import 'package:baid_health_dev/screens/profile/edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:baid_health_dev/controller/user_controller.dart';
import 'package:baid_health_dev/screens/care_plan/colesterol_screen.dart';
import 'package:baid_health_dev/screens/care_plan/pressao_arterial_screen.dart';

class HomeScreen extends StatelessWidget {
  final UserController userController = Get.put(UserController());
  //final DataController dataController = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tela Inicial')),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            UserSection(),
            //DiseaseSection(),
            //HabitsSection(),
          ],
        ),
      ),
    );
  }
}

class UserSection extends StatelessWidget {
  final UserController userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      color: Colors.blue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Informações do Usuário',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Obx(
            () => ListTile(
              leading: Icon(Icons.person),
              title: Text('Nome: ${userController.user.value.name}'),
              subtitle:
                  Text('Idade: ${userController.user.value.dtNascimento}'),
            ),
          ),
          Obx(
            () => ListTile(
              leading: Icon(Icons.email),
              title: Text('Email:  ${userController.user.value.email}'),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => userController.fetchDoencas(),
                child: Text('Ir para doenças'),
              ),
              ElevatedButton(
                onPressed: () => Get.to(() => EditProfile()),
                child: Text('Editar Perfil'),
              ),
              ElevatedButton(
                onPressed: () => userController.fetchHabito(),
                child: Text('Ir para habitos'),
              ),
            ],
          )
        ],
      ),
    );
  }
}

*/
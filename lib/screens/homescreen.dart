import 'package:baid_health_dev/controller/data_controller.dart';
import 'package:baid_health_dev/model/user.dart';
import 'package:baid_health_dev/screens/doencas_screen.dart';
import 'package:baid_health_dev/screens/edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:baid_health_dev/controller/user_controller.dart';

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
            DiseaseSection(),
            HabitsSection(),
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
            children: [ElevatedButton(
                onPressed: ()=> userController.fetchDoencas(),
                child: Text('Ir para doenças'),
              ),
          ElevatedButton(
                onPressed: ()=>Get.to(()=>EditProfile()),
                child: Text('Editar Perfil'),
              ),],
          )
        ],
      ),
    );
  }
}
class DiseaseSection extends StatelessWidget {
  //final List<Disease> diseases;

  //DiseaseSection({required this.diseases});
  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      color: const Color.fromARGB(255, 54, 190, 244),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Informações de Doença',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Obx(() =>  ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: userController.doencasList2.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('Doença: ${userController.doencasList2[index].nome}'),
              );
            },
          ),),
        ],
      ),
    );
  }
}

class HabitsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      color: Colors.green,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Hábitos',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          ListTile(
            leading: Icon(Icons.restaurant),
            title: Text('Alimentação: Vegetariano'),
          ),
          ListTile(
            leading: Icon(Icons.directions_run),
            title: Text('Exercícios: Corrida, Yoga'),
          ),
        ],
      ),
    );
  }
}

import 'dart:convert';
import 'package:baid_health_dev/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class HabitosScreen extends StatelessWidget {
  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informações de doença'),
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: userController.habitosList.length,
          itemBuilder: (context, index) {
            //final item = userController.doencasList2[index];
            return Obx(() => 
            ListTile(
              
              title: Text('Nome: ${userController.habitosList[index].nome}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      //Get.to(ItemEditScreen(item)); // Navigate to edit screen
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      //itemController.deleteItem(item); // Delete the item
                    },
                  ),
                ],
              ),
            ));
          },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Get.to(ItemCreateScreen()); // Navigate to create screen
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
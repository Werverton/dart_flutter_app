import 'dart:convert';
import 'package:baid_health_dev/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class DoencasScreen extends StatelessWidget {
  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informações de doença'),
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: userController.doencasList2.length,
          itemBuilder: (context, index) {
            //final item = userController.doencasList2[index];
            return Obx(() => 
            ListTile(
              
              title: Text('Nome: ${userController.doencasList2[index].nome}'),
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

class ItemController extends GetxController {
  final RxList<Item> items = <Item>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchItems();
  }

  Future<void> fetchItems() async {
    final response = await http.get(Uri.parse('YOUR_API_ENDPOINT'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      items.assignAll(data.map((itemData) => Item.fromJson(itemData)).toList());
    }
  }

  void deleteItem(Item item) {
    // Implement delete item logic here
  }
}

class Item {
  final int id;
  final String name;

  Item(this.id, this.name);

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      json['id'] as int,
      json['name'] as String,
    );
  }
}




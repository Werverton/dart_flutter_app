import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class DoencasScreen extends StatelessWidget {
  final ItemController itemController = Get.put(ItemController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item List'),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: itemController.items.length,
          itemBuilder: (context, index) {
            final item = itemController.items[index];
            return ListTile(
              title: Text(item.name),
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
            );
          },
        ),
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




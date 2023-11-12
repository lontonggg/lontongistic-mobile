import 'package:flutter/material.dart';

class InventoryList extends StatelessWidget {
  static List<Item> items = [];

  const InventoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventory List'),
        backgroundColor: Colors.lightGreen,
        foregroundColor: Colors.white,
      ),
      body: Builder(
        builder: (BuildContext context) {
          if (items.isEmpty) {
            return const Center(
              child: Text(
                'There are no items in your Inventory',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(
                      items[index].name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                        'Amount: ${items[index].amount}\nCategory: ${items[index].category}\nDescription: ${items[index].description}'),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

class Item {
  final String name;
  final int amount;
  final String category;
  final String description;

  Item({
    required this.name,
    required this.amount,
    required this.category,
    required this.description,
  });
}
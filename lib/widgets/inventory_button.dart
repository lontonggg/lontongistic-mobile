import 'package:flutter/material.dart';
import 'package:lontongistic/screens/add_item_form.dart';
import 'package:lontongistic/screens/inventory_list.dart';

class InventoryButton{
  final String name;
  final IconData icon;
  final Color color;

  InventoryButton(this.name, this.icon, this.color);
}

class InventoryCard extends StatelessWidget {
  final InventoryButton item;

  const InventoryCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      child: InkWell(
        // Area responsive terhadap sentuhan
         onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("You have pressed the ${item.name} button!")));

          // Navigate ke route yang sesuai (tergantung jenis tombol)
          if (item.name == "Add Item") {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const AddItemFormPage()));
          }
          else if(item.name == "Your Inventory") {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const InventoryList()));
          }

        },
        child: Container(
          // Container untuk menyimpan Icon dan Text
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

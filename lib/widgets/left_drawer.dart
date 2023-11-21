import 'package:flutter/material.dart';
import 'package:lontongistic/screens/list_product.dart';
import 'package:lontongistic/screens/menu.dart';
import 'package:lontongistic/screens/add_item_form.dart';
import 'package:lontongistic/screens/inventory_list.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.lightGreen,
            ),
            child: Column(
              children: [
                Text(
                  'Lontongistic',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text(
                  'Your digital inventory maestro!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.white
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Main Page'),
            // Bagian redirection ke MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_box_outlined),
            title: const Text('Add Item'),
            // Bagian redirection ke AddItemFormPage
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddItemFormPage(),
                ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.list),
            title: const Text('Your Inventory'),
            // Bagian redirection ke InventoryList
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const InventoryList(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.shopping_basket),
            title: const Text('Daftar Produk'),
            onTap: () {
              // Route menu ke halaman produk
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProductPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}


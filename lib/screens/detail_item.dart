// ignore_for_file: unnecessary_string_interpolations, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:lontongistic/models/item.dart';
import 'package:lontongistic/screens/list_item.dart';
import 'package:lontongistic/widgets/left_drawer.dart';

class DetailItem extends StatelessWidget {
  final Item item;

  const DetailItem(this.item, {super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Lontongistic',
        ),
        backgroundColor: Colors.lightGreen,
        foregroundColor: Colors.white,
      ),
      drawer: LeftDrawer(),
      body: Padding(
        padding: EdgeInsets.all(5),
        child : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height : 10),
            Text("Amount : ${item.fields.amount}"),
            Text("Category : ${item.fields.category}"),
            Text("Date Added : ${item.fields.dateAdded}"),
            const SizedBox(height: 10),
            Text("${item.fields.description}"),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.lightGreen),
                  ),
                  onPressed: (){
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context) => ItemPage()));
                  },
                   child: const Text(
                    "Back",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ), 
      )
    );
  }
}
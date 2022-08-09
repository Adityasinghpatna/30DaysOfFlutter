import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/pages/widgets/drawer.dart';
import 'package:flutter_application_1/pages/widgets/item_widget.dart';

class HomePage extends StatelessWidget {
  final int days = 30;
  final String name = "Aditya";
  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(20, (index) => CatalogModel.items[0]);
    return Scaffold(
      drawer: Mydrawer(),
      appBar: AppBar(
        title: Text(
          "Catalog App",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: dummyList.length,
          itemBuilder: (context, index) {
            return ItemWidget(
              item: dummyList[index],
              key: UniqueKey(),
            );
          },
        ),
      ),
    );
  }
}

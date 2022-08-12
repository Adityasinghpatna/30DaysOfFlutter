import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/pages/widgets/drawer.dart';
import 'package:flutter_application_1/pages/widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = "ADITYA";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodeData = jsonDecode(catalogJson);
    var productsData = decodeData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
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
        child: (CatalogModel.items != null && CatalogModel.items!.isNotEmpty)
            ? GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                ),
                itemCount: CatalogModel.items!.length,
               itemBuilder: (context, index) {
                final item = CatalogModel.items![index];
                 return Card(
                  clipBehavior: Clip.antiAlias,
                 shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)), 
                  child: GridTile(
                    header: Container(child: Text(
                      item.name,
                      style: TextStyle(color: Colors.white),
                      ),
                    padding:const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                    ),
                    ),
                    child: Image.network(item.image),
                    footer:Container(child: Text(
                      item.price.toString(),
                      style: TextStyle(color: Colors.white),
                      ),
                    padding:const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.black,
                    ),
                    ),
                  ));
                  
               },
               
               ) : Container(),
               )
              );
              Center(
                child: CircularProgressIndicator(),
              );
  }
}

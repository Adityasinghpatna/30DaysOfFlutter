import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/models/cart.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/pages/widgets/home_widgets/catalog_header.dart';
import 'package:flutter_application_1/pages/widgets/home_widgets/catalog_list.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = "ADITYA";

  final Url = "https://api.jsonbin.io/v3/b/62fb48ebe13e6063dc7d5975";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    try {
      //await Future.delayed(Duration(seconds: 2));
      // final catalogJson =
      // await rootBundle.loadString("assets/files/catalog.json");

      final response = await http.get(Uri.parse(Url), headers: {
        "X-Access-Key":
            "\$2b\$10\$gPiPGsoH.ikKcWTJITRyyeArOwdnlD1oqSlv5KxcKrROCn3FOmGXu"
      }).catchError((error) {
        print(error);
      });
      print(response.body);
      final catalogJson = response.body;

      final decodeData = jsonDecode(catalogJson);
      if (decodeData.containsKey("record")) { 
        final recordData = decodeData["record"];
        if (recordData.containsKey("products")) {
          var productsData = recordData["products"];
          CatalogModel.items = List.from(productsData)
              .map<Item>((item) => Item.fromMap(item))
              .toList();
          setState(() {});
        }
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
        backgroundColor: context.canvasColor,
        floatingActionButton: VxBuilder(
          mutations: {AddMutation, RemoveMutation},
          builder: (ctx, _, __) => FloatingActionButton(
            onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
            backgroundColor: context.backgroundColor,
            child: Icon(
              CupertinoIcons.cart,
              color: Colors.white,
            ),
          ).badge(
              color: Vx.gray200,
              size: 22,
              count: _cart!.items.length,
              textStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              )),
        ),
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                if (CatalogModel.items != null &&
                    CatalogModel.items!.isNotEmpty)
                  CatalogList().py16().expand()
                else
                  CircularProgressIndicator().centered().expand(),
              ],
            ),
          ),
        ));
  }
}

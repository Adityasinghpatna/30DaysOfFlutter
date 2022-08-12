import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
     appBar: AppBar(
      backgroundColor: Colors.deepPurple,
      title: "Cart".text.make(),
     ),
    );
    
  }
}
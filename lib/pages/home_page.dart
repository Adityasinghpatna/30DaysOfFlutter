import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/widgets/drawer.dart';

class HomePage extends StatelessWidget {
 final int days = 30;
   final String name = "Aditya";
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Mydrawer(),
      appBar:AppBar(
        title: Text("Catalog App",
        style: TextStyle(color: Colors.black), ),
         ),
        body:Center(
          child:Container(
          child:Text("Welcome to $days days of flutter by $name"),
          ),
        )   
      );
  }
}
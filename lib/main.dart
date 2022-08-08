import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/login%20page.dart';
import 'package:flutter_application_1/pages/widgets/themes.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    themeMode: ThemeMode.light,
      theme:MyTheme.lighttheme(context),
      darkTheme: MyTheme.darktheme(context),
        debugShowCheckedModeBanner: false,
        initialRoute: MyRoutes.homeRoute,
        routes: {
          "/":(context) => LoginPage(),
          MyRoutes.homeRoute:(context) => HomePage(),
          MyRoutes.loginRoute :(context) => LoginPage()
        } ,
      );  
  }
}
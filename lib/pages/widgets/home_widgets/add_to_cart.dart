import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/cart.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';
class addToCart extends StatefulWidget {
 final Item catalog;
  const addToCart({
    Key? key, required this.catalog,
  }) : super(key: key);

  @override
  State<addToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<addToCart> {
 final _cart = CartModel();
  
  @override
  Widget build(BuildContext context) {
     bool isInCart = _cart.items.contains(widget.catalog) ?? false;
    return ElevatedButton(
      onPressed: () {
       
        if (!isInCart) {
          
        final catalog = CatalogModel();
       
        _cart.catalog = catalog;
         _cart.add(widget.catalog);
        setState(() {});
        }
      },
      style: ButtonStyle(
        backgroundColor:
         MaterialStateProperty.all(
          context.backgroundColor,
          ),
          shape: MaterialStateProperty.all(StadiumBorder(),
          )
          ),
       child: isInCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus),
    );
  }
}
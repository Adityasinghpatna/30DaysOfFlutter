import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/models/cart.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';
class addToCart extends StatelessWidget {
 final Item catalog;
   addToCart({
    Key? key, required this.catalog,
  }) : super(key: key);

 
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation]);
 final CartModel? _cart = (VxState.store as MyStore).cart;
     bool isInCart = _cart!.items.contains(catalog) ?? false;
    return ElevatedButton(
      onPressed: () {
       
        if (!isInCart) {
         AddMutation(catalog);
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
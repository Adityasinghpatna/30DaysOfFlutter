import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/cart.dart';
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

     body: Column(
      children: [
        _CartList().p32().expand(),
        Divider(),
        _CartTotal(),
      ],
     ),
    );
    
  }
}


class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     final _cart = CartModel();
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$${_cart.totalPrice}".text.xl5.color(context.theme.accentColor).make(),
          30.widthBox,
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: "Buying not supported yet.".text.make(),
                ));
            },
            style: ButtonStyle(backgroundColor:
             MaterialStateProperty.all(context.backgroundColor)
             ),
           child: "Buy".text.white.make(),
           ).w32(context)
        ],
      ),
    );
    
  }
}

class _CartList extends StatefulWidget {
  @override
  State<_CartList> createState() => _CartListState();
}

class _CartListState extends State<_CartList> {
  final _cart = CartModel();
 @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _cart.items?.length,
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.done),
        trailing: IconButton(
          icon:Icon(Icons.remove_circle_outline),
          onPressed: () {},
          ),
          title: _cart.items[index].name.text.make(),
      ),
      
    );
    
  }
}
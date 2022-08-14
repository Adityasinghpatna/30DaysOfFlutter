import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/cart.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/pages/home_detail_page.dart';
import 'package:flutter_application_1/pages/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import 'catalog_image.dart';


class CatalogList extends StatelessWidget {
 @override
  Widget build(BuildContext context) { 
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items!.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items![index];
        return InkWell(
          onTap: () => Navigator.push(context,
           MaterialPageRoute(
            builder: ((context)=>HomeDetailPage(
            catalog:catalog,
            )
            ),
            ),
            ),
          child: CatalogItem(catalog: catalog));  
      }
      );  
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({super.key, required this.catalog});
  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage(
              image: catalog.image,
              ),
          ),
             Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [catalog.name.text.lg.color(context.accentColor).bold.make(),
                catalog.desc.text.textStyle(context.captionStyle).make(),
                //10.heightBox,
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: EdgeInsets.zero,
                  children: [
                    "\$${catalog.price}".text.bold.xl.make(),
                    Center(
                      child: _addToCart(catalog:catalog),
                    )
                  ],
                ) .pOnly(right: 2.0)
                ],
                )
              )
          
        ],
      )
    ).color(context.cardColor).rounded.square(120).make().py16();
    
  }
}

class _addToCart extends StatefulWidget {
 final Item catalog;
  const _addToCart({
    Key? key, required this.catalog,
  }) : super(key: key);

  @override
  State<_addToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<_addToCart> {

   bool isAdded = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        isAdded = isAdded.toggle();
        final catalog = CatalogModel();
        final _cart = CartModel();
        _cart.catalog = catalog;
         _cart.add(widget.catalog);
        setState(() {});
      },
      style: ButtonStyle(
        backgroundColor:
         MaterialStateProperty.all(
          context.backgroundColor,
          ),
          shape: MaterialStateProperty.all(StadiumBorder(),
          )
          ),
       child: isAdded ? Icon(Icons.done) : "Add to cart".text.make(),
    );
  }
}
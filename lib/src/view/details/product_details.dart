import 'package:bag_bliss/core/colors.dart';
import 'package:bag_bliss/src/model/product_model.dart';
import 'package:flutter/material.dart';

import 'widgets/detail_tile.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key,required this.item, required this.id});
final ProductDetails item;
final String id;
  @override
  Widget build(BuildContext context) {
     var size = MediaQuery.of(context).size;
    // var height = size.height;
    var width = size.width;
    return Scaffold(
      backgroundColor: appbar,
      appBar: buildAppBar(width),
      body:  DetailstTile(items: item,id: id ),
    );
  }

  AppBar buildAppBar(double width) {
    return AppBar(
      backgroundColor: appbar,
      iconTheme: const IconThemeData(color: white),
      // actions: [ const Icon(Icons.favorite_border_outlined,size: 35,),
      // SizedBox(width:width*0.1)
      // ],
    );
  }
}
import 'package:bag_bliss/core/colors.dart';
import 'package:bag_bliss/src/view/details/widgets/body.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
     var size = MediaQuery.of(context).size;
    // var height = size.height;
    var width = size.width;
    return Scaffold(
      backgroundColor: appbar,
      appBar: buildAppBar(width),
      body: const ProductBody(),
    );
  }

  AppBar buildAppBar(double width) {
    return AppBar(
      backgroundColor: appbar,
      iconTheme: const IconThemeData(color: white),
      actions: [ const Icon(Icons.favorite_border_outlined,size: 35,),
      SizedBox(width:width*0.1)
      ],
    );
  }
}

import 'package:flutter/material.dart';
import '../../../../core/colors.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({
    super.key,
    required this.height,
    required this.width, 
    required this.itemName, 
    required this.itemImage, 
    required this.discripation,
    required this.price, 
  });

  final double height;
  final double width;
  final String itemName;
  final String itemImage;
  final String discripation;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          elevation: 5,
          child: Container(
            // height: height*0.27,
            width: width*0.4,
            color: white,
            child: Column(
              children: [
                Stack(
                  children:[ Container(
                  height: height*0.21,
                  width: width*0.35,
                  // color: black,
                  decoration:  BoxDecoration(
                    image: DecorationImage(image: AssetImage(itemImage),
                    fit: BoxFit.cover)
                  ),
                  ),
                  
                   Positioned(
                    right: 0,
                     child: IconButton(onPressed: () {},
                      icon: const Icon(Icons.favorite_border_outlined,color: white,)),
                   )
                  ]
                ),
                 Text(itemName,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                 SizedBox(height: height*0.01),
                 Text(discripation,style: const TextStyle(fontSize: 11,color: boxcolorstock),),
                //  SizedBox(height: height*0.01),
                 Text(price,style: const TextStyle(fontSize: 13,fontWeight: FontWeight.bold),),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
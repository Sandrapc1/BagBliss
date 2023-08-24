import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/colors.dart';
import '../../categories/categories.dart';

class Productcategories extends StatelessWidget {
  const Productcategories({
    super.key,
    required this.height,
    required this.width, 
    required this.imagePath, 
    required this.productName, required this.categoryStream,
  });

  final double height;
  final double width;
  final String imagePath;
  final String productName;
final Stream<QuerySnapshot<Map<String, dynamic>>>? categoryStream;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to( CategoriesScreen(categoryStream:categoryStream ,));
      },
      child: Stack(
       alignment: Alignment.center,
        children: [
          // Container(
          // color: boxcolorfill,
          // height: height*0.2,width: width*0.4,
          // ),
          Container(
           height: height*0.2,width: width*0.29,
             //
          decoration:  BoxDecoration(
             // color: red,
             border:Border.all(color: white),
            shape: BoxShape.circle,
            image: DecorationImage(image: AssetImage(imagePath),fit: BoxFit.cover)
            ),
          ),
           Positioned(
           bottom: 6,
           
           child: Text(productName))
        ]
      ),
    );
    
  }
}
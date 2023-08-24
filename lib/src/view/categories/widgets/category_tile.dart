import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/colors.dart';
import '../../categories/categories.dart';

class ProductcategoriesTile extends StatelessWidget {
  const ProductcategoriesTile({
    super.key,
    required this.height,
    required this.width, 
    required this.imagePath, 
    required this.categoryName,
     required this.categoryStream,
  });

  final double height;
  final double width;
  final String imagePath;
  final String categoryName;
final Stream<QuerySnapshot<Map<String, dynamic>>>? categoryStream;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to( CategoriesScreen(categoryStream:categoryStream, categoryName: categoryName ,));
      },
      child: Stack(
       alignment: Alignment.center,
        children: [
          Container(
           height: height*0.2,width: width*0.3,
          decoration:  BoxDecoration(
             border:Border.all(color: white),
            shape: BoxShape.rectangle,
            image: DecorationImage(image: AssetImage(imagePath),fit: BoxFit.cover)
            ),
          ),
           Positioned(
           bottom: 6,
           
           child: Text(categoryName))
        ]
      ),
    );
    
  }
}
import 'package:bag_bliss/src/view/brands/brand_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Brandproducts extends StatelessWidget {
  const Brandproducts({
    super.key,
    required this.height,
    required this.width,
    required this.brandsImage, 
  });

  final double height;
  final double width;
  final String brandsImage;


  @override
  Widget build(BuildContext context) {
    return Stack(
     alignment: Alignment.center,
      children: [
        InkWell(
          onTap: () {
            Get.to(const BrandScreen());
          },
          child: Container(
           height: height*0.2,width: width*0.29,
          decoration:BoxDecoration(
               border:Border.all(),
            shape: BoxShape.rectangle,
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            image: DecorationImage(image: AssetImage(brandsImage),fit: BoxFit.cover)
            ),
          ),
        ),
      ]
      );
  }
}

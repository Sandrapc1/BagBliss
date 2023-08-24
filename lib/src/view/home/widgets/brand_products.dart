import 'package:bag_bliss/src/view/brands/brand_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Brandproducts extends StatelessWidget {
  const Brandproducts({
    super.key,
    required this.height,
    required this.width,
    required this.brandsImage,
    required this.brandStream,
     required this.brandName,
  });

  final double height;
  final double width;
  final String brandsImage;
  final String brandName;
  final Stream<QuerySnapshot<Map<String, dynamic>>>? brandStream;

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      InkWell(
        onTap: () {
          Get.to(BrandScreen(brandStream: brandStream, brandName:brandName,));
        },
        child: Container(
          height: height * 0.2,
          width: width * 0.29,
          decoration: BoxDecoration(
              border: Border.all(),
              shape: BoxShape.rectangle,
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              image: DecorationImage(
                  image: AssetImage(brandsImage), fit: BoxFit.cover)),
        ),
      ),
    ]);
  }
}

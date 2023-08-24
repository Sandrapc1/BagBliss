import 'package:flutter/material.dart';

class ProductsDetails extends StatelessWidget {
  const ProductsDetails({
    Key? key,
    required this.height,
    required this.width,
    // required this.itemName,
    required this.itemImage,
  }) : super(key: key);

  final double height;
  final double width;
  // final String itemName;
  final String itemImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          borderRadius: BorderRadius.circular(10),
          elevation: 50,
          child: Container(
            height: height * 0.27,
            width: width * 0.4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: height * 0.21,
                      width: width * 0.36,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(itemImage), // Use itemImage here
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                // SizedBox(height: height * 0.01),
                // Text(
                //   itemName,
                //   style: const TextStyle(
                //     fontWeight: FontWeight.bold,
                //     fontSize: 16,
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

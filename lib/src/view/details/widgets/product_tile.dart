import 'package:flutter/material.dart';
import '../../../../core/colors.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Lino Perros',style: TextStyle(color: white,fontSize: 28,fontWeight: FontWeight.bold),
        ),
        SizedBox(height: height*0.01,),
        const Text('Women Printed Sling Bag',style: TextStyle(color: white,fontSize: 15)),
        SizedBox(height: height*0.02,),
        Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(text: const TextSpan(children: [TextSpan(text: 'Price\n',style: TextStyle(fontSize: 18)),
            TextSpan(text: 'Rs 1500',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 27)),
            ]),
          ),
          Image.asset('assets/images/removebg.png',
          fit: BoxFit.fill,
          width: width*0.5,
          height: height*0.3),
          ],
        ),
        ],
      ),
    );
  }
}
import 'package:bag_bliss/src/model/product_model.dart';
import 'package:flutter/material.dart';
import '../../../../core/colors.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({
    super.key, required this.items });
 final ProductDetails items;
  @override
  Widget build(BuildContext context) {
     var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: height*0.02),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Text(
                items.name!
                ,style: const TextStyle(color: white,fontSize: 30,fontWeight: FontWeight.bold),
        ),
               IconButton(onPressed: () {
                
              }, 
              icon: const Icon(Icons.favorite_border_outlined,size: 35,)),

             ],
           ),
        SizedBox(height: height*0.01,),
         Text(items.category!,style: const TextStyle(color: white,fontSize: 21)),
        // SizedBox(height: height*0.02,),
        Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(text:  TextSpan(children: [const TextSpan(text: 'Price\n',style: TextStyle(fontSize: 20)),
            TextSpan(text: items.price!,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 30)),
            ]),
          ),
          Image.network(items.image!,
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
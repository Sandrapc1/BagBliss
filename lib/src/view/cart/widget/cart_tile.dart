import 'package:bag_bliss/src/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/colors.dart';



class CardTile extends StatelessWidget {

  final cartcontroller=Get.put( CartController());

   CardTile({
    super.key,
    required this.id, 
    required this.price, 
    required this.totalprice, 
    required this.count,
  });

  final String id;
  final int price;
  final int totalprice;
  final int count;
  

  @override
  Widget build(BuildContext context) {
     var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Container(
      height:height*0.12,
      width: width*0.93,
      // color: black,
      decoration: BoxDecoration(
        color: boxcolorfill,
        borderRadius: BorderRadius.circular(5)
      ),
      child: Row(
        children: [
          Container(
            height: height*0.09,
            width: width*0.25,
            // color: red,
            decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/HandheldBag.jpg'))),
          ),
          // SizedBox(width: width*0.02),
            Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
           const Text('Lino Perros'),
           const Text('Off-White Quilted Handheld Bag'),
            SizedBox(height:height*0.01),
           Row(
             children: [
               const Text('Rs 1500',style: TextStyle(fontWeight: FontWeight.bold),),
               SizedBox(width: width*0.09),
                IconButton(icon:const Icon( Icons.remove_circle,color: black,) ,onPressed:() {
                //  cartcontroller.addToCart(CartModel.products[index]);
               }, ),
               SizedBox(width: width*0.028),
               const Text('1',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                SizedBox(width: width*0.028),
               const Icon(Icons.add_circle,color: black)
             ]
           ),
            ],
           ),
           SizedBox(width: width*0.18),
           const Icon(Icons.delete,color: red,size: 30,),
        ],
        
      ),
    );
  }
}
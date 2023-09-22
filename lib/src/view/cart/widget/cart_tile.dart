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
    return FutureBuilder(
      future: cartcontroller.getTheProduct(id),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {  
        // print('.......................${snapshot.data}');
        if (snapshot.hasData) {
          return  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height:height*0.12,
          width: width*0.7,
          // color: black,
          decoration: BoxDecoration(
            color: boxcolorfill,
            borderRadius: BorderRadius.circular(5)
          ),
          child: Row(
            children: [
              Container(
                height: height*0.09,
                width: width*0.19,
                // color: red,
                decoration:  BoxDecoration(image: DecorationImage(image: NetworkImage(snapshot.data!['image'][0]))),
              ),
              SizedBox(width: width*0.02),
                Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text(snapshot.data!['name'],style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                 SizedBox(height:height*0.00),
               const Text('Printed Bucket Quilted Handheld Bag',style: TextStyle(fontSize: 10),),
                // SizedBox(height:height*0.01),
               Row(
                 children: [
                    Text('₹ ${price.toString()}',style: const TextStyle(fontSize: 17,color: appbar),),
                   SizedBox(width: width*0.01),
                    IconButton(icon:const Icon( Icons.remove_circle,color: black,size: 22,),
                  onPressed:() {
                     if(count>1){
                      cartcontroller.decrementProductCount(snapshot.data['id']);
                      cartcontroller.calculateCartTotalPrice();
                    }
                    
                    //  cartcontroller.addToCart(CartModel.products[index]);
                   }, ),
                    Text(count.toString(),style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                    
                  IconButton(onPressed: () {
                   cartcontroller.incrementProductCount(snapshot.data['id']); 
                   cartcontroller.calculateCartTotalPrice();
                  }, 
                  icon: const Icon(Icons.add_circle,color: black,size: 22,))
                  
                   ]
               ),
                ],
               ),
               SizedBox(width: width*0.07),
                IconButton(onPressed: () {
                  cartcontroller.removeFromCart(id);
                  cartcontroller.calculateCartTotalPrice();

               }, 
               icon: const Icon(Icons.delete,color: red,size: 30,)),
            ],
            
          ),
        ),
      );
      }
      return const SizedBox();
      }
    );
  
  }
}
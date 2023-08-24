// import 'package:bag_bliss/core/colors.dart';
// import 'package:bag_bliss/src/controller/cart_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'widget/cart_body.dart';

// // ignore: must_be_immutable
// class CartScreen extends StatelessWidget {
//    CartScreen({super.key});

//  final CartController cartcontroller=Get.put(CartController());

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     var height = size.height;
//     var width = size.width;
//     return Scaffold(
//       appBar: AppBar(
//         iconTheme: const IconThemeData(color: white),
//         backgroundColor: appbar,
//         title: const Text(
//           'Cart',
//           style: TextStyle(color: white),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.only(top: height * 0.03, left: width * 0.023),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Body(
//                 height: height,
//                 width: width,
//                 id: '',
//                 price: 1,
//                 totalprice: 1,
//                 count: 1,
//               ),
//               SizedBox(height: height * 0.6),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Column(
//                     children: [
//                       const Text(
//                         'Total Price',
//                         style: TextStyle(color: appbar, fontSize: 17),
//                       ),
//                       SizedBox(height: height * 0.01),
//                       const Text('1600')
//                     ],
//                   ),
//                   SizedBox(width: width * 0.3),
//                   Container(
//                     height: height * 0.05,
//                     width: width * 0.45,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(5), color: appbar),
//                     child: InkWell(
//                       onTap: () {
//                         // Get.to(const CheckoutScreen());
//                       },
//                       child: const Center(
//                         child: Text(
//                           'CHECKOUT',
//                           style: TextStyle(color: white, fontSize: 16),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:bag_bliss/core/colors.dart';
import 'package:bag_bliss/src/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  final CartController cartController = Get.put(CartController());
 CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbar,
        iconTheme: const IconThemeData(color: white),
        title: const Text('Shopping Cart',style: TextStyle(color: white),),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: cartController.cartItems.length,
          itemBuilder: (context, index) {
            final cartItem = cartController.cartItems[index];
            return ListTile(
              
              // title: Text(cartItem.name),
              subtitle: Text('Price: \$${cartItem.price}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () {
                      cartController.removeFromCart(cartItem.id);
                    },
                  ),
                  Text('${cartItem.quantity}'),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      cartController.addToCart(cartItem);
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Total: \$${cartController.total.toStringAsFixed(2)}'),

             Container(
                    height: height * 0.05,
                    width: width * 0.45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5), color: appbar),
                    child: InkWell(
                      onTap: () {
                        // Get.to(const CheckoutScreen());
                      },
                      child: const Center(
                        child: Text(
                          'CHECKOUT',
                          style: TextStyle(color: white, fontSize: 16),
                        ),
                      ),
            // ElevatedButton(
            //   onPressed: () {
            //     // Implement checkout logic here
            //   },
            //   child: const Text('Checkout'),
            // ),
          
        )
             )
        ],
        ),
      ),
    );
  }
}
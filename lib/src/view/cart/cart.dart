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

import 'package:bag_bliss/src/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../model/cart_model.dart';

class CartScreen extends StatelessWidget {
  final CartController cartController = Get.put(CartController());

  CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: cartController.cartProducts.length,
                itemBuilder: (context, index) {
                  final cartItem =
                      cartController.cartProducts.values.toList()[index];
                  final product = cartItem['product'] as CartModel;
                  final quantity = cartItem['quantity'] as int;

                  return ListTile(
                    title: Text(product.id),
                    subtitle: Text('Quantity: $quantity'),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        cartController.removeFromCart(product.id);
                      },
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
              'Total Price: \$${cartController.totalPrice.toStringAsFixed(2)}'),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Implement checkout logic here
            },
            child: const Text('Checkout'),
          ),
        ],
      ),
    );
  }
}

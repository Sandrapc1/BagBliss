// import 'package:bag_bliss/core/colors.dart';
// import 'package:bag_bliss/src/view/cart/widget/cart_body.dart';
// import 'package:bag_bliss/src/view/payment/payment_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class CheckoutScreen extends StatelessWidget {
//   const CheckoutScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     var height = size.height;
//     var width = size.width;
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: appbar,
//         iconTheme: const IconThemeData(color: white),
//         title: const Text(
//           'Checkout',
//           style: TextStyle(color: white),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.only(left: width * 0.05, top: height * 0.03),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 // alignment: Alignment.center,
//                 height: height * 0.13,
//                 width: width * 0.9,
//                 decoration: BoxDecoration(
//                   // color: black,
//                   border: Border.all(color: appbar),
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     const Icon(
//                       Icons.location_on_outlined,
//                       color: boxcolorstock,
//                       size: 38,
//                     ),
//                     SizedBox(width: width * 0.02),
//                     const Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           'Home',
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold, fontSize: 20),
//                         ),
//                         Text('ponnum kunnu house thrissur dbhbb',
//                             style:
//                                 TextStyle(color: boxcolorstock, fontSize: 10))
//                       ],
//                     ),
//                     SizedBox(width: width * 0.32),
//                     IconButton(
//                         onPressed: () {},
//                         icon: const Icon(
//                           Icons.edit_document,
//                           color: boxcolorstock,
//                           size: 29,
//                         ))
//                   ],
//                 ),
//               ),
//               SizedBox(height: height * 0.02),
//               const Text(
//                 'Order List',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: height * 0.02),
//               Body(height: height, width: width),
//               SizedBox(height: height * 0.02),
//               Body(height: height, width: width),
//               SizedBox(height: height * 0.02),
//               Body(height: height, width: width),
//               SizedBox(height: height * 0.02),
//               const Text('Amount',
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//               SizedBox(height: height * 0.02),
//               Container(
//                 alignment: Alignment.center,
//                 height: height * .13,
//                 width: width * 0.9,
//                 decoration: BoxDecoration(
//                     border: Border.all(color: appbar),
//                     borderRadius: BorderRadius.circular(10)),
//                 child:  Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                      const Row(
//                       crossAxisAlignment:  CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         Text('Amount'),
//                         Text('5000'),
//                   ]),
//                   SizedBox(height: height * 0.01),
//                      const Row(
//                       crossAxisAlignment:  CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [Text('Shipping'),
//                         Text('50')],
//                     ),
//                     SizedBox(height: height * 0.01),
//                     const Text('-----------------------------------------------------------------------------------',style: TextStyle(color: boxcolorstock)),
//                     const Row(
//                       crossAxisAlignment:  CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [Text('Total',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
//                         Text('5500',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15))],
//                     ),
//                   ],
//                 ),
//              ),
//               SizedBox(height: height * 0.02),
//               Center(
//                 child: Container(
//                   alignment: Alignment.bottomCenter,
//                   height: height * 0.05,
//                   width: width * 0.7,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(5), color: appbar),
//                   child: InkWell(
//                     onTap: () {
//                       Get.to(const Paymentscreen());
//                     },
//                     child: const Center(
//                       child: Text(
//                         'CONTINUE',
//                         style: TextStyle(color: white, fontSize: 18),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

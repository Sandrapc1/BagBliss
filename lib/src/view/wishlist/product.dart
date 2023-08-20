

// import 'package:bag_bliss/src/model/wishlist_models.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../controller/wishlist_controller.dart';

// class Products extends StatelessWidget {
//   const Products({
//     Key? key,
//     required this.height,
//     required this.width,
//     required this.itemName,
//     required this.itemImage,
//     required this.price,
//   }) : super(key: key);

//   final double height;
//   final double width;
//   final String itemName;
//   final String itemImage;
//   final String price;

//   @override
//   Widget build(BuildContext context) {
//     final WishListController wishlistController = Get.put(WishListController());
//     final String id = 'product_$itemName'; 
//     return Column(
//       children: [
//         Material(
//           borderRadius: BorderRadius.circular(10),
//           elevation: 50,
//           child: Container(
//             height: height * 0.27,
//             width: width * 0.4,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: Column(
//               children: [
//                 Stack(
//                   children: [
//                     Container(
//                       height: height * 0.21,
//                       width: width * 0.35,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         image: DecorationImage(
//                           image: NetworkImage(itemImage),
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       right: 0,
//                       child: FutureBuilder(
//                         future: wishlistController.existInWishlist(id),
//                         builder:(context, snapshot) {  
//                           bool isexisit=snapshot.data?? false;
//                          return IconButton(
//                           onPressed: () {
//                          wishlistController.addToWishlist(WishListModel(id: id));
//                           },
//                           icon:  Icon(
//                             isexisit
//                                   ? Icons.favorite_border_outlined
//                                   : Icons.favorite,
//                               color: isexisit
//                                   ? Colors.black
//                                   : Colors.red,
//                             ),
                        
//                         );
//                         }
//                       ),
//                     ),
//                   ],
//                 ),
//                 // SizedBox(height: height * 0.02),
//                 Text(
//                   itemName,
//                   style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
//                 ),
//                 Text(
//                   price,
//                   style: const TextStyle(fontSize: 12),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

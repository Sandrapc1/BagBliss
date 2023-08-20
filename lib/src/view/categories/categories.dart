// // ignore_for_file: sized_box_for_whitespace
// import 'package:bag_bliss/colors/colors.dart';
// import 'package:bag_bliss/src/controller/categoris_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'widgets/product_details.dart';

// // List<Map<String, String>> imagePath = [
// //   {'imagePath': 'assets/images/categ1.jpg', 'productName': 'Cross Bag'},
// //   {'imagePath': 'assets/images/catgr3.jpg', 'productName': 'Tote Bag'},
// //   {'imagePath': 'assets/images/cart3.jpg', 'productName': 'Shoulder Bag'},
// //   {'imagePath': 'assets/images/Clutch2.jpg', 'productName': 'Clutches Bag'},
// //   {
// //     'imagePath': 'assets/images/MessengerBag.jpg',
// //     'productName': 'Messengerr Bag'
// //   },
// //   {'imagePath': 'assets/images/brand.jpg', 'productName': 'Tote Bag'},
// // ];
// final CategoriesController categoriesController =
//     Get.put(CategoriesController());

// class CategoriesScreen extends StatelessWidget {
//   const CategoriesScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     var height = size.height;
//     var width = size.width;
//     return Scaffold(
//         appBar: AppBar(
//             backgroundColor: appbar,
//             title: const Text(
//               'Categories',
//               style: TextStyle(color: white),
//             )),
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: EdgeInsets.only(top: height * 0.03),
//             child: Column(
//               children: [
//                 Obx(() {
//                   if (categoriesController.categoriesList.isEmpty) {
//                     return const Center(
//                       child: CircularProgressIndicator());
//                   }else{
//                     return Container(
//                       height: height,
//                       child: StreamBuilder(
//                         stream:categoriesController.categorieProduct.snapshots() ,
//                        builder: (context, snapshot) {
//                        return  GridView.builder(
//                           physics: const NeverScrollableScrollPhysics(),
//                           shrinkWrap: true,
//                           itemCount: categoriesController.categoriesList.length,
//                           itemBuilder: (context, index) {
//                             return ProductsDetails(
//                               height: height, width: width,
//                               itemImage:categoriesController.categoriesList[index]['image']!,
//                               itemName: categoriesController.categoriesList[index]['name']!,
//                               // price: itemPath[index]['price']!,
//                             );
//                           },
//                           gridDelegate:
//                               const SliverGridDelegateWithFixedCrossAxisCount(
//                                   crossAxisCount: 2,
//                                   //  crossAxisSpacing: 0,
//                                   mainAxisSpacing: 1,
//                                   childAspectRatio: (.3 / .38)),
//                         );
//                        }
//                       ),
//                     );
//                   }
//                 }
//                     )
//               ],
//             ),
//           ),
//         ));
//   }
// }


// import 'package:bag_bliss/core/colors.dart';
// import 'package:bag_bliss/src/controller/categoris_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'widgets/product_details.dart';

// final CategoriesController categoriesController =
//     Get.put(CategoriesController());


// class CategoriesScreen extends StatelessWidget {
//   const CategoriesScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     var height = size.height;
//     var width = size.width;
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: appbar,
//         title: const Text(
//           'Categories',
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//       body: StreamBuilder(
//         stream:categoriesController.fetchCategories(),
//         builder:(context, snapshot) {
//           return 
//          SingleChildScrollView(
//           child: Padding(
//             padding: EdgeInsets.only(top: height * 0.03),
//             child: Column(
//               children: [
//                 Obx(() {
//                   if (categoriesController.categoriesList.isEmpty) {
//                     return const Center(
//                       child: CircularProgressIndicator(),
//                     );
//                   } else {
//                     return Container(
//                       height: height,
//                       child: GridView.builder(
//                         physics: const NeverScrollableScrollPhysics(),
//                         shrinkWrap: true,
//                         itemCount: categoriesController.categoriesList.length,
//                         itemBuilder: (context, index) {
//                         //   Set<String> categories=Set();
//                         //  for (var element in snapshot.data) {
                           
//                         //  }
//                           return ProductsDetails(
//                             height: height,
//                             width: width,
//                             itemImage: categoriesController.categoriesList[index]['image']!,
//                             itemName: categoriesController.categoriesList[index]['name']!,
//                           );
//                         },
//                         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 2,
//                           mainAxisSpacing: 1,
//                           childAspectRatio: (.3 / .38),
//                         ),
//                       ),
//                     );
//                   }
//                 }),
//               ],
//             ),
//           ),
//         );
//         },
//       ),
//     );
//   }
// }


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/colors.dart';
import '../../controller/categoris_controller.dart';
import 'widgets/product_details.dart';
// import 'controller/categoris_controller.dart'; // Adjust the import path

class CategoriesScreen extends StatelessWidget {
  final CategoriesController categoriesController = Get.put(CategoriesController());
 CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: white),
        backgroundColor: appbar,
        title: const Text(
          'Categories',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: StreamBuilder<List<DocumentSnapshot>>(
        stream: categoriesController.fetchCategories(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Error loading categories'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('Categories Is Empty'),
            );
          } else {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(top: height * 0.03),
                child: Container(
                  height: height,
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return ProductsDetails(
                        height: height,
                        width: width,
                        itemImage: snapshot.data![index]['image'] as String,
                        itemName: snapshot.data![index]['name'] as String,
                      );
                    },
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 1,
                      childAspectRatio: (.3 / .38),
                    ),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

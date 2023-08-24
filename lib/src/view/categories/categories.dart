// ignore_for_file: sized_box_for_whitespace
import 'package:bag_bliss/src/controller/categoris_controller.dart';
import 'package:bag_bliss/src/view/home/widgets/product_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/colors.dart';

final CategoriesController categoriesController =
    Get.put(CategoriesController());

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.categoryStream});
  final Stream<QuerySnapshot<Map<String, dynamic>>>? categoryStream;
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
              style: TextStyle(color: white),
            )),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: height * 0.03),
            child: Column(
              children: [
                Container(
                  height: height,
                  child: StreamBuilder(
                      stream: categoryStream,
                      builder: (context, snapshot) {
                        // print('------------${snapshot.data!.docs}');
                        if (snapshot.hasData) {
                          return GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              final DocumentSnapshot productsnapshot =
                                      snapshot.data!.docs[index];
                              return ProductCard(
                                  height: height,
                                  width: width,
                                  itemName: productsnapshot['name'],
                                  itemImage:  productsnapshot['image'][0],
                                  price: productsnapshot['price'],
                                  id: productsnapshot['id'],
                                  brand: productsnapshot['brand'],
                                  quantity: productsnapshot['quantity'],
                                  description: productsnapshot['description'],
                                  category: productsnapshot['category']);
                            },
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    //  crossAxisSpacing: 0,
                                    mainAxisSpacing: 1,
                                    childAspectRatio: (.3 / .38)),
                          );
                        }
                        return Center(child: CircularProgressIndicator());
                      }),
                )
              ],
            ),
          ),
        ));
  }
}


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


// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../core/colors.dart';
// import '../../controller/categoris_controller.dart';
// import 'widgets/product_details.dart';
// // import 'controller/categoris_controller.dart'; // Adjust the import path

// class CategoriesScreen extends StatelessWidget {
//   final CategoriesController categoriesController = Get.put(CategoriesController());
//  CategoriesScreen({super.key});

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
//           'Categories',
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//       body: StreamBuilder<List<DocumentSnapshot>>(
//         stream: categoriesController.fetchCategories(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           } else if (snapshot.hasError) {
//             return const Center(
//               child: Text('Error loading categories'),
//             );
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return const Center(
//               child: Text('Categories Is Empty'),
//             );
//           } else {
//             return SingleChildScrollView(
//               child: Padding(
//                 padding: EdgeInsets.only(top: height * 0.03),
//                 child: Container(
//                   height: height,
//                   child: GridView.builder(
//                     physics: const NeverScrollableScrollPhysics(),
//                     shrinkWrap: true,
//                     itemCount: snapshot.data!.length,
//                     itemBuilder: (context, index) {
//                       return ProductsDetails(
//                         height: height,
//                         width: width,
//                         itemImage: snapshot.data![index]['image'] as String,
//                         itemName: snapshot.data![index]['name'] as String,
//                       );
//                     },
//                     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       mainAxisSpacing: 1,
//                       childAspectRatio: (.3 / .38),
//                     ),
//                   ),
//                 ),
//               ),
//             );
//           }
//         },
//       ),
//     );
//   }
// }

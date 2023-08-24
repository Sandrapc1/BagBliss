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
  const CategoriesScreen({super.key, required this.categoryStream, required this.categoryName});
  final Stream<QuerySnapshot<Map<String, dynamic>>>? categoryStream;
  final String categoryName;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
        appBar: AppBar(
            iconTheme: const IconThemeData(color: white),
            backgroundColor: appbar,
            title:  Text(
             categoryName,
              style: const TextStyle(color: white),
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
                        return const Center(child: CircularProgressIndicator());
                      }),
                )
              ],
            ),
          ),
        ));
  }
}

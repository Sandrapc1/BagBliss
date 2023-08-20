// ignore_for_file: sized_box_for_whitespace
import 'dart:developer';
import 'package:bag_bliss/core/colors.dart';
import 'package:bag_bliss/src/controller/wishlist_controller.dart';
import 'package:bag_bliss/src/view/home/widgets/product_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final WishListController wishcontroller = Get.put(WishListController());

class WishList extends StatelessWidget {
  const WishList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    log(wishcontroller.existingProduct.toString());
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: white),
        backgroundColor: appbar,
        title: const Text(
          'WishList',
          style: TextStyle(color: white),
        ),
      ),
      body: Obx(() => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(17.0),
          child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
              mainAxisSpacing: 2,
              crossAxisSpacing: 1,
              childAspectRatio: (.3/ .37)
                    ),
                    shrinkWrap: true,
                    physics:const NeverScrollableScrollPhysics() ,
                itemCount: wishcontroller.existingProduct.length,
                itemBuilder: (context, index) {
                  return StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('products')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return const Text('Error loading product');
                        } else if (!snapshot.hasData) {
                          return const Text('Product not found');
                        } else {
                          var products = snapshot.data!.docs.toList();
                          var product = products.firstWhere((element) =>
                              element.id == wishcontroller.existingProduct[index]);
                            
                          return ProductCard(
                            height: height,
                            width: width,
                            itemImage: product['image'][0]!,
                            itemName: product['name']!,
                            price: product['price']!,
                            id: product['id'],
                          );
                        }
                      });
                },
              ),
        ),
      )),
    );
  }
}




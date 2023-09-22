// ignore_for_file: use_key_in_widget_constructors, unused_element
import 'package:bag_bliss/core/colors.dart';
import 'package:bag_bliss/src/controller/cart_controller.dart';
import 'package:bag_bliss/src/view/cart/cart.dart';
import 'package:bag_bliss/src/view/home/widgets/home_tile.dart';
import 'package:bag_bliss/src/view/search/search.dart';
import 'package:bag_bliss/src/view/widget/drawer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key});

  final CarouselController carouselController = CarouselController();
  final CartController cartController = Get.put(CartController());
  // int currentindex=0;

  @override
  Widget build(BuildContext context) {
    final CollectionReference product =
        FirebaseFirestore.instance.collection('products');
    void deleteproduct(docId) {
      product.doc(docId).delete();
    }
    return Scaffold(
      appBar: AppBar(
        actionsIconTheme: const IconThemeData(color: white),
        backgroundColor: appbar,
        title: const Text(
          'Bag Bliss',
          style: TextStyle(
            color: white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                color: Colors.black,
                offset: Offset(2, 2),
                blurRadius: 4,
              ),
            ],
          ),
        ),
        iconTheme: const IconThemeData(color: white),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(SearchScreen());
            },
            icon: const Icon(
              Icons.search,
              size: 30,
            ),
          ),
          const SizedBox(width: 3),
          IconButton(
            onPressed: () {
              cartController.calculateCartTotalPrice();
              Get.to(CartScreen());
            },
            icon: const Icon(
              Icons.shopping_cart_rounded,
              size: 30,
            ),
          ),
        ],
      ),
      drawer: DrawerBar(),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Home_Tile()
        ),
      ),
    );
  }
}



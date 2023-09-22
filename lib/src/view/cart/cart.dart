import 'package:bag_bliss/core/colors.dart';
import 'package:bag_bliss/src/controller/addres_controller.dart';
import 'package:bag_bliss/src/controller/cart_controller.dart';
import 'package:bag_bliss/src/view/cart/widget/cart_tile.dart';
import 'package:bag_bliss/src/view/checkout/checkout_scree.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';


class CartScreen extends StatelessWidget {
  final CartController cartController = Get.put(CartController());
    final AddressController addresssController = Get.put(AddressController());

  CartScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbar,
        iconTheme: const IconThemeData(color: white),
        title: const Text(
          'Shopping Cart',
          style: TextStyle(color: white),
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser?.email)
            .collection('cart')
            .snapshots(),
        builder: (context, snapshot) {
          // print('snapshotdataaaa:${snapshot.data!.docs}');
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
            return ListView.separated(
              itemCount: snapshot.data!.docs.length,
              
              itemBuilder: (BuildContext context, int index) {
                return CardTile(
                    id: snapshot.data!.docs[index]['id'],
                    price: snapshot.data!.docs[index]['price'],
                    totalprice: snapshot.data!.docs[index]['totalprice'],
                    count: snapshot.data!.docs[index]['count']);
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: height * 0.02);
              },
            );
          } else {
            return Center(
              child:  Lottie.asset('assets/lottie/animation_lm9321f8.json',height: height*0.6,width:width*0.6)
            );
          }
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total: ₹ ${cartController.cartTotal.value.toStringAsFixed(2)}',
              style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
            ),
            Container(
              height: height * 0.05,
              width: width * 0.45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: appbar,
              ),
              child: InkWell(
                onTap: () async{
                 await addresssController.loadAddresses();
                  Get.to(()=>CheckoutScreen(totalPrice: cartController.cartTotal.value.toStringAsFixed(2),));
                },
                child: const Center(
                  child: Text(
                    'CHECKOUT',
                    style: TextStyle(color: white, fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}


// ignore_for_file: prefer_typing_uninitialized_variables, sized_box_for_whitespace
// import 'dart:developer';
import 'package:bag_bliss/core/colors.dart';
import 'package:bag_bliss/src/controller/addres_controller.dart';
import 'package:bag_bliss/src/controller/cart_controller.dart';
import 'package:bag_bliss/src/view/address/add_address_screen.dart';
import 'package:bag_bliss/src/view/checkout/checkout_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../address/address_screen.dart';
import '../payment/rezopay.dart';

class CheckoutScreen extends StatelessWidget {
  CheckoutScreen({
    super.key,
    this.addressdata,
    this.addressId, 
    required this.totalPrice,
  });
  final addressdata;
  final addressId;
  final totalPrice;

  final AddressController addressController = Get.put(AddressController());
  final CartController cartController = Get.put(CartController());
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
            'Checkout',
            style: TextStyle(color: white),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: width * 0.05, top: height * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(
                  () => (addressController.addressList.isEmpty)
                      ? TextButton(
                          onPressed: () => Get.to(() => AddressAddScreen()),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.person,
                                color: appbar,
                                size: 22,
                              ),
                              SizedBox(width: width * 0.01),
                              const Text(
                                'Add Address',
                                style: TextStyle(color: appbar, fontSize: 22),
                              ),
                            ],
                          ),
                        )
                      : Container(
                          // alignment: Alignment.center,
                          height: height * 0.13,
                          width: width * 0.9,
                          decoration: BoxDecoration(
                            // color: black,
                            border: Border.all(color: appbar),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.location_on_outlined,
                                color: boxcolorfill,
                                size: 38,
                              ),
                              SizedBox(width: width * 0.02),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    addressController
                                        .addressList[addressController
                                            .selecetedIndex.value]
                                        .name,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                  Text(
                                      '${addressController.addressList[addressController.selecetedIndex.value].address},',
                                      style: const TextStyle(
                                          color: boxcolorstock,
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold)),
                                  Text(
                                      '${addressController.addressList[addressController.selecetedIndex.value].city},',
                                      style: const TextStyle(
                                          color: boxcolorstock,
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold)),
                                  Text(
                                      '${addressController.addressList[addressController.selecetedIndex.value].state} - ${addressController.addressList[addressController.selecetedIndex.value].pincode},',
                                      style: const TextStyle(
                                          color: boxcolorstock,
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold)),
                                  Text(
                                      'Phone: ${addressController.addressList[addressController.selecetedIndex.value].phone}',
                                      style: const TextStyle(
                                          color: boxcolorstock,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold))
                                ],
                              ),
                              SizedBox(width: width * 0.2),
                              InkWell(
                                onTap: () {
                                  Get.to(AddressScreen(
                                      addressdata: addressdata,
                                      addressId: addressId));
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: height * 0.03,
                                  width: width * 0.17,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: appbar),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: const Text(
                                    'Change',
                                    style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                        color: appbar),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                ),
                SizedBox(height: height * 0.02),
                const Text(
                  'Order Summary',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: height * 0.02),
                Container(
                  height: height * 0.37,
                  width: width * 0.9,
                  child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('users')
                          .doc(FirebaseAuth.instance.currentUser?.email)
                          .collection('cart')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        if (snapshot.hasData &&
                            snapshot.data!.docs.isNotEmpty) {
                          return ListView.separated(
                            separatorBuilder: (context, index) {
                              return const SizedBox();
                            },
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              return CheckoutTile(
                                id: snapshot.data!.docs[index]['id'], 
                                price: snapshot.data!.docs[index]['price'], 
                                totalprice: snapshot.data!.docs[index]['totalprice'], 
                                count: snapshot.data!.docs[index]['count']
                                );
                            },
                          );
                        } else {
                          return Center(
                              child: Lottie.asset(
                                  'assets/lottie/animation_lmj4e567.json',
                                  height: height * 0.3,
                                  width: width * 0.3));
                        }
                      }),
                ),
                SizedBox(height: height * 0.02),
                const Text('Amount',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                SizedBox(height: height * 0.02),
                Container(
                  alignment: Alignment.center,
                  height: height * .13,
                  width: width * 0.9,
                  decoration: BoxDecoration(
                      border: Border.all(color: appbar),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text('SubTotal'),
                            Text('₹ ${cartController.cartTotal.value.toStringAsFixed(2)}'),
                          ]),
                      SizedBox(height: height * 0.01),
                      const Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('Shipping'),
                          Text(
                            'Free',
                            style: TextStyle(color: Colors.green),
                          )
                        ],
                      ),
                      SizedBox(height: height * 0.01),
                      const Divider(),
                       Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text(
                            'Total',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                           '₹ ${cartController.cartTotal.value.toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.1),
                Center(
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    height: height * 0.05,
                    width: width * 0.7,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5), color: appbar),
                    child: InkWell(
                      onTap: () {
                        Get.to( Paymentscreen(totalPrice: cartController.cartTotal.value.toStringAsFixed(2)));
                      },
                      child: const Center(
                        child: Text(
                          'CONTINUE',
                          style: TextStyle(color: white, fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

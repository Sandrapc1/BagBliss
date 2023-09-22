// ignore_for_file: prefer_typing_uninitialized_variables
import 'dart:developer';

import 'package:bag_bliss/core/colors.dart';
import 'package:bag_bliss/src/controller/addres_controller.dart';
import 'package:bag_bliss/src/view/address/add_address_screen.dart';
import 'package:bag_bliss/src/view/address/address_update.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class AddressScreen extends StatelessWidget {
  AddressScreen(
      {super.key, required this.addressdata, required this.addressId});
  final addressdata;
  final addressId;
  final AddressController addressController = Get.put(AddressController());

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
          'My Address',
          style: TextStyle(color: white),
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser?.email)
            .collection('address')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(
                child: Lottie.asset('assets/lottie/animation_lmc1xvu5.json',
                    height: height * 0.6, width: width * 0.6));
          }
          return ListView.separated(
            separatorBuilder: (context, index) {
              return const SizedBox();
            },
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              log(snapshot.data!.docs[index]['name']);
              log(index.toString());
              log(addressController.selecetedIndex.value.toString());
              return Column(children: [
                Padding(
                  padding: EdgeInsets.only(top: height * 0.05),
                  child: Material(
                    elevation: 10,
                    child: Container(
                      height: height * 0.4,
                      width: width * 0.85,
                      color: white,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(snapshot.data!.docs[index]['name'],
                                      style: const TextStyle(
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold)),
                                  Obx(() => IconButton(
                                      onPressed: () {
                                        addressController.selecetedIndex.value=index;
                                        //addressController.updateSelectedAddress();
                                      },
                                      icon:  Icon(
                                        Icons.adjust_outlined,
                                        color: (addressController.selecetedIndex.value==index)?black:boxcolorfill,
                                        size: 27,
                                      )))
                                ],
                              ),
                              // SizedBox(height: height * 0.01),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(snapshot.data!.docs[index]['pincode'],
                                      style: const TextStyle(fontSize: 17)),
                                  IconButton(
                                    onPressed: () {
                                      final addressId =
                                          snapshot.data!.docs[index].id;
                                      addressController
                                          .deleteAddress(addressId);
                                    },
                                    icon: const Icon(Icons.delete_outline,
                                        color: red, size: 27),
                                  )
                                ],
                              ),

                              SizedBox(height: height * 0.01),
                              Text(snapshot.data!.docs[index]['address'],
                                  style: const TextStyle(fontSize: 17)),
                              SizedBox(height: height * 0.01),
                              Text(snapshot.data!.docs[index]['city'],
                                  style: const TextStyle(fontSize: 17)),
                              SizedBox(height: height * 0.01),
                              Text(snapshot.data!.docs[index]['state'],
                                  style: const TextStyle(fontSize: 17)),
                              SizedBox(height: height * 0.01),
                              Text(snapshot.data!.docs[index]['phone'],
                                  style: const TextStyle(fontSize: 17)),
                              SizedBox(height: height * 0.01),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: width * 0.09, bottom: height * 0.02),
                                child: Container(
                                  alignment: Alignment.center,
                                  height: height * 0.05,
                                  width: width * 0.6,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    color: white,
                                    border: Border.all(color: appbar, width: 2),
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      Get.to(AddressUpdate(
                                          addressData:
                                              snapshot.data!.docs[index],
                                          addressId: snapshot.data!.docs[index]
                                              ['id']));
                                    },
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Edit',
                                          style: TextStyle(
                                              color: appbar, fontSize: 17),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ]),
                      ),
                    ),
                  ),
                ),
              ]);
            },
          );
        },
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 21.0, left: 32),
          child: FloatingActionButton(
            onPressed: () {
              Get.to(AddressAddScreen());
            },
            child: const Icon(
              Icons.add,
              color: white,
              size: 37,
            ),
            backgroundColor: appbar,
          ),
        ),
      ),
    );
  }
}

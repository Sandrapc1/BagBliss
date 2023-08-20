import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/wishlist_models.dart';

class WishListController extends GetxController {
  RxList<String> existingProduct = <String>[].obs;



  Future<void> addToWishlist(WishListModel products) async {
    log(existingProduct.toString());
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      final userRef =
          FirebaseFirestore.instance.collection('users').doc(currentUser.email);
      final docRef = userRef.collection('wishlist').doc('myWishList');
      final wishlistsnapshot = await docRef.get();
      if (wishlistsnapshot.exists) {
        final data = wishlistsnapshot.data();
        if (data != null && data.containsKey('products')) {
          existingProduct.clear();
          existingProduct.addAll(List<String>.from(data['products']));
          if (existingProduct.contains(products.id)) {
            existingProduct.remove(products.id);
            Get.snackbar('Removed from wishlist', '',
                colorText: Colors.red, duration: const Duration(seconds: 1),
                // snackPosition: SnackPosition.BOTTOM
                );
          } else {
            existingProduct.add(products.id!);
            Get.snackbar('Added to wishlist ❤️', '',
                duration: const Duration(seconds: 1),
                );
          }
          await docRef.update({'products': existingProduct});
        } else {
          await docRef.update({
            'products': [products.id]
          });
        }
      } else {
        await docRef.set({
          'products': [products.id]
        });
      }
    }
  }

  Future<bool> existInWishlist(String id) async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      final userRef =
          FirebaseFirestore.instance.collection('users').doc(currentUser.email);
      final docRef = userRef.collection('wishlist').doc('myWishList');
      final wishlistsnapshot = await docRef.get();
      if (wishlistsnapshot.exists) {
        final data = wishlistsnapshot.data();
        if (data != null && data.containsKey('products')) {
          existingProduct.clear();
          existingProduct.addAll(List<String>.from(data['products']));
          return existingProduct.contains(id);
        }
      }
    }
    return false;
  }

  bool isInWishlist(String id) {
    return existingProduct.contains(id);
  }
}

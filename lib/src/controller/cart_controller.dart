// import 'dart:ffi';

// import 'package:bag_bliss/src/model/cart_model.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';

// class CartController extends GetxController {
//   var existingCartProduct={}.obs;

//   Future<void> addCart(CartModel products) async{
//         final currentUser = FirebaseAuth.instance.currentUser;
//        final userRef =    FirebaseFirestore.instance.collection('users').doc(currentUser?.email);
//       final docRef = userRef.collection('cart');
//       final cardsnapshot = await docRef.get();
//     if ( existingCartProduct.containsKey(products)) {
//       existingCartProduct[products] +=1;
//     }else{
//       existingCartProduct[products] = 1;
//     }
//   }
  


// }



import 'package:get/get.dart';

import '../model/cart_model.dart';

class CartController extends GetxController {
  var cartProducts = {}.obs;
  double totalPrice = 0.0;

  void addToCart(CartModel product) {
    if (cartProducts.containsKey(product.id)) {
      cartProducts[product.id]!['quantity'] += 1;
    } else {
      cartProducts[product.id] = {
        'product': product,
        'quantity': 1,
      };
    }
    calculateTotalPrice();
  }

  void removeFromCart(String productId) {
    cartProducts.remove(productId);
    calculateTotalPrice();
  }

  void calculateTotalPrice() {
    totalPrice = 0.0;
    cartProducts.forEach((key, value) {
      totalPrice += value['product'].price * value['quantity'];
    });
    update();
  }
}
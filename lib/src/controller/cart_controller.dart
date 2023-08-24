import 'package:bag_bliss/core/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../model/cart_model.dart';

class CartController extends GetxController {
  RxList<CartModel> cartItems = <CartModel>[].obs;

  final user = FirebaseAuth.instance.currentUser;

  void addToCart(CartModel item) async {
    final userRef = FirebaseFirestore.instance.collection('users').doc(user?.email);
    final cartRef = userRef.collection('cart');

    final cartItemDoc = cartRef.doc(item.id);
    final cartItemSnapshot = await cartItemDoc.get();

    if (cartItemSnapshot.exists) {
      await cartItemDoc.update({
        'count': FieldValue.increment(1),
      });
    Get.snackbar('Item added', ' ${item.id}',
    backgroundColor: white,
    colorText: black,
    duration: const Duration(seconds: 1));

    } else {
      await cartItemDoc.set({
      'price':item.price,
      'count':item.count,
      'id':item.id,
      'totalprice':item.totalprice,
      
      });
    }
  }

  void removeFromCart(String itemId) async {
    final userRef = FirebaseFirestore.instance.collection('users').doc(user?.email);
    final cartRef = userRef.collection('cart');

    final cartItemDoc = cartRef.doc(itemId);
    final cartItemSnapshot = await cartItemDoc.get();

    if (cartItemSnapshot.exists) {
      await cartItemDoc.delete();
    }
  }

  double get total => cartItems.fold(
      0, (previousValue, cartItem) => previousValue + cartItem.price * cartItem.quantity);
}

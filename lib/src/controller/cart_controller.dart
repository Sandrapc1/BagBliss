// ignore_for_file: avoid_function_literals_in_foreach_calls
import 'package:bag_bliss/core/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../model/cart_model.dart';

class CartController extends GetxController {
 final RxList<CartModel> cartItems = <CartModel>[].obs;
 final RxDouble cartTotal = 0.0.obs;
  final user = FirebaseAuth.instance.currentUser;

  get items => null;

  void addToCart(CartModel item) async {
    final userRef =
        FirebaseFirestore.instance.collection('users').doc(user?.email);
    final cartRef = userRef.collection('cart');

    final cartItemDoc = cartRef.doc(item.id);
    final cartItemSnapshot = await cartItemDoc.get();

    if (cartItemSnapshot.exists) {
      Get.snackbar('Item added', ' ${item.id}', 
          backgroundColor: white,
          colorText: black,
          duration: const Duration(seconds: 1));
    } else {
      await cartItemDoc.set({
        'price': item.price,
        'count': item.count,
        'id': item.id,
        'totalprice': item.totalprice,
        'quantity':item.quantity
      });
    }
  }
  
  void removeFromCart(String itemId) async {
    final userRef =
        FirebaseFirestore.instance.collection('users').doc(user?.email);
    final cartRef = userRef.collection('cart');
    cartRef.doc(itemId).delete();
    Get.snackbar('Removed from shopping cart', '',
        backgroundColor: red, colorText: white);
  }

  void incrementProductCount(String itemId) async {
    final userRef =
        FirebaseFirestore.instance.collection('users').doc(user?.email);
    final cartRef = userRef.collection('cart');
    await cartRef.doc(itemId).update({'count': FieldValue.increment(1)});
  }

  void decrementProductCount(String itemId) async {
    final userRef =
        FirebaseFirestore.instance.collection('users').doc(user?.email);
    final cartRef = userRef.collection('cart');
    await cartRef.doc(itemId).update({'count': FieldValue.increment(-1)});
  }


Future<void> calculateCartTotalPrice() async {
  double totalPrice = 0.0;
  final userRef = FirebaseFirestore.instance.collection('users').doc(user?.email);
  final cartRef = userRef.collection('cart');
  QuerySnapshot cartSnapshot = await cartRef.get();
  cartSnapshot.docs.forEach((QueryDocumentSnapshot cartItem) {
    Map<String, dynamic> cartData = cartItem.data() as Map<String, dynamic>;
    dynamic price = cartData['price'];
    dynamic count = cartData['count']; 

    if (price != null && count != null) {
      double itemPrice = price is double ? price : (price is int ? price.toDouble() : 0.0);
      int itemCount = count is int ? count : 0;
      double totalItemPrice = itemPrice * itemCount;
      totalPrice += totalItemPrice;
    }
  });
  final CartController cartController = Get.find();
  cartController.cartTotal.value = totalPrice;
}

  Future<Map<String, dynamic>?> getTheProduct(id) async {
    final getCartProduct =
        FirebaseFirestore.instance.collection('products').doc(id);
    final document = await getCartProduct.get();
    //  print(document.data());
    return document.data();
  }

  getTotalPrice() {}
}

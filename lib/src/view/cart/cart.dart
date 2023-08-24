import 'package:bag_bliss/core/colors.dart';
import 'package:bag_bliss/src/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  final CartController cartController = Get.put(CartController());
 CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbar,
        iconTheme: const IconThemeData(color: white),
        title: const Text('Shopping Cart',style: TextStyle(color: white),),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: cartController.cartItems.length,
          itemBuilder: (context, index) {
            final cartItem = cartController.cartItems[index];
            return ListTile(
              
              // title: Text(cartItem.name),
              subtitle: Text('Price: \$${cartItem.price}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () {
                      cartController.removeFromCart(cartItem.id);
                    },
                  ),
                  Text('${cartItem.quantity}'),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      cartController.addToCart(cartItem);
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Total: \$${cartController.total.toStringAsFixed(2)}'),

             Container(
                    height: height * 0.05,
                    width: width * 0.45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5), color: appbar),
                    child: InkWell(
                      onTap: () {
                        // Get.to(const CheckoutScreen());
                      },
                      child: const Center(
                        child: Text(
                          'CHECKOUT',
                          style: TextStyle(color: white, fontSize: 16),
                        ),
                      ),
            // ElevatedButton(
            //   onPressed: () {
            //     // Implement checkout logic here
            //   },
            //   child: const Text('Checkout'),
            // ),
          
        )
             )
        ],
        ),
      ),
    );
  }
}
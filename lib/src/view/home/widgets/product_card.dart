import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/wishlist_controller.dart';
import '../../../model/product_model.dart';
import '../../../model/wishlist_models.dart';

final WishListController wishlistController = Get.put(WishListController());

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.height,
    required this.width,
    required this.itemName,
    required this.itemImage,
    required this.price,
    required this.id,
  }) : super(key: key);

  final double height;
  final double width;
  final String itemName;
  final String itemImage;
  final String price;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          elevation: 5,
          child: InkWell(
            onTap: () {
              Get.to(ProductDetails());
            },
            child: Container(
              width: width * 0.4,
              color: Colors.white,
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: height * 0.21,
                        width: width * 0.35,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(itemImage),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 2,
                        child: Obx(() {
                          bool isItemInWishlist =
                              wishlistController.isInWishlist(id);
                          return IconButton(
                            onPressed: () {
                              wishlistController
                                  .addToWishlist(WishListModel(id: id));
                            },
                            icon: Icon(
                              Icons.favorite_border_rounded,
                              color:
                                  isItemInWishlist ? Colors.red : Colors.white,
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                  Text(
                    itemName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    price,
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:bag_bliss/core/colors.dart';
import 'package:bag_bliss/src/model/product_model.dart';
import 'package:bag_bliss/src/view/details/product_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/wishlist_controller.dart';
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
    required this.brand,
    required this.quantity,
     required this.description, 
     required this.category,
  }) : super(key: key);

  final double height;
  final double width;
  final String itemName;
  final String itemImage;
  final String price;
  final String id;
  final String brand;
  final String quantity;
  final String description;
  final String category;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          elevation: 5,
          child: InkWell(
            onTap: () {
              Get.to(ProductDetailsScreen(
                item: ProductDetails(
                    image: itemImage,
                    price: price,
                    name: itemName,
                    brand: brand,
                    quantity: quantity,
                    id: id,
                    description: description,
                    category: category
                    ), id: id,
              ));
            },
            child: Container(
              width: width * 0.4,
              color: Colors.white,
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: height * 0.16,
                        width: width * 0.35,
                        // color: red,
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
                                  isItemInWishlist ? Colors.red : Colors.black,
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
                      fontSize: 17,
                    ),
                  ),
                  //  SizedBox(height: height*0.01),
                  Text('₹ ${price}'
                    ,
                    style: const TextStyle(fontSize: 14,color: appbar),
                  ),
                  SizedBox(height: height*0.01),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

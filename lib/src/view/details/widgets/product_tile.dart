import 'package:bag_bliss/src/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/colors.dart';
import '../../../controller/wishlist_controller.dart';
import '../../../model/wishlist_models.dart';

class ProductTile extends StatelessWidget {
  ProductTile({super.key, required this.items, required this.id});
  final ProductDetails items;
  final String id;
  final WishListController wishlistController = Get.put(WishListController());
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: height * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                items.name!,
                style: const TextStyle(
                    color: white, fontSize: 28, fontWeight: FontWeight.bold),
              ),
              Obx(() {
                bool isItemInWishlist = wishlistController.isInWishlist(id);
                return IconButton(
                  onPressed: () {
                    wishlistController.addToWishlist(WishListModel(id: id));
                  },
                  icon: Icon(
                    Icons.favorite_border_rounded,
                    color: isItemInWishlist ? Colors.red : Colors.black,
                  ),
                );
              }),
            ],
          ),
          // SizedBox(height: height*0.01,),
          Text(items.category!,
              style: const TextStyle(color: white, fontSize: 13)),
          // SizedBox(height: height*0.02,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(children: [
                  const TextSpan(
                      text: 'Price\n', style: TextStyle(fontSize: 20)),
                  TextSpan(
                      text: items.price!,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 28)),
                ]),
              ),
              Image.network(items.image!,
                  fit: BoxFit.fill, width: width * 0.5, height: height * 0.3),
            ],
          ),
        ],
      ),
    );
  }
}

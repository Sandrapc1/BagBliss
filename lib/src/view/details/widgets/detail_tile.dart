import 'package:bag_bliss/core/colors.dart';
import 'package:bag_bliss/src/controller/choicechip_controller.dart';
import 'package:bag_bliss/src/model/cart_model.dart';
import 'package:bag_bliss/src/model/product_model.dart';
import 'package:bag_bliss/src/view/details/widgets/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/cart_controller.dart';
import 'choicebutton_tiel.dart';

class DetailstTile extends StatelessWidget {
  DetailstTile({super.key, required this.items, required this.id});

  final CartController cartController = Get.put(CartController());
  final ChoiceButtonController choiceButtonController =Get.put(ChoiceButtonController());
  final List<String> availableSizes = ['M', 'S', 'L', 'XL'];
  final ProductDetails items;
  final String id;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      backgroundColor: appbar,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height,
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: height * 0.3),
                    height: height * 0.8,
                    width: width,
                    // color: white,
                    decoration: const BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(28),
                            topRight: Radius.circular(28))),
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: height * 0.14, left: width * 0.02),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Select Size',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          SizedBox(height: height * 0.02),
                          Obx(() => Row(
                                children: [
                                  buildChoiceButton(
                                    'M',
                                    choiceButtonController
                                        .selectedChoiceButton.value,
                                    height,
                                    width,
                                  ),
                                  SizedBox(width: width * 0.02),
                                  buildChoiceButton(
                                    'S',
                                    choiceButtonController
                                        .selectedChoiceButton.value,
                                    height,
                                    width,
                                  ),
                                  SizedBox(width: width * 0.02),
                                  buildChoiceButton(
                                    'L',
                                    choiceButtonController
                                        .selectedChoiceButton.value,
                                    height,
                                    width,
                                  ),
                                ],
                              )),
                          SizedBox(height: height * 0.03),
                          Text(
                            items.description!,
                            style: const TextStyle(
                                color: boxcolorstock, fontSize: 16),
                          ),
                          SizedBox(height: height * 0.07),
                          Row(
                            children: [
                              Container(
                                height: height * 0.05,
                                width: width * 0.42,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: appbar),
                                child: InkWell(
                                  onTap: () {
                                    // if (items.id != null &&
                                    //     items.price != null &&
                                    //     items.quantity != null) {
                                    // } else {
                                    //   // Handle case where items or its properties are null
                                    // }
                                    cartController.addToCart(CartModel(
                                      id: items.id!,
                                      price: int.parse(items.price!),
                                      totalprice: int.parse(items.price!),
                                      quantity: int.parse(items.quantity!),
                                      count: 1,
                                    ));
                                  },
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(Icons.shopping_bag,
                                            color: white, size: 30),
                                        SizedBox(width: width * 0.01),
                                        const Text(
                                          'ADD TO CART',
                                          style: TextStyle(
                                              color: white, fontSize: 16),
                                        ),
                                      ]),
                                ),
                              ),
                              SizedBox(width: width * 0.06),
                              Container(
                                height: height * 0.05,
                                width: width * 0.48,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  //  color: appbar,
                                  border: Border.all(color: appbar, width: 2),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    // Get.to(const CheckoutScreen());
                                  },
                                  child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'BUY NOW',
                                          style: TextStyle(
                                              color: appbar, fontSize: 16),
                                        ),
                                      ]),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  // SizedBox(height: height * 0.08),
                  ProductTile(items: items, id: id)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

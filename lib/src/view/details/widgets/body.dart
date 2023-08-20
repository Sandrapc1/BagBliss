import 'package:bag_bliss/core/colors.dart';
import 'package:bag_bliss/src/view/cart/cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'product_tile.dart';

class ProductBody extends StatelessWidget {
  const ProductBody({super.key});

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
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          SizedBox(height: height * 0.02),
                          Row(
                            children: [
                              Container(
                                height: height * 0.04,
                                width: width * 0.1,
                                // color: black,
                                decoration: BoxDecoration(
                                    color: boxcolorfill,
                                    shape: BoxShape.circle,
                                    border: Border.all(color: appbar)),
                                child: const Center(
                                    child: Text(
                                  'M',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )),
                              ),
                              SizedBox(width: width * 0.02),
                              Container(
                                height: height * 0.04,
                                width: width * 0.1,
                                // color: black,
                                decoration: BoxDecoration(
                                    color: boxcolorfill,
                                    shape: BoxShape.circle,
                                    border: Border.all(color: appbar)),
                                child: const Center(
                                    child: Text(
                                  'S',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )),
                              ),
                              SizedBox(width: width * 0.02),
                              Container(
                                height: height * 0.04,
                                width: width * 0.1,
                                // color: black,
                                decoration: BoxDecoration(
                                    color: boxcolorfill,
                                    shape: BoxShape.circle,
                                    border: Border.all(color: appbar)),
                                child: const Center(
                                    child: Text(
                                  'L',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )),
                              ),
                            ],
                          ),
                          SizedBox(height: height * 0.03),
                          const Text(
                            'Off-White quilted handheld bag, has a zip closure 1 main compartment \nhas 2 external pockets and a zip separator sleeve Two Handles with a detachable sling strap.In this article, we will discuss what exactly a \ncrossbody bag is, why it is a great option for people who are on the \ngo a lot and what to look out for when choosing the right crossbody\n bag for your needs.A crossbody bag is a bag with a long strap worn diagonally across the body, with the bag hanging at hip height on the opposite side.',
                            style: TextStyle(color: boxcolorstock,fontSize: 15),
                          ),
                          SizedBox(height: height * 0.07),
                          Row(
                            children: [
                              Container(
                                height: height * 0.05,
                                width: width * 0.38,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: appbar
                                    ),
                                child: InkWell(
                                  onTap: () {
                                    Get.to(  CartScreen());
                                  },
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(Icons.shopping_bag,
                                            color: white, size: 30),
                                        SizedBox(width: width * 0.02),
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
                                width: width * 0.5,
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
                  ProductTile(height: height, width: width),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

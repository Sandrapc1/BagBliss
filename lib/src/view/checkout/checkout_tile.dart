import 'package:bag_bliss/src/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/colors.dart';

class CheckoutTile extends StatelessWidget {
  final cartcontroller = Get.put(CartController());

  CheckoutTile({
    super.key,
    required this.id,
    required this.price,
    required this.totalprice,
    required this.count,
  });

  final String id;
  final int price;
  final int totalprice;
  final int count;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return FutureBuilder(
        future: cartcontroller.getTheProduct(id),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: height * 0.1,
                width: width * 0.5,
                // color: black,
                decoration: BoxDecoration(
                    border: Border.all(color: appbar),
                    borderRadius: BorderRadius.circular(7)),
                child: Row(
                  children: [
                    Container(
                      height: height * 0.09,
                      width: width * 0.19,
                      // color: red,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(snapshot.data!['image'][0]))),
                    ),
                    SizedBox(width: width * 0.02),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          snapshot.data!['name'],
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        SizedBox(height: height * 0.00),
                        const Text(
                          'Printed Bucket Quilted Handheld Bag',
                          style: TextStyle(fontSize: 10),
                        ),
                        SizedBox(height: height * 0.01),
                        Text(
                      '₹ ${snapshot.data!['price'].toString()}',
                          style: const TextStyle(color: appbar, fontSize: 12),
                        ),
                      ],
                    ),
                    SizedBox(width: width * 0.07),
                  ],
                ),
              ),
            );
          }
          return const SizedBox();
        });
  }
}

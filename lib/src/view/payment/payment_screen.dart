import 'package:bag_bliss/core/colors.dart';
import 'package:bag_bliss/src/view/payment/order_placed.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Paymentscreen extends StatelessWidget {
  const Paymentscreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbar,
        iconTheme: const IconThemeData(color: white),
        title: const Text(
          'Payments',
          style: TextStyle(color: white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: width * 0.05, top: height * 0.03),
        child: Column(
          children: [
            Container(
              height: height * 0.07,
              width: width * 0.9,
              decoration: BoxDecoration(
                  border: Border.all(color: appbar),
                  borderRadius: BorderRadius.circular(13)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                      child: Image.asset(
                    'assets/images/paymentss.png',
                    width: width * 0.25,
                    height: height * 0.2,
                  )),
                ],
              ),
            ),
            SizedBox(height: height*0.03),
            Container(
              height: height * 0.07,
              width: width * 0.9,
              decoration: BoxDecoration(
                  border: Border.all(color: appbar),
                  borderRadius: BorderRadius.circular(13)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.payments_outlined,color: Colors.green,size: 27,)),
                  const Text('Cash On  Delivery',style: TextStyle(color: Colors.green,fontSize: 17),)
                ],
              ),
            ),
            SizedBox(height: height * 0.5),
              Center(
                child: Container(
                  alignment: Alignment.bottomCenter,
                  height: height * 0.05,
                  width: width * 0.7,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5), color: appbar),
                  child: InkWell(
                    onTap: () {
                      Get.to(const OrderPlaced());
                    },
                    child: const Center(
                      child: Text(
                        'PLACE ORDER',
                        style: TextStyle(color: white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

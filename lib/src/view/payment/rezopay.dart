// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:developer';
import 'package:bag_bliss/core/colors.dart';
import 'package:bag_bliss/src/view/payment/order_placed.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import '../../controller/cart_controller.dart';
// import '../../model/order_model.dart';

class Paymentscreen extends StatefulWidget {
  Paymentscreen({super.key, required this.totalPrice});

  final totalPrice;
  // final OrderModel orderData;
  final CartController cartController = Get.put(CartController());
  @override
  State<Paymentscreen> createState() => _PaymentscreenState();
}

class _PaymentscreenState extends State<Paymentscreen> {
  final _razorpay = Razorpay();
  String _selectedPaymentMethod = 'Cash On Delivery';

  @override
  void initState() {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.initState();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
  
    // Do something when payment succeeds
    // print('payment done');
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    // print('payment fails');
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
  }
  void makePayment() async{
    final user = FirebaseAuth.instance.currentUser;
    double totalPriceDouble = double.parse(widget.totalPrice);
    int amount = totalPriceDouble.toInt();
    var options = {
      'key': 'rzp_test_3EsqfNUwjSkVYp',
      'amount':  amount*100,   
      'name': 'Bagg Bliss',
      'timeout': 300,
      'description': 'Item',
      'prefill': {'contact': '', 'email': '${user!.email}'}
    };
    try {
      _razorpay.open(options);
    } catch (e) {
      log(e.toString());
    }
  }


String date= DateTime.now().toString();
// orderData =OrderModel(
//   orderId: orderId, 
//   totalPrice: totalPrice, 
//   paymentId: paymentId, 
//   israzoPay: true, 
//   orderStatus: orderStatus, 
//   orderPlacedDate: orderPlacedDate, 
//   shippingDate: shippingDate, 
//   outForDeliveryDate: outForDeliveryDate, 
//   deliveryDate: deliveryDate
//   );

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
        padding: EdgeInsets.only(left: width * 0.02, top: height * 0.08),
        child: Column(
          children: [
            Container(
              height: height * 0.07,
              width: width * 0.85,
              decoration: BoxDecoration(
                border: Border.all(color: appbar),
                borderRadius: BorderRadius.circular(13),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/paymentss.png',
                    width: width * 0.25,
                    height: height * 0.2,
                  ),
                  SizedBox(width: width * 0.2),
                  Radio(
                    value: 'RazoPay',
                    groupValue: _selectedPaymentMethod,
                    // final user = FirebaseAuth.instance.currentUser;
                    onChanged: (value) {
                      setState(() {
                        makePayment();
                        _selectedPaymentMethod = value.toString();
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.05),
            Container(
              height: height * 0.07,
              width: width * 0.85,
              decoration: BoxDecoration(
                border: Border.all(color: appbar),
                borderRadius: BorderRadius.circular(13),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.payments_outlined,
                      color: Colors.green, size: 27),
                  SizedBox(width: width * 0.01),
                  const Text(
                    'Cash On Delivery',
                    style: TextStyle(color: Colors.green, fontSize: 15),
                  ),
                  // SizedBox(width: width * 0.1),
                  Radio(
                    value: 'Cash On Delivery',
                    groupValue: _selectedPaymentMethod,
                    onChanged: (value) {
                      setState(() {
                        _selectedPaymentMethod = value.toString();
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.3),
            Center(
              child: Container(
                alignment: Alignment.bottomCenter,
                height: height * 0.05,
                width: width * 0.7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: appbar,
                ),
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

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }
}

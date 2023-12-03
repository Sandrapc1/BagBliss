// import 'package:bag_bliss/src/controller/order_controller.dart';
// import 'package:bag_bliss/src/model/order_model.dart';
import 'package:bag_bliss/src/view/orders/track_order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/colors.dart';
import '../../../controller/order_controller.dart';
import '../../../model/order_model.dart';

class OrderTile extends StatelessWidget {
   OrderTile({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;
  final OrderController orderController=Get.put(OrderController());
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * 0.1,
      width: width,
      child: Row(
        children: [
          Container(
            height: height * 0.09,
            width: width * 0.16,
            // color: red,
            decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                    image: AssetImage('assets/images/MessengerBag.jpg'))),
          ),
          // SizedBox(width: width * 0.02),
           const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(height: height * 0.01),
              Text('Messager Bag'),
              Text('₹ 5000'),
              Text('Qty: 1'),
              Text('Order Id : #0000154989',
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10))
            ],
          ),
          SizedBox(width: width * 0.1),
          Container(
            alignment: Alignment.topCenter,
            height: height * 0.032,
            width: width * 0.15,
            decoration: BoxDecoration(
                border: Border.all(color: red),
                borderRadius: BorderRadius.circular(5)),
            child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: red,fontSize: 9),
                )),
          ),
          SizedBox(width: width * 0.01),
          IconButton(
              onPressed: () {
                Get.to(const OrderTrack());
                OrderModel(
                  orderId: '788454', 
                  totalPrice: 5000, 
                  paymentId: '44', 
                  israzoPay: true, 
                  orderStatus: 'pending', 
                  orderPlacedDate: DateTime.now().toString(), 
                  shippingDate:DateTime.now().add(Duration(days: 2)).toString(), 
                  outForDeliveryDate: DateTime.now().add(Duration(days: 4)).toString(), 
                  deliveryDate: DateTime.now().add(Duration(days: 6)).toString()
                  );
              },
              icon: const Icon(
                Icons.arrow_forward_ios_rounded,
                color: boxcolorstock,
                size: 20,
              ))
        ],
      ),
    );
  }
}

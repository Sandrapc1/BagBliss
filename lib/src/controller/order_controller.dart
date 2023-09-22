import 'package:bag_bliss/src/model/order_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> placeOrder(OrderModel orderModel) async {
    try {
      CollectionReference orders = _firestore.collection('orders');
      await orders.add({
        'orderId': orderModel.orderId,
        'totalPrice': orderModel.totalPrice,
        'paymentId': orderModel.paymentId,
        'israzoPay': orderModel.israzoPay,
        'orderStatus': orderModel.orderStatus,
        'orderPlacedDate': orderModel.orderPlacedDate,
        'shippingDate': orderModel.shippingDate,
        'outForDeliveryDate': orderModel.outForDeliveryDate,
        'deliveryDate': orderModel.deliveryDate,
      });
    } catch (e) {
      print('Error placing order:$e');
    }
  }
}

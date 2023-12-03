import 'package:bag_bliss/src/model/cart_model.dart';
import 'address_model.dart';

class OrderModel {
  late List<CartModel> cartLists;
  late String orderId;
  late int totalPrice;
  late String paymentId;
  late bool israzoPay;
  late String orderStatus;
  late String orderPlacedDate;
  late String shippingDate;
  late String outForDeliveryDate;
  late String deliveryDate;

  OrderModel({
    required this.orderId,
    required this.totalPrice,
    required this.paymentId,
    required this.israzoPay,
    required this.orderStatus,
    required this.orderPlacedDate,
    required this.shippingDate,
    required this.outForDeliveryDate,
    required this.deliveryDate,
  }) {
    _orderStatus();
  }

  _orderStatus() {
    orderPlacedDate ??= 'Not Setted';
    shippingDate ??= 'Not Setted';
    outForDeliveryDate ??= 'Not Setted';
    deliveryDate ??= 'Not Setted';
  }

  OrderModel.fromMap(var data) {
    totalPrice = data['totalPrice'];
    paymentId = data['orderId'];
    israzoPay = data['isRazorpay'];
    orderStatus = data['orderStatus'];
    orderPlacedDate = data['orderPlacedDate'];
    shippingDate = data['shippingDate'];
    outForDeliveryDate = data['outForDeliveryDate'];
    deliveryDate = data['deliveryDate'];

    // Map cartData = data['items'] as Map;
    // cartLists = [];
    // for (var items in cartData.values) {
    //   // cartLists.add(CartModel.(data: items));
    // }
    // Map addressMap = data['address'] as Map;
    // addressMap = AddressModel.fromData(data: addressMap);
  }
}
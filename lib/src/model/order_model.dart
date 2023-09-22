class OrderModel {
  String orderId;
  int totalPrice;
  String paymentId;
  bool israzoPay;
  String orderStatus;
  String orderPlacedDate;
  String shippingDate;
  String outForDeliveryDate;
  String deliveryDate;

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

});

  
}
// class TrackerData {
//   final String title;
//   final String date;
//   final List<OrderModel> trackerDetails;

//   TrackerData({
//     required this.title,
//     required this.date,
//     required this.trackerDetails,
//   });
// }
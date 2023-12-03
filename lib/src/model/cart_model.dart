class CartModel {
  
  String id;
  int price;
  int totalprice;
  int quantity;
  int count;

  CartModel({
    required this.id,
    required this.price,
    required this.totalprice,
    required this.quantity,
    required this.count,
  });

  // static CartModel fromMap({required data}) {}
}
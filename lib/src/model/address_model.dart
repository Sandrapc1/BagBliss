class AddressModel {
  String id;
  String name;
  String address;
  String phone;
  String state;
  String city;
  String pincode;

  AddressModel({
    required this.id,
    required this.name,
    required this.address,
    required this.phone,
    required this.state,
    required this.city,
    required this.pincode, String? addressType
  });

  // static Map fromData({required Map data}) {}

}
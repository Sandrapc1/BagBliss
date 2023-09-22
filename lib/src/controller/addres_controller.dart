import 'dart:developer';
import 'package:bag_bliss/core/colors.dart';
import 'package:bag_bliss/src/model/address_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  final RxList<AddressModel> addressList = <AddressModel>[].obs;
  final user = FirebaseAuth.instance.currentUser;
  final RxInt selecetedIndex = 0.obs;

  @override
  void onInit() async{
    super.onInit();
    await loadAddresses();
    log(addressList.length.toString());
  }

  Future<void> loadAddresses() async {
    if (user != null) {
      final userRef =
          FirebaseFirestore.instance.collection('users').doc(user?.email);
      final addressRef = userRef.collection('address');

      final snapshot = await addressRef.get();
      final addresses = snapshot.docs
          .map((doc) => AddressModel(
                id: doc.id,
                name: doc['name'],
                address: doc['address'],
                phone: doc['phone'],
                state: doc['state'],
                city: doc['city'],
                pincode: doc['pincode'],
              ))
          .toList();
log(addresses.toString());
      addressList.assignAll(addresses);
    }
  }

  Future<void> addAddress(AddressModel address) async {
    if (user != null) {
      final userRef =
          FirebaseFirestore.instance.collection('users').doc(user?.email);
      final addressRef = userRef.collection('address').doc();
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user?.email)
          .collection('address')
          .doc(addressRef.id)
          .set({
        'id': addressRef.id,
        'name': address.name,
        'address': address.address,
        'phone': address.phone,
        'state': address.state,
        'city': address.city,
        'pincode': address.pincode,
      });

      loadAddresses();
      Get.snackbar('Address Added successfully', '',
          backgroundColor: black,
          colorText: white,
          duration: const Duration(seconds: 1));
    }
  }

  Future<void> editAddress(AddressModel address, String addressId) async {
    if (user != null) {
      final userRef =
          FirebaseFirestore.instance.collection('users').doc(user?.email);
      final addressRef = userRef.collection('address');
      await addressRef.doc(address.id).update({
        'id': address.id,
        'name': address.name,
        'address': address.address,
        'phone': address.phone,
        'state': address.state,
        'city': address.city,
        'pincode': address.pincode,
      });
      loadAddresses();
    }
  }

  Future<void> deleteAddress(String id) async {
    if (user != null) {
      final userRef =
          FirebaseFirestore.instance.collection('users').doc(user?.email);
      final addressRef = userRef.collection('address');
      await addressRef.doc(id).delete();
      loadAddresses();
      Get.snackbar('Address deleted successfully', '',
          backgroundColor: red,
          colorText: white,
          duration: const Duration(seconds: 1));
    }
  }
 
}

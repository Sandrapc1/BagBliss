import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  List<String> orderList=[];
    final user = FirebaseAuth.instance.currentUser;

  getOrderId()async{
    await FirebaseFirestore.instance
    .collection('users')
    .doc(user?.email)
    .collection('orderData')
    .orderBy('orderPlacedData',
    descending: true)
    .get()
    .then((value) async{
    //  orderList=value.docs.map((e) => doc.id).toList();
    });

  }

}

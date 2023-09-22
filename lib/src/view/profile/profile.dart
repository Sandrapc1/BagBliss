// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:bag_bliss/src/view/profile/widgets/body.dart';
import 'package:flutter/material.dart';
import '../../../core/colors.dart';

class Profile extends StatelessWidget {
  const Profile({super.key, this.addressdata, this.addressId});
 final addressdata;
 final addressId;
  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    // var height = size.height;
    // var width = size.width;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: white),
        backgroundColor: appbar,
        title:const Text('Profile',style: TextStyle(color: white),),
      ),
      body: SingleChildScrollView(
        child: ProfileBody(addressData: addressdata, addressId: addressId)),
      

    );
  }
}
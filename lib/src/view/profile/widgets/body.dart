// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables
import 'dart:io';
import 'package:bag_bliss/core/colors.dart';
import 'package:bag_bliss/src/view/cart/cart.dart';
import 'package:bag_bliss/src/view/orders/order_screen.dart';
import 'package:bag_bliss/src/view/address/address_screen.dart';
import 'package:bag_bliss/src/controller/profile_controller.dart';
import 'package:bag_bliss/src/view/profile/edit.dart';
import 'package:bag_bliss/src/view/wishlist/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../authentication/auth.dart';
import '../../login/loginpage.dart';
import 'container.dart';



class ProfileBody extends StatelessWidget {
  ProfileBody({Key? key,required this.addressData,required this.addressId}) : super(key: key);
  final addressData;
  final addressId;
  final ProfileController profileControll = Get.put(ProfileController());
  
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
     var width = size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
              SizedBox(height: height*0.04,),
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Obx(() => CircleAvatar(
                    backgroundImage: profileControll.imagePath.value.isNotEmpty
                        ? FileImage(File(profileControll.imagePath.value))
                            as ImageProvider
                        : const AssetImage('assets/images/profile.jpg'),
                    radius: 80,
                  )),
            ],
          ),
          SizedBox(height: height*0.02),
            Row(
            mainAxisAlignment: MainAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                 SizedBox(width: width*0.1),
               const Text('User name',style: TextStyle(color: appbar),),
             
              IconButton(icon: const Icon(Icons.edit_document,color:boxcolorstock,), 
              onPressed: () {Get.to( EditScreen());},)
            ],
          ),
          // SizedBox(height: height * 0.07),
           Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                Containers(height: height, width: width, 
                head: 'My Order', 
                icons: Icons.delivery_dining, onTap: () { Get.to(const OrderScreen()); },),
                SizedBox(height: height*0.03),
                Containers(height: height, width: width, 
                head: 'Address', 
                icons: Icons.location_on, onTap: () { Get.to( AddressScreen(addressdata:addressData, addressId: addressId)); },),
                 SizedBox(height: height*0.03),
                Containers(height: height, width: width, 
                head: 'WishList', 
                icons: Icons.favorite, onTap: () { Get.to(const WishList()); },),
                 SizedBox(height: height*0.03),
                  Containers(height: height, width: width, 
                head: 'Cart', 
                icons: Icons.shopping_cart_rounded, onTap: () { Get.to( CartScreen()); },),
                 SizedBox(height: height*0.05),
                 Container(   
                  height: height*0.04,
                  width: width*0.4,
                 decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(25),
              border: Border.all(
               color: red,
               width: 2
              ),
          ),
          child: InkWell(
            onTap:() {
                Get.defaultDialog(
                  title: 'Are you sure you want to ',
                  titleStyle: const TextStyle(fontSize: 15),
                  middleText: 'Logout?',
                  textCancel: 'Cancel',
                  cancelTextColor: Colors.black,
                  textConfirm: 'Confirm',
                  confirmTextColor: white,
                  backgroundColor: white,
                  onCancel: () {},
                  onConfirm: () {
                  GoogleFirebase().signOut().then((value) {
                    // GetPage(name: , page: page)
                Get.off(LoginPage());
                }); },
                  buttonColor: Colors.red
                );
            }, 
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.logout,color: red,size: 30),
                 SizedBox(width: width*0.02),
                 const Text('LogOut',style: TextStyle(color: red,fontSize: 18,),)
                ]),
                
              
            ),
          )
                //  Containers(height: height, width: width, 
                // head: 'LogOut', 
                // icons: Icons.logout, onTap: () { Get.to(const CartScreen()); },),
              ],
            ),
          )
          
        ],
      ),
    );
  }
}



// ignore_for_file: unused_local_variable

import 'package:bag_bliss/core/colors.dart';
import 'package:bag_bliss/src/view/categories/categories.dart';
import 'package:bag_bliss/src/view/home/home.dart';
import 'package:bag_bliss/src/view/profile/profile.dart';
import 'package:bag_bliss/src/view/wishlist/wishlist.dart';
import 'package:bag_bliss/src/controller/bottam_controller.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottamSheet extends StatelessWidget {
  const BottamSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(BottamSheetController());
    return GetBuilder<BottamSheetController>(
      builder: (controller) {
        return Scaffold(
          extendBody: true,
          body: IndexedStack(
            index: controller.tabIndex,
           children:  [
            HomeScreen(),
             CategoriesScreen(),
            const WishList(),
            const Profile()  
           ],
          ),
          bottomNavigationBar: SizedBox(
            height: 80,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                 borderRadius: BorderRadius.circular(50),
                      child: CurvedNavigationBar(
                height: 50,
                backgroundColor:appbar,
                color: appbar,
                buttonBackgroundColor: Colors.white54,
                onTap: controller.changeTabIndex,
                
                items:const <Widget> [
                 Icon(Icons.home,color: white),
                Icon(Icons.widgets_outlined,color: white,),
                Icon(Icons.favorite,color: white),
                Icon(Icons.person,color: white)
                ],
               
                 ),
                      ),
            ),
        ));
      },
      );
  }
}


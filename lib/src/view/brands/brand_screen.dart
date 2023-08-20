// ignore_for_file: sized_box_for_whitespace

import 'package:bag_bliss/core/colors.dart';
import 'package:bag_bliss/src/view/brands/widget/brand_all.dart';
import 'package:flutter/material.dart';

List<Map<String, String>> imagePath = [
    {'imagePath': 'assets/images/baggit1.jpg', 'productName': 'Baggit','discripation':'Women Textured Shoulder Bag','price':'Rs:2000'},
    {'imagePath': 'assets/images/baggit2.jpg', 'productName': 'Baggit','discripation':'Black Structured Sling Bag','price':'Rs:2350'},
    {'imagePath': 'assets/images/baggit3.jpg', 'productName': 'Baggit','discripation':'Textured Structured Sling Bag','price':'Rs:3200'},
    {'imagePath': 'assets/images/baggit4.jpg', 'productName': 'Baggit','discripation':'Structured Sling Bag','price':'Rs: 1500'},
    {'imagePath': 'assets/images/MessengerBag.jpg', 'productName': 'Baggit','discripation':'Brown Structured Shoulder Bag','price':'Rs:2500'},
    //  {'imagePath': 'assets/images/catgr3.jpg', 'productName': 'Tote Bag'},
  ];

class BrandScreen extends StatelessWidget {
  const BrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbar,
        iconTheme: const IconThemeData(color: white),
        title: const Text('Baggit',style: TextStyle(color: white),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.only(top: height*0.03),
          child: Column(
           children: [
             Container(
                    height: height,
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: imagePath.length,
                      itemBuilder: (context, index) {
                        return ProductsScreen(height: height, width: width, 
                      itemImage: imagePath[index]['imagePath']!, 
                      itemName: imagePath[index]['productName']!, 
                      discripation: imagePath[index]['discripation']!,
                      price: imagePath[index]['price']!,
                      );}, 
                      gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, 
                      //  crossAxisSpacing: 0,
                       mainAxisSpacing: 1, 
                       childAspectRatio: (.3/.38)
                       ),
                    ),
             )
           ], 
          ),
        ),
      )
    );
  }
}
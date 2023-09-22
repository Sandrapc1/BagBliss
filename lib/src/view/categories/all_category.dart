import 'package:bag_bliss/src/view/categories/widgets/category_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../core/colors.dart';

List<Map<String, String>> imagePath = [
  {'imagePath': 'assets/images/categ1.jpg', 'productName': 'Cross Bag'},
  {'imagePath': 'assets/images/catgr3.jpg', 'productName': 'Tote Bag'},
  {'imagePath': 'assets/images/cart3.jpg', 'productName': 'Shoulder Bag'},
  {'imagePath': 'assets/images/Clutch2.jpg', 'productName': 'Clutches Bag'},
  {'imagePath': 'assets/images/MessengerBag.jpg','productName': 'Messengerr Bag'},
];

class ScreenAllCategory extends StatelessWidget {
  const ScreenAllCategory({super.key, required this.categoryStream});
  final Stream<QuerySnapshot<Map<String, dynamic>>>? categoryStream;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbar,
        title: const Text('Categories', style: TextStyle(color: white)),
      ),
      body: GridView.builder(
        // physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: imagePath.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 1,
            childAspectRatio: (.3 / .38)),
        itemBuilder: (context, index) {
          return ProductcategoriesTile(
            height: height,
            width: width,
            imagePath: imagePath[index]['imagePath']!,
            categoryName: imagePath[index]['productName']!,
            categoryStream: FirebaseFirestore.instance
                .collection('products')
                .where('category', isEqualTo: imagePath[index]['productName'])
                .snapshots(),
          );
        },
      ),
    );
  }
}

import 'package:bag_bliss/core/colors.dart';
import 'package:bag_bliss/src/controller/brand_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../home/widgets/product_card.dart';


final BrandController brandController=Get.put(BrandController());
class BrandScreen extends StatelessWidget {
  const BrandScreen({super.key,required this.brandStream, required this.brandName, });
  final Stream<QuerySnapshot<Map<String, dynamic>>>? brandStream;
 final  String brandName;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbar,
        iconTheme: const IconThemeData(color: white),
        title:Text(brandName,style: const TextStyle(color: white)),
        // title: const Text('Baggit',style: TextStyle(color: white),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.only(top: height*0.03),
          child: StreamBuilder(
            stream: brandStream,
            builder: (context, snapshot) {
              // print('------------${snapshot.data!.docs}');
           
                if (!snapshot.hasData) {
                return  SizedBox(
                  height: height,
                  width: width,
                  child: const Center(child: Text('Nothing Found')));
              }
              if (snapshot.hasData) {
                return GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final DocumentSnapshot productsnapshot =
                            snapshot.data!.docs[index];
                    return ProductCard(
                        height: height,
                        width: width,
                        itemName: productsnapshot['name'],
                        itemImage:  productsnapshot['image'][0],
                        price: productsnapshot['price'],
                        id: productsnapshot['id'],
                        brand: productsnapshot['brand'],
                        quantity: productsnapshot['quantity'],
                        description: productsnapshot['description'],
                        category: productsnapshot['category']);
                  },
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          //  crossAxisSpacing: 0,
                          mainAxisSpacing: 1,
                          childAspectRatio: (.3 / .38)),
                );
              }
             
              if (snapshot.hasError) {
                return const Center(child: Text('Error'));
              }
             
              return const Center(child: CircularProgressIndicator());
            }),
        ),
      )
    );
  }
}
// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, avoid_unnecessary_containers, sized_box_for_whitespace, unused_element
import 'package:bag_bliss/core/colors.dart';
import 'package:bag_bliss/src/view/cart/cart.dart';
import 'package:bag_bliss/src/view/search/search.dart';
import 'package:bag_bliss/src/view/widget/drawer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/product_card.dart';
import 'widgets/brand_products.dart';
import 'widgets/categories_product.dart';



class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key});

  int activeIndex = 0;
  List imageList = [
    'assets/images/sidder2.jpg',
    'assets/images/sidder3.jpg',
    'assets/images/sidder5.jpg',
    'assets/images/siddered.jpg'
  ];
  final CarouselController carouselController = CarouselController();
  // int currentindex=0;
  List<Map<String, String>> imagePath = [
    {'imagePath': 'assets/images/categ1.jpg', 'productName': 'Cross Bag'},
    {'imagePath': 'assets/images/catgr3.jpg', 'productName': 'Tote Bag'},
    {'imagePath': 'assets/images/cart3.jpg', 'productName': 'Shoulder Bag'},
    {'imagePath': 'assets/images/Clutch2.jpg', 'productName': 'Clutches Bag'},
    {
      'imagePath': 'assets/images/MessengerBag.jpg',
      'productName': 'Messengerr Bag'
    },
  ];
  List brandsImage = [
    // 'assets/images/lavie.png',
    'assets/images/Baggit.jpg',
    'assets/images/allensolly.png',
    'assets/images/h&m.jpg',
    'assets/images/saint.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final CollectionReference product =
        FirebaseFirestore.instance.collection('products');
    void deleteproduct(docId) {
      product.doc(docId).delete();
    }

    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      appBar: AppBar(
        actionsIconTheme: const IconThemeData(color: white),
        backgroundColor: appbar,
        title: const Text(
          'Bag Bliss',
          style: TextStyle(
            color: white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                color: Colors.black,
                offset: Offset(2, 2),
                blurRadius: 4,
              ),
            ],
          ),
        ),
        iconTheme: const IconThemeData(color: white),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(SearchScreen());
            },
            icon: const Icon(
              Icons.search,
              size: 30,
            ),
          ),
          const SizedBox(width: 3),
          IconButton(
            onPressed: () {
              Get.to( CartScreen());
            },
            icon: const Icon(
              Icons.shopping_cart_rounded,
              size: 30,
            ),
          ),
        ],
      ),
      drawer: const DrawerBar(),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // shrinkWrap: true,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CarouselSlider.builder(
                    itemCount: imageList.length,
                    itemBuilder: (context, index, realIndex) {
                      final imageUrl = imageList[index];
                      return buildImage(imageUrl, index);
                    },
                    options: CarouselOptions(
                      height: height * 0.2,
                      autoPlay: true,
                      reverse: true,
                      enlargeCenterPage: true,
                      autoPlayInterval: const Duration(seconds: 2),
                      onPageChanged: (index, reason) {
                        activeIndex = index;
                      },
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  const Text('Categories',
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
                  // SizedBox(height: height * 0.01),
                  SizedBox(
                    height: height * 0.2,
                    width: width * 0.9,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: imagePath.length,
                      itemBuilder: (context, index) {
                        return Productcategories(
                          height: height,
                          width: width,
                          imagePath: imagePath[index]['imagePath']!,
                          productName: imagePath[index]['productName']!,
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(width: width * 0.05);
                      },
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Brands',
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold)),
                      Text(
                        'See all',
                        style: TextStyle(color: appbar),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.02),
                  SizedBox(
                    height: height * 0.1,
                    // width: width*0.09,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Brandproducts(
                          height: height,
                          width: width,
                          brandsImage: brandsImage[index],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(width: width * 0.02);
                      },
                      itemCount: brandsImage.length,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('All'),
                      Text(
                        'See all',
                        style: TextStyle(color: appbar),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Container(
                    height: height,
                    child: StreamBuilder(
                        stream: FirebaseFirestore.instance.collection('products').snapshots(),
                        builder: (context,  snapshot) {
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
                                    itemImage: productsnapshot['image'][0]!,
                                    itemName: productsnapshot['name']!,
                                    price: productsnapshot['price']!, 
                                    id: productsnapshot['id'],
                                  );
                                },
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        //  crossAxisSpacing: 0,
                                        mainAxisSpacing: 5,
                                        childAspectRatio: (.3 / .38)));
                          }
                          return Container();
                        }),
                  ),
                ])),
      ),
    );
  }

  Widget buildImage(String imageUrl, int index) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        // color: Colors.red,
        width: double.infinity,
        child: Image.asset(
          imageUrl,
          fit: BoxFit.cover,
        ),
      );

  // Widget buildIndicator()=>AnimatedSmoothIndicator(
  //   activeIndex: activeIndex,
  //   count: imageList.length);
}

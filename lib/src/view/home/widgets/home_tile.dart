// ignore_for_file: camel_case_types, sized_box_for_whitespace
import 'package:bag_bliss/src/view/home/widgets/product_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../../core/colors.dart';
import 'brand_products.dart';
import 'categories_product.dart';
List imageList = [
  'assets/images/sidder2.jpg',
  'assets/images/sidder3.jpg',
  'assets/images/sidder5.jpg',
  'assets/images/siddered.jpg'
];
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
List brandsList = ['Baggit', 'Allen Solly', 'H&M', 'Saint Laurent'];
int activeIndex = 0;

class Home_Tile extends StatelessWidget {
  const Home_Tile({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Column(
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
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
        // SizedBox(height: height * 0.01),
        SizedBox(
          height: height * 0.2,
          width: width,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: imagePath.length,
            itemBuilder: (context, index) {
              return Productcategories(
                height: height,
                width: width,
                imagePath: imagePath[index]['imagePath']!,
                categoryName: imagePath[index]['productName']!,
                categoryStream: FirebaseFirestore.instance
                    .collection('products')
                    .where('category',
                        isEqualTo: imagePath[index]['productName']!)
                    .snapshots(),
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
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
            Text(
              'more',
              style: TextStyle(color: appbar),
            ),
          ],
        ),
        SizedBox(height: height * 0.02),
        SizedBox(
          height: height * 0.1,
          width: width,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: brandsImage.length,
            itemBuilder: (context, index) {
              return Brandproducts(
                height: height,
                width: width,
                brandsImage: brandsImage[index],
                brandStream: FirebaseFirestore.instance
                    .collection('products')
                    .where('brand', isEqualTo: brandsList[index])
                    .snapshots(),
                brandName: brandsList[index],
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(width: width * 0.05);
            },
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
              'more',
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
              stream:
                  FirebaseFirestore.instance.collection('products').snapshots(),
              builder: (context, snapshot) {
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
                          brand: productsnapshot['brand'],
                          quantity: productsnapshot['quantity'],
                          description: productsnapshot['description'],
                          category: productsnapshot['category'],
                        );
                      },
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              //  crossAxisSpacing: 0,
                              mainAxisSpacing: 5,
                              childAspectRatio: (.3 / .34)));
                }
                return Container();
              }),
        ),
      ],
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
}

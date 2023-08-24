
// ignore_for_file: sized_box_for_whitespace

import 'package:bag_bliss/core/colors.dart';
import 'package:bag_bliss/src/view/home/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/search_controller.dart';
// import 'search_controller.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  final SearchScreenController searchController =
      Get.put(SearchScreenController());
  final TextEditingController searchtextController = TextEditingController();

  
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search',
          style: TextStyle(color: white),
        ),
        iconTheme: const IconThemeData(color: white),
        backgroundColor: appbar,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height * 0.04,
            ),
            Container(
              height: height * 0.04,
              width: width * 0.73,
              alignment: Alignment.center,
              child: TextField(
                controller: searchtextController,
                maxLines: 1,
                onChanged: searchController.searchProduct,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.search,
                    color: boxcolorstock,
                  ),
                  hintText: 'Search ...',
                  hintStyle: const TextStyle(
                    color: boxcolorfill,
                    fontSize: 17,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      searchtextController.clear();
                      searchController.searchResult.clear();
                    },
                    icon: const Icon(Icons.clear),
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.1),
            Obx(() {
              final searchResults = searchController.searchResult;

              if (searchResults.isEmpty) {
                return Container(
                  height: height*0.6,
                  child: const Center(child: Text('No results found.')));
              }

              return Container(
                height: height,
                child: Obx(() => GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: searchResults.length,
                      itemBuilder: (context, index) {
                        return ProductCard(
                          height: height,
                          width: width,
                          itemName:searchController.searchResult[index]['name'] ,
                        itemImage:searchController.searchResult[index]['image'][0] ,
                        price: searchController.searchResult[index]['price'],
                         id: searchController.searchResult[index]['id'], 
                         brand: searchController.searchResult[index]['brand'],
                          quantity: searchController.searchResult[index]['quantity'], 
                          description: searchController.searchResult[index]['description'], 
                          category: searchController.searchResult[index]['category'],
                        );
                      },
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 1,
                        childAspectRatio: (.3 / .38),
                      ),
                    )),
              );
            }),
          ],
        ),
      ),
    );
  }
}

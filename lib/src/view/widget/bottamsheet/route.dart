
// ignore_for_file: non_constant_identifier_names

import 'package:bag_bliss/src/view/categories/categories.dart';
import 'package:bag_bliss/src/view/home/home.dart';
import 'package:bag_bliss/src/view/profile/profile.dart';
import 'package:bag_bliss/src/view/wishlist/wishlist.dart';
import 'package:bag_bliss/src/view/widget/bottamsheet/bottamnavigation.dart';
import 'package:get/get.dart';

class AppPage {

static List<GetPage> routes=[
GetPage(name: bottamsheet, page: () =>  const BottamSheet()),
GetPage(name: Home, page: () =>  HomeScreen()),
// GetPage(name: Categories, page: () =>  CategoriesScreen(),),
GetPage(name: Wishlist, page: () => const WishList(),),
GetPage(name: Account, page: () => const Profile(),)
];



 static getbottamsheet()=>bottamsheet;
 static getHome()=>Home;
 static getCategories()=>Categories;
 static getWishlist()=>Wishlist;
 static getAccount()=>Account;



  static String bottamsheet='/';
  
  static String Home='/Home';
  static String Categories='/Categories';
  static String Wishlist='/Wishlist';
  static String Account='/Account';
}
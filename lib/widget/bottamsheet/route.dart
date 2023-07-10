
// ignore_for_file: non_constant_identifier_names

import 'package:bag_bliss/screen/categories/categories.dart';
import 'package:bag_bliss/screen/home/home.dart';
import 'package:bag_bliss/screen/profile/profile.dart';
import 'package:bag_bliss/screen/wishlist/wishlist.dart';
import 'package:bag_bliss/widget/bottamsheet/bottamnavigation.dart';
import 'package:get/get.dart';

class AppPage {

static List<GetPage> routes=[
GetPage(name: bottamsheet, page: () =>  const BottamSheet()),
GetPage(name: Home, page: () => const HomeScreen()),
GetPage(name: Categories, page: () => const CategoriesScreen(),),
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
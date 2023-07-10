// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import 'controller.dart';

// class LandingPage extends StatelessWidget {
//   final TextStyle unselectedLabelStyle = TextStyle(
//       color: Colors.white.withOpacity(0.5),
//       fontWeight: FontWeight.w500,
//       fontSize: 12);

//   final TextStyle selectedLabelStyle =
//       const TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12);

//   LandingPage({super.key});

//   buildBottomNavigationMenu(context, landingPageController) {
//     return Obx(() => MediaQuery(
//         data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
//         child: SizedBox(
//           height: 54,
//           child: BottomNavigationBar(
//             showUnselectedLabels: true,
//             showSelectedLabels: true,
//             onTap: landingPageController.changeTabIndex,
//             currentIndex: landingPageController.tabIndex.value,
//             backgroundColor: const Color.fromRGBO(36, 54, 101, 1.0),
//             unselectedItemColor: Colors.white.withOpacity(0.5),
//             selectedItemColor: Colors.white,
//             unselectedLabelStyle: unselectedLabelStyle,
//             selectedLabelStyle: selectedLabelStyle,
//             items: [
//               BottomNavigationBarItem(
//                 icon: Container(
//                   margin: const EdgeInsets.only(bottom: 7),
//                   child: const Icon(
//                     Icons.home,
//                     size: 20.0,
//                   ),
//                 ),
//                 label: 'Home',
//                 backgroundColor: const Color.fromRGBO(36, 54, 101, 1.0),
//               ),
//               BottomNavigationBarItem(
//                 icon: Container(
//                   margin: const EdgeInsets.only(bottom: 7),
//                   child: const Icon(
//                     Icons.search,
//                     size: 20.0,
//                   ),
//                 ),
//                 label: 'Explore',
//                 backgroundColor: const Color.fromRGBO(36, 54, 101, 1.0),
//               ),
//               BottomNavigationBarItem(
//                 icon: Container(
//                   margin: const EdgeInsets.only(bottom: 7),
//                   child: const Icon(
//                     Icons.location_history,
//                     size: 20.0,
//                   ),
//                 ),
//                 label: 'Places',
//                 backgroundColor: const Color.fromRGBO(36, 54, 101, 1.0),
//               ),
//               BottomNavigationBarItem(
//                 icon: Container(
//                   margin: const EdgeInsets.only(bottom: 7),
//                   child: const Icon(
//                     Icons.settings,
//                     size: 20.0,
//                   ),
//                 ),
//                 label: 'Settings',
//                 backgroundColor: const Color.fromRGBO(36, 54, 101, 1.0),
//               ),
//             ],
//           ),
//         )));
//   }

//   @override
//   Widget build(BuildContext context) {
//     final LandingPageController landingPageController =
//         Get.put(LandingPageController(), permanent: false);
//     return SafeArea(
//         child: Scaffold(
//       bottomNavigationBar:
//           buildBottomNavigationMenu(context, landingPageController),
//       body: Obx(() => IndexedStack(
//             index: landingPageController.tabIndex.value,
//             children: [
//               // HomePage(),
//               // ExplorePage(),
//               // PlacesPage(),
//               // SettingsPage(),
//             ],
//           )),
//     ));
//   }
// }

// ignore_for_file: unused_local_variable

// import 'package:flutter/foundation.dart';
import 'package:bag_bliss/colors/colors.dart';
import 'package:bag_bliss/screen/categories/categories.dart';
import 'package:bag_bliss/screen/home/home.dart';
import 'package:bag_bliss/screen/profile/profile.dart';
import 'package:bag_bliss/screen/wishlist/wishlist.dart';
import 'package:bag_bliss/widget/bottamsheet/controller.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class BottamSheet extends StatelessWidget {
  const BottamSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(BottamSheetController());
    return GetBuilder<BottamSheetController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: black,
          body: IndexedStack(
            index: controller.tabIndex,
           children: const [
            HomeScreen(),
            CategoriesScreen(),
            WishList(),
            Profile()  
           ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            elevation: 20,
            backgroundColor: Colors.cyan,
            selectedItemColor: appbar,
            // unselectedItemColor: black,
            currentIndex: controller.tabIndex,
            onTap: controller.changeTabIndex,
            items:[
              _bottamSheetItem(Icons.home_rounded,'Home'),
              _bottamSheetItem(Icons.widgets_outlined,'Categories'),
              _bottamSheetItem(Icons.favorite,'Wishlist'),
              _bottamSheetItem(Icons.person,'Account'),

            ]
             ),
        );
      },
      );
  }
}

_bottamSheetItem(IconData icon,String label){
return BottomNavigationBarItem(icon: Icon(icon),label: label);
}
// ignore_for_file: use_build_context_synchronously, non_constant_identifier_names, must_be_immutable
import 'dart:io';
import 'package:bag_bliss/core/colors.dart';
import 'package:bag_bliss/src/controller/theme_controller.dart';
// import 'package:bag_bliss/src/view/login/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
// import '../../../authentication/auth.dart';

class DrawerBar extends StatelessWidget {
   DrawerBar({super.key});
  final ThemeController themeController=Get.put(ThemeController());
 var isDarkMode=false;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: white,
      // backgroundColor: const Color.fromARGB(255, 223, 220, 220),
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
                // color: boxcolorfill
                ),
            child: Column(
              children: [
                ClipRRect(
                    child: Image.asset(
                  'assets/images/applogo.png',
                  height: 90,
                  width: 100,
                )),
                const Text(
                  'Bag Bliss',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )
              ],
            ),
          ),
          Column(
            children: [
               ListTile(
                onTap: () {},
                title: const Text(
                  'About',
                  style: TextStyle(color: black),
                ),
                leading: const Icon(
                  Icons.info,
                  color: black,
                ),
              ),
               ListTile(
              onTap: () {},
              title: const Text('Theme', style: TextStyle(color: Colors.black)),
              leading: Obx(
                () => Switch(
                  value: themeController.isDarkMode.value,
                  onChanged: (state) {
                    themeController.toggleTheme();
                  },
                ),
              ),
            ),
              //  ListTile(
              //   onTap: () {},
              //   title: const Text('Theme', style: TextStyle(color: black)),
              //   leading: Switch(value: isDarkMode,
              //    onChanged: (state) {
              //      themeController.changeTheme(state);
              //    },)
                
              //   //  const Icon(
              //   //   Icons.color_lens_rounded,
              //   //   color: black,
              //   // ),
              // ),
               ListTile(
                onTap: () {
                  Share.share('https://github.com/Sandrapc1/BagBliss');
                },
                title: const Text('Share', style: TextStyle(color: black)),
                leading: const Icon(
                  Icons.share,
                  color: black,
                ),
              ),
              InkWell(
                onTap: (){
                },
                child:  ListTile(
                  onTap: () {
                   Get.defaultDialog(
                  title: 'Are you sure you want to ',
                  titleStyle: const TextStyle(fontSize: 15),
                  middleText: 'Exit?',
                  textCancel: 'Cancel',
                  cancelTextColor: Colors.black,
                  textConfirm: 'Confirm',
                  confirmTextColor: white,
                  backgroundColor: white,
                  onCancel: () {},
                  onConfirm: () {
                  exit(0);
                },
                  buttonColor: Colors.red
                );
                    
                  },
                  title: const Text('Exit', style: TextStyle(color: red)),
                  leading: const Icon(
                    Icons.logout_sharp,
                    color: red,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

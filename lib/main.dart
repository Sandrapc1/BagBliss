import 'package:bag_bliss/colors/colors.dart';
import 'package:bag_bliss/screen/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bag Bliss',
      theme: ThemeData(
        textTheme: GoogleFonts.expletusSansTextTheme(Theme.of(context).textTheme),
        colorScheme: ColorScheme.fromSeed(seedColor:appbar),
        useMaterial3: true,
        
      ),
      // Get.changeTheme(
      //     Get.isDarkMode ? ThemeData.light() : ThemeData.dark(),
      //     );
      home:  const Splash(),
    );
  }
}





import 'package:bag_bliss/core/colors.dart';
import 'package:bag_bliss/firebase_options.dart';
import 'package:bag_bliss/src/view/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
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
        iconTheme: const IconThemeData(color: white),
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





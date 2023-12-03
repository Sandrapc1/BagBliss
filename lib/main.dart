import 'package:bag_bliss/core/colors.dart';
import 'package:bag_bliss/core/size.dart';
import 'package:bag_bliss/firebase_options.dart';
import 'package:bag_bliss/src/controller/theme_controller.dart';
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
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

final ThemeController themeController=Get.put(ThemeController());


  @override
  Widget build(BuildContext context) {
    kheight=MediaQuery.sizeOf(context).height;
    kwidth=MediaQuery.of(context).size.width;
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bag Bliss',
      theme: ThemeData(
        iconTheme: const IconThemeData(color: white),
        textTheme: GoogleFonts.expletusSansTextTheme(Theme.of(context).textTheme),
        colorScheme: ColorScheme.fromSeed(seedColor:appbar),
        useMaterial3: true,
        
      ),  
      home:  const Splash(),
    );
  }
}



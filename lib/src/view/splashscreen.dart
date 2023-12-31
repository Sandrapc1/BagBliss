import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:bag_bliss/src/view/login/loginpage.dart';
import 'package:bag_bliss/src/view/widget/bottamsheet/bottamnavigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      curve: Curves.easeInOutCubic,
      splash: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/applogo.png',
          height: 130,
          width: 200,),
          Text('Bag Bliss',style: GoogleFonts.expletusSans(
            color: const Color.fromARGB(255, 0, 0, 0),
            fontSize: 25,
            fontWeight: FontWeight.w700
          ),)
        ],
      ), 
      nextScreen:  StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const BottamSheet();
          }else{
            return LoginPage();
          }
        },
       ),
      splashIconSize: 250,
      duration: 900,
      splashTransition: SplashTransition.fadeTransition,
      animationDuration: const Duration(seconds: 1)
      );

  }



}
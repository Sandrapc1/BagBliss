import 'dart:async';
import 'package:bag_bliss/src/view/home/home.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OrderPlaced extends StatelessWidget {
  const OrderPlaced({super.key});

  @override
  Widget build(BuildContext context) {
     var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return  Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: width * 0.25, top: height * 0.08),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           Lottie.asset('assets/lottie/animation_lmc142c2.json',height: height*0.5,width:width*0.5,
           onLoaded: (p0) => wait(context),
           )  ,
        ],
        ),
      ),
    );
             
  }

  wait( BuildContext context){
    Timer(
    const  Duration(
        milliseconds: 3000
      ), () {
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomeScreen()), 
        (route) => false);
       });
  }
}
import 'package:bag_bliss/core/colors.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return  Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: white),
        backgroundColor: appbar,
        title: const Text('Order'),),
        body:  SingleChildScrollView(
          child: Column(
            children: [
             Container(
             height: height*0.02,
             width: width,
             ) 
            ],
          ),
        ),
    );
  }
}
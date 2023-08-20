import 'package:flutter/material.dart';

class OrderPlaced extends StatelessWidget {
  const OrderPlaced({super.key});

  @override
  Widget build(BuildContext context) {
     var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return  Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: width * 0.35, top: height * 0.45),
        child: const Column(
          children: [
            Text('PLACE ORDER',style: TextStyle(color: Colors.green,fontSize: 20),)
        // Get.snackbar('', 'PLACE ORDER')        
        ],
        ),
      ),
    );
  }
}
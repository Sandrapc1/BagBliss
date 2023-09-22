// ignore_for_file: sized_box_for_whitespace
import 'package:bag_bliss/core/colors.dart';
import 'package:flutter/material.dart';
import 'widgets/order_tile.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: appbar,
          iconTheme: const IconThemeData(color: white),
          title: const Text(
            'Order Summary',
            style: TextStyle(color: white),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Order Details',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: height * 0.02),
                const Divider(),
                OrderTile(height: height, width: width),
                SizedBox(height: height * 0.02),
                const Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

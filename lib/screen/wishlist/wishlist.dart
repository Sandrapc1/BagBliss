import 'package:bag_bliss/colors/colors.dart';
import 'package:flutter/material.dart';

class WishList extends StatelessWidget {
  const WishList({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: appbar,
        title:const Text('WishList'),
      ),
    );
  }
}
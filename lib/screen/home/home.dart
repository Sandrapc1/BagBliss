import 'package:bag_bliss/colors/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: appbar,
          title: const Text('Home'),
      ),
      drawer:const Drawer(),
    );
  }
}
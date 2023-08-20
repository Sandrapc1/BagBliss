import 'package:bag_bliss/src/view/profile/widgets/body.dart';
import 'package:flutter/material.dart';

import '../../../core/colors.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    // var height = size.height;
    // var width = size.width;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: white),
        backgroundColor: appbar,
        title:const Text('Profile',style: TextStyle(color: white),),
      ),
      body: SingleChildScrollView(
        child: ProfileBody()),
      

    );
  }
}
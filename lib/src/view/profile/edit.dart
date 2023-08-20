import 'dart:io';

import 'package:bag_bliss/core/colors.dart';
import 'package:bag_bliss/src/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditScreen extends StatelessWidget {
  EditScreen({super.key});
  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: appbar),
        title: const Text(
          'Edit Profile',
          style: TextStyle(color: appbar),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Obx(() => CircleAvatar(
                      backgroundImage: controller.imagePath.value.isNotEmpty
                          ? FileImage(File(controller.imagePath.value))
                              as ImageProvider
                          : const AssetImage('assets/images/profile.jpg'),
                      radius: 80,
                    )),
                Positioned(
                  bottom: 0,
                  child: InkWell(
                    onTap: () async {
                      await controller.takePhoto();
                    },
                    child: const Icon(
                      Icons.camera_alt,
                      color: appbar,
                      size: 25,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.02),
            Padding(
              padding: const EdgeInsets.all(35),
              child: Column(
                children: [
                  const TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), label: Text('user name')),
                  ),
                  SizedBox(height: height * 0.03),
                  const TextField(
                    keyboardType: TextInputType.number,
                    maxLength: 10,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('phone number'),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: height*0.07),
            TextButton(
              onPressed: () {
                Get.back();
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(appbar),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
                  fixedSize: MaterialStateProperty.all(
                      Size(width * 0.7, height * 0.05))),
              child: const Text('SAVE',style:TextStyle(color: white,fontSize: 21),),
            )
          ],
        ),
      ),
    );
  }
}

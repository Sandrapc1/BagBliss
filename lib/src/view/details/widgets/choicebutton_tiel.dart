import 'package:bag_bliss/src/controller/choicechip_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/colors.dart';


final ChoiceButtonController choiceButtonController=Get.find();
Widget buildChoiceButton(String choice , String selectedChoiceButton, double height,double width){
  final bool isSelected = choice == selectedChoiceButton;
  final Color boxcolorfill=isSelected? Colors.blue : Colors.white;
  final Color textColor=isSelected? Colors.white : Colors.black;
  // final Color appBar=Colors.blue;
  return GestureDetector(
    onTap: () {
      choiceButtonController.updateChoiceButton(choice);
    },
      child: Container(
        height: height * 0.04,
        width: width * 0.1,
        decoration: BoxDecoration(
          color: boxcolorfill,
          shape: BoxShape.circle,
          border: Border.all(color: appbar),
        ),
        child: Center(
          child: Text(
            choice,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  
}
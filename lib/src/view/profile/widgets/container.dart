import 'package:flutter/material.dart';
import '../../../../core/colors.dart';

class Containers extends StatelessWidget {
  const Containers({
    super.key,
    required this.height,
    required this.width, 
    required this.head, 
    required this.icons, required this.onTap,
  });

  final double height;
  final double width;
  final String head;
  final IconData icons;
final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height*0.06,
      width: width*0.7,
      decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(25),
           border: Border.all(
            color: appbar,
            width: 2
           ),
          ),
          child: InkWell(
            onTap:onTap ,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icons,color: appbar,size: 30),
                 SizedBox(width: width*0.02),
                 Text(head,style: const TextStyle(color: appbar,fontSize: 18,),)
                ]),
                
              
            ),
          );
    
  }
}
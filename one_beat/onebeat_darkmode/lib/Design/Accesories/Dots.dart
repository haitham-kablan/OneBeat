


import 'package:flutter/material.dart';
import 'package:onebeat_darkmode/Design/ColorsPallete/Pallete.dart';

Widget Dots(int index){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: index == 0 ? greenClr : Colors.grey[600],
            shape: BoxShape.circle,
          ),

      ),
      SizedBox(width: 20,),
      Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          color:  index == 1 ? greenClr : Colors.grey[600],
          shape: BoxShape.circle,
        ),

      ),
      SizedBox(width: 20,),
      Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          color:  index == 2 ? greenClr : Colors.grey[600],
          shape: BoxShape.circle,
        ),

      ),
    ],
  );

}
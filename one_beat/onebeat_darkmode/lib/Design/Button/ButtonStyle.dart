



import 'package:flutter/material.dart';
import 'package:onebeat_darkmode/Design/ColorsPallete/Pallete.dart';
import 'package:onebeat_darkmode/Design/TextStyle/TextStyle.dart';

Widget button(Color bgClr,String txt,Color txtClr,raduis,width,height,onTap){

  return Container(
    width: width,
    height: height,
    child: Material(
      elevation: 0,
      borderRadius: raduis,
      color: backGroundClr,
      child: Center(
        child: InkWell(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: raduis,
              color: bgClr,
              border: Border.all(color:Colors.grey[800]! , width: 0.7),
            ),
            width: width,
            height: height,
            child: Center(
              child: Text(txt,style: assistantStyle(txtClr, 18)),
            ),
          ),
        ),
      ),
    ),
  );
}


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onebeat_darkmode/ColorsPallete/ColorsPallete.dart';

Widget button(Color bgClr,String txt,Color txtClr,raduis,width,height,onTap){

  return Container(
    width: width,
    height: height,
    child: Material(
      elevation: 3,
      borderRadius: raduis,
      color: backGroundClr,
      child: Center(
        child: InkWell(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: raduis,
              color: bgClr,
            ),
            width: width,
            height: height,
            child: Center(
              child: Text(txt,style: TextStyle(color: txtClr,fontSize: 18,)),
            ),
          ),
        ),
      ),
    ),
  );

}
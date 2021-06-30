

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onebeat_darkmode/ColorsPallete/ColorsPallete.dart';

Widget button(Color bgClr,String txt,Color txtClr,raduis,width,height,Widget to,context){

  return Container(
    width: width,
    height: height,
    child: Material(
      elevation: 10,
      borderRadius: raduis,
      color: backGroundClr,
      child: Center(
        child: InkWell(
          onTap: (){
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => to), (Route<dynamic> route) => false);
          },
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
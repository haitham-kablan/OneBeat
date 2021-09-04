

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onebeat_darkmode/Design/ColorsPallete/Pallete.dart';


Widget HomeButton(Size size , String imagePath, String text){

  return Material(
    color: backGroundClr,
    elevation: 10,
    child: Container(
      color: backGroundClr,
      width: size.width * 0.3,
      height:  size.height * 0.16,
    ),
  );

}
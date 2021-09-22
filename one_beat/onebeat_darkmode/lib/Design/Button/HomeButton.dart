

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onebeat_darkmode/Design/ColorsPallete/Pallete.dart';
import 'package:onebeat_darkmode/Design/TextStyle/TextStyle.dart';


Widget HomeButton(Size size , String imagePath, String text , {onClick = null}){

  return Material(
    color: backGroundClr,
    borderRadius: BorderRadius.circular(10),
    elevation: 3,
    child: InkWell(
      splashColor: greyClr,
      onTap: onClick,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: greyClr,
        ),
        width: size.width * 0.27,
        height:  size.height * 0.13,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath ,width :40 , height: 40,),
            SizedBox(height: 10,),
            Text(text , style: GoogleFonts.rubik(
              color: Colors.white,
              fontSize: 17,
            ),),
          ],
        ),
      ),
    ),
  );

}
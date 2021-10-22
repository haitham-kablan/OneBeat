

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onebeat_darkmode/Design/ColorsPallete/Pallete.dart';

TextStyle pageHeader(double? size){
  return GoogleFonts.assistant(
    color: greenClr,
    fontWeight: FontWeight.bold,
    fontSize: size,
  );

}

TextStyle pageSecondHeader(double? size){
  return GoogleFonts.assistant(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: size,
  );
}

TextStyle explaintion(double? size){
  return GoogleFonts.assistant(
    color: Colors.white,
    fontSize: size,
  );
}


TextStyle whiteText(double? size){
  return GoogleFonts.assistant(
        color: Colors.white,
        fontSize: size,
      );
}

TextStyle greenText(double? size){
  return GoogleFonts.assistant(
    color: greenClr,
    fontSize: size,
  );
}
Text simpleText(Color clr , double? size , String text){
  return Text(text,style: assistantStyle(clr,size),);
}
TextStyle assistantStyle(Color clr , double? size){
  return GoogleFonts.assistant(
    color: clr,
    fontSize: size,
  );
}
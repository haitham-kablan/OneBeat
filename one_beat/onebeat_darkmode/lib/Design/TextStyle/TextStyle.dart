

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle pageHeader(double? size){
  return GoogleFonts.rubik(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: size,
  );

}

TextStyle pageSecondHeader(double? size){
  return GoogleFonts.rubik(
    color: Color(0xff707070),
    fontWeight: FontWeight.bold,
    fontSize: size,
  );
}

TextStyle explaintion(double? size){
  return GoogleFonts.assistant(
    color: Color(0xff707070),
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
    color: Color(0xff00A270),
    fontSize: size,
  );
}
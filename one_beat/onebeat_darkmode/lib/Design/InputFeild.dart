

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onebeat_darkmode/Design/ColorsPallete/Pallete.dart';

Widget InpuTextFeild(String hint,Icon icon,Color bgClr,
    Color hintClr,Color txtClr,Color borderClr, padding,controller,{obsecure = false}){

  return Directionality(
    textDirection: TextDirection.rtl,
    child: Padding(
      padding: padding,
      child: Material(
        color: Colors.transparent,
        elevation: 1,
        child: TextFormField(
          obscureText: obsecure,
          controller: controller,
          style: TextStyle(color: txtClr),
          decoration: InputDecoration(
            filled: true,
            fillColor: bgClr,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: greenClr,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: backGroundClr,
              ),
            ),
            labelText: hint,
            labelStyle: TextStyle(color: hintClr),
            prefixIcon: icon,
          ),
        ),
      ),
    ),
  );

}


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onebeat_darkmode/ColorsPallete/ColorsPallete.dart';
import 'package:onebeat_darkmode/Design/Button.dart';

class EmptyFaq extends StatelessWidget {
  String expString = "הגעת לעמדת השאלות שלנו , כאן אתה יכול לשאול מה שבא לך או לראות שאלות של אחרים";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backGroundClr,
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset('assets/topLeftLogo.png'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset('assets/pencil.png',height: 120,width: 120,),
              SizedBox(width: 20,)
            ],
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(top: 20,bottom: 20,left: 40,right: 40),
            child: Text(expString,
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white,fontStyle: FontStyle.italic,fontSize: 17),
            ),
          ),
          SizedBox(height: 60,),
          button(greenClr, "הוספת שאלה", Colors.white, BorderRadius.circular(20), size.width * 0.5, size.width * 0.085, (){}),
          SizedBox(height: 20,),
          button(backGroundClr, "שאלות אחרים", Colors.white, BorderRadius.circular(20), size.width * 0.5, size.width * 0.085, (){}),
        ],
      ),
    );
  }
}

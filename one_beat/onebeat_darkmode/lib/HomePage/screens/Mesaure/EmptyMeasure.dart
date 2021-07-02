
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onebeat_darkmode/ColorsPallete/ColorsPallete.dart';
import 'package:onebeat_darkmode/Design/Button.dart';
import 'package:onebeat_darkmode/HomePage/screens/FAQ/EmptyFaq.dart';

class EmptyMeasure extends StatefulWidget {
  @override
  _EmptyMeasureState createState() => _EmptyMeasureState();
}

class _EmptyMeasureState extends State<EmptyMeasure> {
  String expString = "הגעת לאיזור המדידות שלך , כאן אתה יכול לעקוב אחרי התוצאות שלך ולבדוק את ההתקדמות";
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
          SizedBox(height: 50,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/muscles.png'),
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
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(top: 20,bottom: 20,left: 40,right: 40),
            child: Text("נא עדכן את הפרטים שלך",
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
              style: TextStyle(color: greenClr,fontStyle: FontStyle.italic,fontSize: 17),
            ),
          ),
          SizedBox(height: 10,),
          button(backGroundClr, "עדכון פרטים", Colors.white, BorderRadius.circular(20), size.width * 0.5, size.width * 0.085, (){}),
        ],
      ),
    );
  }
}

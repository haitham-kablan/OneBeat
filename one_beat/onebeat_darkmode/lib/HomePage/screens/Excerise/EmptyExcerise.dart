
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onebeat_darkmode/ColorsPallete/ColorsPallete.dart';
import 'package:onebeat_darkmode/Design/Button.dart';
import 'package:onebeat_darkmode/HomePage/screens/FAQ/EmptyFaq.dart';

class EmptyExcerise extends StatelessWidget {
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
          SizedBox(height: 70,),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/plan.png'),
              ],
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(top: 20,bottom: 20,left: 40,right: 40),
            child: Text("עדיין אין לך תוכנית אימון ? \nצור אחת בעצמך או דבר עם המאמן!",
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white,fontStyle: FontStyle.italic,fontSize: 17),
            ),
          ),
          SizedBox(height: 20,),
          button(backGroundClr, "בניית תוכנית", Colors.white, BorderRadius.circular(20), size.width * 0.5, size.width * 0.085, EmptyFaq(), context),

        ],
      ),
    );
  }
}

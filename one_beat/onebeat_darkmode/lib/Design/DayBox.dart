

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onebeat_darkmode/ColorsPallete/ColorsPallete.dart';

class DayBox extends StatelessWidget {

  final String day;
  final bool isPressed;
  final onpress;

  const DayBox({Key? key,  required this.day, this.onpress,  required this.isPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
      color: Color(0xff272727),
      borderRadius: BorderRadius.circular(10),
      elevation: 3,
      child: InkWell(
        onTap: onpress,
        child: Container(
          width: size.width * 0.17,
          height: size.height * 0.07,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: isPressed ? Border(
              top: BorderSide(width: 0.8,color: greenClr),
              bottom: BorderSide(width: 0.8,color: greenClr),
              left: BorderSide(width: 0.8,color: greenClr),
              right: BorderSide(width: 0.8,color: greenClr),
            ) : Border(
              top: BorderSide(width: 0,color: backGroundClr),
              bottom: BorderSide(width: 0,color: backGroundClr),
              left: BorderSide(width: 0,color: backGroundClr),
              right: BorderSide(width: 0,color: backGroundClr),
            ),
            color: Color(0xff272727),
          ),

          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  day,
                  style: TextStyle(color: offWhite),textDirection: TextDirection.rtl,
                ),
              ],

            ),
          ),
        ),
      ),
    );
  }
}

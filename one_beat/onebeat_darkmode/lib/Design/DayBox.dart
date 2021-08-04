

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onebeat_darkmode/ColorsPallete/ColorsPallete.dart';

class DayBox extends StatelessWidget {

  final String day;
  final onpress;

  const DayBox({Key? key, required this.day, this.onpress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
      color: backGroundClr,
      borderRadius: BorderRadius.circular(10),
      elevation: 10,
      child: InkWell(
        onTap: onpress,
        child: Container(
          width: size.width * 0.25,
          height: size.height * 0.11,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: backGroundClr,
          ),

          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Day",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 10,),
                Text(
                  day,
                  style: TextStyle(color: greenClr),
                ),
              ],

            ),
          ),
        ),
      ),
    );
  }
}

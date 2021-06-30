

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onebeat_darkmode/ColorsPallete/ColorsPallete.dart';
import 'package:onebeat_darkmode/Design/Button.dart';
import 'package:onebeat_darkmode/Design/InputFeild.dart';
import 'package:onebeat_darkmode/HomePage/HomePage.dart';

class LogInPage extends StatefulWidget {
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        color: backGroundClr,
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              SizedBox(height: 50,),
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Center(
                  child: Image.asset("assets/logoandonebeat.png"),
                ),
              ),
              SizedBox(height: 70,),
              Center(
                child: InpuTextFeild(
                    "דואל",
                    Icon(Icons.mail,color: greenClr,),
                    Colors.white,
                    mainHintClr,
                    Colors.black,
                    Colors.white,EdgeInsets.only(left: 50,right: 50)),
              ),
              SizedBox(height: 20,),
              Center(
                child: InpuTextFeild(
                    "סיסמה",
                    Icon(Icons.vpn_key,color: greenClr,),
                    Colors.white,
                    mainHintClr,
                    Colors.black,
                    Colors.white,EdgeInsets.only(left: 50,right: 50)),
              ),
              SizedBox(height: 40,),
              button(greenClr, "כניסה", Colors.white, BorderRadius.circular(10), size.width * 0.4, size.height * 0.05,HomePage(),context),
              SizedBox(height: 10,),
              RichText(
                text: TextSpan(
                  children: const <TextSpan>[
                    TextSpan(text: 'עדיין אין לך משתמש? ', style: TextStyle(color: offWhite)),
                    TextSpan(text: "לחץ כאן להרשמה",style: TextStyle(color: greenClr)),
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }
}

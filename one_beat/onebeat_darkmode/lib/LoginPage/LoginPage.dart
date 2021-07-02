

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:onebeat_darkmode/ColorsPallete/ColorsPallete.dart';
import 'package:onebeat_darkmode/Design/Button.dart';
import 'package:onebeat_darkmode/Design/InputFeild.dart';
import 'package:onebeat_darkmode/HomePage/HomePage.dart';
import 'package:onebeat_darkmode/ReigesterPage/ReigesterPage.dart';

class LogInPage extends StatefulWidget {
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  TextEditingController emailControler = TextEditingController();
  TextEditingController passwordControler = TextEditingController();
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
                    Colors.white,EdgeInsets.only(left: 50,right: 50),emailControler),
              ),
              SizedBox(height: 20,),
              Center(
                child: InpuTextFeild(
                    "סיסמה",
                    Icon(Icons.vpn_key,color: greenClr,),
                    Colors.white,
                    mainHintClr,
                    Colors.black,
                    Colors.white,EdgeInsets.only(left: 50,right: 50),passwordControler,obsecure: true),
              ),
              SizedBox(height: 40,),
              button(greenClr, "כניסה", Colors.white, BorderRadius.circular(10), size.width * 0.4, size.height * 0.05,(){
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomePage()), (Route<dynamic> route) => false);
              }),
              SizedBox(height: 10,),
              RichText(
                text: TextSpan(
                  children:  <TextSpan>[
                    TextSpan(text: 'עדיין אין לך משתמש? ', style: TextStyle(color: offWhite)),
                    TextSpan(text: "לחץ כאן להרשמה",style: TextStyle(color: greenClr),
                    recognizer: TapGestureRecognizer()..onTap = () => {
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ReigesterPage()),
                      )}
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }
}

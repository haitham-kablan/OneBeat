

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:onebeat_darkmode/ColorsPallete/ColorsPallete.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:onebeat_darkmode/ColorsPallete/ColorsPallete.dart';
import 'package:onebeat_darkmode/DataBase/Authentication/Authentication.dart';
import 'package:onebeat_darkmode/Design/Button.dart';
import 'package:onebeat_darkmode/Design/InputFeild.dart';
import 'package:onebeat_darkmode/Design/ShowError.dart';
import 'package:onebeat_darkmode/HomePage/HomePage.dart';
import 'package:onebeat_darkmode/LoginPage/LoginPage.dart';
import 'package:onebeat_darkmode/ReigesterPage/ReigesterPage.dart';
import 'package:onebeat_darkmode/Users/CurrentUser.dart';



Future exitDialogue(double height , double width , context){
  return showDialog(
      context: context,
      builder: (context) => Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: navBarClr,
          ),
          height: height * 0.25,
          width: width * 0.8,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset("topLeftLogo.png",width: 65,height: 65,),
                ],
              ),
              SizedBox(height: 20,),
              Text("האם אתה בטוח שרוצה לצאת ?",style: TextStyle(fontSize: 15,decoration: TextDecoration.none,color: Colors.white,fontWeight: FontWeight.bold),textDirection: TextDirection.rtl,textAlign: TextAlign.center,),
              SizedBox(height: 20,),
              Align(
                alignment: Alignment.bottomLeft,
                child: Row(
                  children: [
                    SizedBox(width: 40,),
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                        child: Text("לא",style: TextStyle(fontSize: 15,decoration: TextDecoration.none,color: Color(0xffAFAFAF)),textDirection: TextDirection.rtl,)),
                    SizedBox(width: 60,),
                    GestureDetector(
                      onTap: () async{
                        await AuthenticationService.Logout();

                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) => LogInPage()),
                                (Route<dynamic> route) => false);
                      },
                        child: Text("כן",style: TextStyle(fontSize: 15,decoration: TextDecoration.none,color: Color(0xffAFAFAF)),textDirection: TextDirection.rtl,)),
                    Spacer(flex: 1,),

                  ],
                ),
              ),
            ],
          )
          ),
        ),
  );
}

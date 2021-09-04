

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onebeat_darkmode/Design/Accesories/Dots.dart';
import 'package:onebeat_darkmode/Design/Button/ButtonStyle.dart';
import 'package:onebeat_darkmode/Design/ColorsPallete/Pallete.dart';
import 'package:onebeat_darkmode/Design/TextStyle/TextStyle.dart';
import 'package:onebeat_darkmode/Home/Home.dart';

class WelcomePage3 extends StatefulWidget {
  const WelcomePage3({Key? key}) : super(key: key);

  @override
  _WelcomePage3State createState() => _WelcomePage3State();
}

class _WelcomePage3State extends State<WelcomePage3> {

  bool male = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Material(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: backGroundClr,
          body: Column(
            children: [
              SizedBox(height: size.height * 0.05,),
              Text("שלב 3 מתוך 3" , style: pageHeader(20),),
              SizedBox(height: size.height * 0.02,),
              Text("נתונים אישיים" , style: pageSecondHeader(20),),
              SizedBox(height: size.height * 0.03,),
              Center(
                  child: Container(
                      width: size.width * 0.8,
                      child: Text("עדכן את הנתונים האישיים שלך כדי שתוכל לעקוב אחריהם ולהשיג את התוצאות שחלמת עליהן", style: explaintion(20) , textAlign: TextAlign.center,))),
              SizedBox(height: size.height * 0.05,),
              Padding(
                padding: const EdgeInsets.only(left: 40,right: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 40,
                      child: TextField(
                        style: greenText(17),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: "160",
                          hintStyle: explaintion(17),
                        ),
                      ),
                    ),
                    Text("גובה  (ס\"מ)" , style: pageSecondHeader(17),textDirection: TextDirection.rtl,),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.02,),
              Padding(
                padding: const EdgeInsets.only(left: 30 , right: 30),
                child: Container(
                  height: 1,
                  color: SeperatorClr,
                ),
              ),
              SizedBox(height: size.height * 0.02,),
              Padding(
                padding: const EdgeInsets.only(left: 40,right: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 40,
                      child: TextField(
                        style: greenText(17),
                        keyboardType: TextInputType.datetime,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: "70",
                          hintStyle: explaintion(17),
                        ),
                      ),
                    ),
                    Text("משקל  (ק\"ג)" , style: pageSecondHeader(17),textDirection: TextDirection.rtl,),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.02,),
              Padding(
                padding: const EdgeInsets.only(left: 30 , right: 30),
                child: Container(
                  height: 1,
                  color: SeperatorClr,
                ),
              ),
              SizedBox(height: size.height * 0.02,),
              Padding(
                padding: const EdgeInsets.only(left: 40,right: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 40,
                      child: TextField(
                        style: greenText(17),
                        keyboardType: TextInputType.datetime,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: "20",
                          hintStyle: explaintion(17),
                        ),
                      ),
                    ),
                    Text("גיל" , style: pageSecondHeader(17),),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.03,),
              Padding(
                padding: const EdgeInsets.only(left: 30 , right: 30),
                child: Container(
                  height: 1,
                  color: SeperatorClr,
                ),
              ),
              SizedBox(height: size.height * 0.03,),
              Padding(
                padding: const EdgeInsets.only(left: 35,right: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: (){
                            setState(() {
                              male = true;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                bottomLeft: Radius.circular(5),
                              ),
                              color: male ? greenClr : Colors.white,
                              border: Border.all(
                                color: greenClr,
                                width: 2,
                              ),
                            ),
                            width: 60,
                            height: 27,

                            child: Center(
                              child: Text("זכר" , style: male ? whiteText(15) : greenText(15)),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            setState(() {
                              male = false;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(5),
                                bottomRight: Radius.circular(5),
                              ),
                              color: !male ? greenClr : Colors.white,
                              border: Border.all(
                                color: greenClr,
                                width: 2,
                              ),
                            ),
                            width: 60,
                            height: 27,

                            child: Center(
                              child: Text("נקבה" , style: !male ? whiteText(15) : greenText(15)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text("מין" , style: pageSecondHeader(17),),
                  ],
                ),
              ),
              Spacer(flex: 1,),
              button(greenClr , "התחל" , Colors.white , BorderRadius.circular(30),size.width * 0.8,size.height * 0.06,(){
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => Home(),
                  ),
                      (route) => false,
                );
              }),
              SizedBox(height: size.height * 0.05,),
              Dots(2),
              SizedBox(height: size.height * 0.05,),

            ],
          ),
        ),
      ),
    );
  }
}

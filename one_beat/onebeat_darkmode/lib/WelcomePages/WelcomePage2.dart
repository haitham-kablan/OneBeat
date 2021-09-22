

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:onebeat_darkmode/Design/Accesories/Dots.dart';
import 'package:onebeat_darkmode/Design/Animation/PageTransition.dart';
import 'package:onebeat_darkmode/Design/Button/ButtonStyle.dart';
import 'package:onebeat_darkmode/Design/ColorsPallete/Pallete.dart';
import 'package:onebeat_darkmode/Design/ShowError.dart';
import 'package:onebeat_darkmode/Design/TextStyle/TextStyle.dart';

import 'WelcomePage3.dart';

class WelcomePage2 extends StatefulWidget {
  const WelcomePage2({Key? key}) : super(key: key);

  @override
  _WelcomePage2State createState() => _WelcomePage2State();
}

class _WelcomePage2State extends State<WelcomePage2> {
  int index = -1;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Material(
        child: Scaffold(
          backgroundColor: backGroundClr,
          body: Column(
            children: [
              SizedBox(height: size.height * 0.05,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.chevron_left,color: Colors.white,),
                  ),
                  Text("שלב 2 מתוך 3" , style: pageHeader(20),),
                  IconButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.chevron_left,color: Colors.transparent,),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.03,),
              Center(
                  child: Container(
                    width: size.width * 0.8,
                      child: Text("בחר את רמת הכושר המתאימה לך", style: assistantStyle(Colors.white, 20) , textAlign: TextAlign.center,))),
              SizedBox(height: size.height * 0.04,),
              InkWell(
                onTap: (){
                  setState(() {
                    index = 0;
                  });
                },
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: Text("מתחיל" , style: index == 0 ? pageHeader(20): GoogleFonts.assistant(
                            color: emptyDotClr,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),)),
                    ),
                    SizedBox(height: size.height * 0.02,),
                    Padding(
                      padding: const EdgeInsets.only(right: 45,left: 45),
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              index == 0 ? Icon(Icons.check , color: greenClr,) : Container(),
                              index == 0 ? Text("אתה חדש לתחום האימונים" , style: greenText(17),) :
                              Text("אתה חדש לתחום האימונים" , style: GoogleFonts.assistant(
                                color: emptyDotClr,
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.05,),
              Padding(
                padding: const EdgeInsets.only(left: 30 , right: 30),
                child: Container(
                  height: 1,
                  color: emptyDotClr,
                ),
              ),
              SizedBox(height: size.height * 0.05,),
              InkWell(
                onTap: (){
                  setState(() {
                    index = 1;
                  });
                },
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: Text("בינוני" , style: index == 1 ? pageHeader(20): GoogleFonts.assistant(
                            color: emptyDotClr,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),)),
                    ),
                    SizedBox(height: size.height * 0.02,),
                    Padding(
                      padding: const EdgeInsets.only(right: 45,left: 45),
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              index == 1 ? Icon(Icons.check, color: greenClr,) : Container(),
                              index == 1? Text("אתה מתאמן באופן קבוע" , style: greenText(17),) :
                              Text("אתה מתאמן באופן קבוע" , style: GoogleFonts.assistant(
                                color: emptyDotClr,
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.05,),
              Padding(
                padding: const EdgeInsets.only(left: 30 , right: 30),
                child: Container(
                  height: 1,
                  color: emptyDotClr,
                ),
              ),
              SizedBox(height: size.height * 0.05,),
              InkWell(
                onTap: (){
                  setState(() {
                    index = 2;
                  });
                },
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: Text("מתקדם" , style: index == 2 ? pageHeader(20): GoogleFonts.assistant(
                            color: emptyDotClr,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),)),
                    ),
                    SizedBox(height: size.height * 0.02,),
                    Padding(
                      padding: const EdgeInsets.only(right: 45,left: 45),
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              index == 2 ? Icon(Icons.check , color: greenClr,) : Container(),
                              index == 2 ? Container(
                                width: size.width * 0.7,
                                  child: Text("אתה נמצא הכושר שיא ומוכן לתוכנית אימון אינטנסיבית" , style: greenText(17),textDirection: TextDirection.rtl,)) :
                              Container(
                                width: size.width * 0.7,
                                  child: Text("אתה נמצא הכושר שיא ומוכן לתוכנית אימון אינטנסיבית" , style: GoogleFonts.assistant(
                                    color: emptyDotClr,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  ),textDirection: TextDirection.rtl,)),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.05,),
              Padding(
                padding: const EdgeInsets.only(left: 30 , right: 30),
                child: Container(
                  height: 1,
                  color: emptyDotClr,
                ),
              ),
              Spacer(flex: 1,),
              button(greenClr , "הבא" , Colors.white , BorderRadius.circular(30),size.width * 0.8,size.height * 0.06,(){

                if(index == -1){
                  ShowError(context, "נא בחר את רמת הכושר המתאימה עבורך");
                  return;
                }
                Navigator.push(
                  context,
                  CustomPageRoute(child: WelcomePage3()),
                );
              }),
              SizedBox(height: size.height * 0.05,),
              Dots(1),
              SizedBox(height: size.height * 0.05,),
            ],
          ),
        ),
      ),
    );
  }
}

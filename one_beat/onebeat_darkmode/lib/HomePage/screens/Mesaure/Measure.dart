

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:onebeat_darkmode/ColorsPallete/ColorsPallete.dart';
import 'package:onebeat_darkmode/DataBase/Services/DataBaseService.dart';
import 'package:onebeat_darkmode/Design/Button.dart';
import 'package:onebeat_darkmode/Users/CurrentUser.dart';
import 'package:onebeat_darkmode/Users/TrainerUser.dart';

class Measure extends StatefulWidget {
  @override
  _MeasureState createState() => _MeasureState();
}

class _MeasureState extends State<Measure> {


  double weight = (currentUser as TrainerUser).kgWeight;
  double bodyfat = (currentUser as TrainerUser).bodyFatPercentage;
  double stomach = (currentUser as TrainerUser).cmStomachSize;
  double hand = (currentUser as TrainerUser).cmArmSize;
  double goalweight = (currentUser as TrainerUser).goalkgWeight;
  double goalbodyfat = (currentUser as TrainerUser).goalbodyFatPercentage;
  double goalstomach = (currentUser as TrainerUser).goalcmStomachSize;
  double goalhand = (currentUser as TrainerUser).goalcmArmSize;
  bool isSwitched = false;
  bool isClicked = false;
  bool isLoading = false;
  String expString = "הגעת לאיזור המדידות שלך , כאן אתה יכול לעקוב אחרי התוצאות שלך ולבדוק את ההתקדמות";
  bool isLoading2 = false;




  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return (currentUser as TrainerUser).firstMeasure ? Scaffold(
      backgroundColor: backGroundClr,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Row(
              //   children: [
              //     SizedBox(width: 20,),
              //     Image.asset('assets/muscles.png',width: 100,height: 100,),
              //     Spacer(flex: 1,),
              //     Image.asset('assets/topLeftLogo.png'),
              //
              //   ],
              // ),
              SizedBox(height: 15,),
              Column(
                children: [
                  Column(
                      children: [
                        isSwitched ? Container(margin:EdgeInsets.only(left: 13),child: Image.asset('assets/greengoodgoal.png',width: 100,height: 100,)) :
                        Image.asset('assets/muscles.png',width: 100,height: 100,),
                        SizedBox(height: 10,),
                        Center(
                          child: FlutterSwitch(
                            value: isSwitched,
                            width: 60,
                            height: 20,
                            toggleSize: 10,
                            inactiveColor: navBarClr,
                            activeColor: Color(0xff00d694),
                            onToggle: (bool value) {
                              setState(() {
                                isSwitched = value;
                                isClicked = false;
                                print(isSwitched);
                              });
                            },
                          ),
                        ),


                      ],
                    ),
                  SizedBox(height: 5,),
                  isSwitched ? Center(child: Text("יעד שלך",style: TextStyle(color: Colors.white,fontSize: 17),)):
                  Center(child: Text("מצב הוכחי",style: TextStyle(color: Colors.white,fontSize: 17),)),
                ],
              ),
              SizedBox(height: 25,),
              isSwitched ? Padding(
                padding: const EdgeInsets.only(left: 35,right: 35),
                child: Row(
                  children: [
                    Text("משקל יעד (ק\"ג)",textDirection: TextDirection.rtl,style: TextStyle(color: Colors.white,fontSize: 17,fontStyle: FontStyle.italic),),
                    Spacer(flex: 1,),
                    Text(goalweight.toStringAsFixed(1),style: TextStyle(color: Colors.white,fontSize: 15),),
                  ],
                ),
              ) : Padding(
                padding: const EdgeInsets.only(left: 35,right: 35),
                child: Row(
                  children: [
                    Text("משקל (ק\"ג)",textDirection: TextDirection.rtl,style: TextStyle(color: Colors.white,fontSize: 17,fontStyle: FontStyle.italic),),
                    Spacer(flex: 1,),
                    Text("("  +(goalweight - weight).toStringAsFixed(1) + ")",style: TextStyle(color: greenClr,fontSize: 15),),
                    SizedBox(width: 3,),
                    Text(goalweight > weight ? "-" : "+",style: TextStyle(color: greenClr,fontSize: 20),),
                    SizedBox(width: 15,),
                    Text(weight.toStringAsFixed(1),style: TextStyle(color: Colors.white,fontSize: 15),),
                  ],
                ),
              ),
              isSwitched ?
              Slider(
                  activeColor: greenClr,
                  inactiveColor: navBarClr,
                  min: 20,
                  max: 180,
                  value: goalweight,
                  onChanged: (val){
                    setState(() {
                      goalweight = val;
                      isClicked = true;
                    });
                  }) : Slider(
                activeColor: greenClr,
                inactiveColor: navBarClr,
                min: 20,
                  max: 180,
                  value: weight,
                  onChanged: (val){
                    setState(() {
                      weight = val;
                      isClicked = true;
                    });
                  }),
              SizedBox(height: 10,),
              isSwitched ? Padding(
                padding: const EdgeInsets.only(left: 35,right: 35),
                child: Row(
                  children: [
                    Text("יעד אחוז שומן (%)",textDirection: TextDirection.rtl,style: TextStyle(color: Colors.white,fontSize: 17,fontStyle: FontStyle.italic),),
                    Spacer(flex: 1,),
                    Text(goalbodyfat.toStringAsFixed(1),style: TextStyle(color: Colors.white,fontSize: 15),),
                  ],
                ),
              ): Padding(
                padding: const EdgeInsets.only(left: 35,right: 35),
                child: Row(
                  children: [
                    Text("אחוז שומן (%)",textDirection: TextDirection.rtl,style: TextStyle(color: Colors.white,fontSize: 17,fontStyle: FontStyle.italic),),
                    Spacer(flex: 1,),
                    Text("("  +(goalbodyfat - bodyfat).toStringAsFixed(1) + ")",style: TextStyle(color: greenClr,fontSize: 15),),
                    SizedBox(width: 3,),
                    Text(goalbodyfat > bodyfat ? "-" : "+",style: TextStyle(color: greenClr,fontSize: 20),),
                    SizedBox(width: 15,),
                    Text(bodyfat.toStringAsFixed(1),style: TextStyle(color: Colors.white,fontSize: 15),),
                  ],
                ),
              ),
              isSwitched ? Slider(
                  activeColor: greenClr,
                  inactiveColor: navBarClr,
                  min: 3,
                  max: 70,
                  value: goalbodyfat,
                  onChanged: (val){
                    setState(() {
                      goalbodyfat = val;
                      isClicked = true;
                    });
                  }) : Slider(
                  activeColor: greenClr,
                  inactiveColor: navBarClr,
                  min: 3,
                  max: 70,
                  value: bodyfat,
                  onChanged: (val){
                    setState(() {
                      bodyfat = val;
                      isClicked = true;
                    });
                  }),
              SizedBox(height: 10,),
              isSwitched ? Padding(
                padding: const EdgeInsets.only(left: 35,right: 35),
                child: Row(
                  children: [
                    Text("היקף יד יעד (ס\"מ)",textDirection: TextDirection.rtl,style: TextStyle(color: Colors.white,fontSize: 17,fontStyle: FontStyle.italic),),
                    Spacer(flex: 1,),
                    Text(goalhand.toStringAsFixed(1),style: TextStyle(color: Colors.white,fontSize: 15),),
                  ],
                ),
              ): Padding(
                padding: const EdgeInsets.only(left: 35,right: 35),
                child: Row(
                  children: [
                    Text("היקף יד (ס\"מ)",textDirection: TextDirection.rtl,style: TextStyle(color: Colors.white,fontSize: 17,fontStyle: FontStyle.italic),),
                    Spacer(flex: 1,),
                    Text("("  +(goalhand - hand).toStringAsFixed(1) + ")",style: TextStyle(color: greenClr,fontSize: 15),),
                    SizedBox(width: 3,),
                    Text(goalhand > hand ? "-" : "+",style: TextStyle(color: greenClr,fontSize: 20),),
                    SizedBox(width: 15,),
                    Text(hand.toStringAsFixed(1),style: TextStyle(color: Colors.white,fontSize: 15),),
                  ],
                ),
              ),
              isSwitched ? Slider(
                  activeColor: greenClr,
                  inactiveColor: navBarClr,
                  min: 10,
                  max: 70,
                  value: goalhand,
                  onChanged: (val){
                    setState(() {
                      goalhand = val;
                      isClicked = true;
                    });
                  }) : Slider(
                  activeColor: greenClr,
                  inactiveColor: navBarClr,
                  min: 10,
                  max: 70,
                  value: hand,
                  onChanged: (val){
                    setState(() {
                      hand = val;
                      isClicked = true;
                    });
                  }),
              SizedBox(height: 10,),
              isSwitched ? Padding(
                padding: const EdgeInsets.only(left: 35,right: 35),
                child: Row(
                  children: [
                    Text("היקף בטן יעד (ס\"מ)",textDirection: TextDirection.rtl,style: TextStyle(color: Colors.white,fontSize: 17,fontStyle: FontStyle.italic),),
                    Spacer(flex: 1,),
                    Text(goalstomach.toStringAsFixed(1),style: TextStyle(color: Colors.white,fontSize: 15),),

                  ],
                ),
              ): Padding(
                padding: const EdgeInsets.only(left: 35,right: 35),
                child: Row(
                  children: [
                    Text("היקף בטן (ס\"מ)",textDirection: TextDirection.rtl,style: TextStyle(color: Colors.white,fontSize: 17,fontStyle: FontStyle.italic),),
                    Spacer(flex: 1,),
                    Text("("  +(goalstomach - stomach).toStringAsFixed(1) + ")",style: TextStyle(color: greenClr,fontSize: 15),),
                    SizedBox(width: 3,),
                    Text(goalstomach > stomach ? "-" : "+",style: TextStyle(color: greenClr,fontSize: 20),),
                    SizedBox(width: 15,),
                    Text(stomach.toStringAsFixed(1),style: TextStyle(color: Colors.white,fontSize: 15),),

                  ],
                ),
              ),
              isSwitched ?Slider(
                  activeColor: greenClr,
                  inactiveColor: navBarClr,
                  min: 25,
                  max: 150,
                  value: goalstomach,
                  onChanged: (val){
                    setState(() {
                      goalstomach = val;
                      isClicked = true;
                    });
                  }) : Slider(
                  activeColor: greenClr,
                  inactiveColor: navBarClr,
                  min: 25,
                  max: 150,
                  value: stomach,
                  onChanged: (val){
                    setState(() {
                      stomach = val;
                      isClicked = true;
                    });
                  }),

              SizedBox(height: 15,),
              isLoading ?  CircularProgressIndicator(
                backgroundColor: navBarClr,
                color: greenClr,
              ): button(isClicked ? greenClr : backGroundClr, "עדכון נתונים", Colors.white, BorderRadius.circular(20), size.width * 0.5, size.width * 0.085, ()async{
                setState(() {
                  isLoading = true;
                });

                if(isSwitched){
                  await DataBaseService.updateGoalMeasures(goalweight, goalbodyfat, goalstomach, goalhand, currentUser as TrainerUser);
                }else{
                  await DataBaseService.updateCurrentMeasures(weight, bodyfat, stomach, hand, currentUser as TrainerUser);
                }
                setState(() {
                  isLoading = false;
                  isClicked = false;
                });
              }),
            ],
          ),
        ),
      ),
    ) : Scaffold(
      backgroundColor: backGroundClr,
      body: Column(
        children: [
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
          isLoading2 ?  CircularProgressIndicator(
            backgroundColor: navBarClr,
            color: greenClr,
          ):button(backGroundClr, "עדכון פרטים", Colors.white, BorderRadius.circular(20), size.width * 0.5, size.width * 0.085, ()async{
            setState(() {
              isLoading2 = true;
            });
            (currentUser as TrainerUser).firstMeasure = true;
            await DataBaseService.updateFeild(currentUser!.email, "firstMeasure", true);
            setState(() {
              isLoading2 = false;
            });
          }),
        ],
      ),
    );
  }
}



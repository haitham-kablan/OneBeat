



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onebeat_darkmode/DataBase/Services/DataBaseService.dart';
import 'package:onebeat_darkmode/DataBase/User/GymHeroUser.dart';
import 'package:onebeat_darkmode/Design/Animation/PageTransition.dart';
import 'package:onebeat_darkmode/Design/Button/HomeButton.dart';
import 'package:onebeat_darkmode/Design/ColorsPallete/Pallete.dart';
import 'package:onebeat_darkmode/Design/ShowError.dart';
import 'package:onebeat_darkmode/Design/TextStyle/TextStyle.dart';
import 'package:onebeat_darkmode/Home/HomePages/AllExcerises.dart';
import 'package:onebeat_darkmode/Home/HomePages/Mesure.dart';
import 'package:onebeat_darkmode/Home/HomePages/Support.dart';
import 'package:intl/intl.dart' as x;
import 'package:onebeat_darkmode/Home/adminHomePages/allUsers.dart';
import 'package:onebeat_darkmode/utils/GeneralExcerises.dart';
import 'package:onebeat_darkmode/utils/MainDrawer.dart';
import 'package:onebeat_darkmode/utils/ProgressBar.dart';
import 'package:onebeat_darkmode/utils/exitDialouge.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';


import 'Home.dart';
import 'HomePages/About.dart';
import 'HomePages/GeneralPlans.dart';
import 'HomePages/Hours.dart';
import 'HomePages/Location.dart';
import 'HomePages/Plans.dart';
import 'HomePages/goals.dart';


class GreetingHome extends StatefulWidget {

  const GreetingHome({Key? key}) : super(key: key);

  @override
  _GreetingHomeState createState() => _GreetingHomeState();
}

class _GreetingHomeState extends State<GreetingHome> {



  List<String> muscles = ["חזה","גב","יד קדמית","יד אחורית","כתפיים","בטן","רגליים"];
  int current = 0;
  int plansCurrent = 0;
  int picked = 0;
  List<Widget> musclesPics= [

  ];
  bool switched = false;



  void refresh(){
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {

    DateTime dateToday = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    Size size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
         // endDrawer: mainDr(size,context,refresh),
          backgroundColor: backGroundClr,
          body: SingleChildScrollView(
            child:
            Column(
                children: [
            SizedBox(height:size.height * 0.025),
            Row(
              children: [
                SizedBox(width: 30,),
                gymHeroUser.trainer ?
                InkWell(
                  onTap: (){
                    setState(() {
                      switched = !switched;
                    });

                  },
                  child: Row(
                    children: [
                      Text(switched ? "אזור מאמן": "אזור מתאמן",style: assistantStyle(Colors.grey[600]!, 15),),
                      SizedBox(width: 5,),
                      Icon(Icons.swap_horiz , color: greenClr,),
                    ],
                  ),
                ): Container(),
                Spacer(flex: 1,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("יום " + getDayFromEngDay() , style: assistantStyle(Colors.white,20),),
                    Text(dateToday.toString().split("-")[2].split(" ")[0] +" / "+ (dateToday.toString().split("-")[1][0] == "0" ?dateToday.toString().split("-")[1].substring(1) :  dateToday.toString().split("-")[1]) +" / "+  dateToday.toString().split("-")[0]  , style: assistantStyle(emptyDotClr,15),),
                  ],
                ),
                SizedBox(width: 15,),
                gymHeroUser.gender ? Image.asset("assets/maleFace.png" , width: 70,height: 70,) :
                Image.asset("assets/femaleFace.png", width: 65,height: 65,),
                SizedBox(width: 10,),

              ],
            ),
            SizedBox(height:size.height * 0.03),
            SizedBox(height:size.height * 0.025),
            Column(
                children: (gymHeroUser.trainer && switched)? [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Material(
                      color: backGroundClr,
                      borderRadius: BorderRadius.circular(10),
                      elevation: 3,
                      child: InkWell(
                        splashColor: greyClr,
                        onTap: () {
                          Navigator.push(context, CustomPageRoute(child: AllExcerises()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color:Colors.grey[800]! , width: 0.25),
                            color: greyClr,
                          ),
                          width: size.width * 0.42,
                          height:  size.height * 0.28,
                          child: Column(
                            children: [
                              SizedBox(height: 20,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text("תרגילי המערכת" , style: GoogleFonts.assistant(
                                    color: greenClr,
                                    fontSize: 14,
                                  )),
                                ],
                              ),
                              SizedBox(height: 25,),
                              Text(getSum().toString(), style: assistantStyle(Colors.white, 70),),
                              Text("תרגלים" , style: assistantStyle(Colors.grey[600]!, 20),),
                              SizedBox(height: 10,),
                              Text("לחץ לצפייה" , style: assistantStyle(greenClr, 12),),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Material(
                      color: backGroundClr,
                      borderRadius: BorderRadius.circular(10),
                      elevation: 3,
                      child: InkWell(
                        splashColor: greyClr,
                        onTap: () async{

                          AllUsers.pickedUser = null;
                          Navigator.push(context, CustomPageRoute(child: AllUsers(onClick: refresh,)));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color:Colors.grey[800]! , width: 0.25),
                            color: greyClr,
                          ),
                          width: size.width * 0.42,
                          height:  size.height * 0.28,
                          child: Column(
                            children: [
                              SizedBox(height: 10,),
                              Row(
                                children: [
                                  SizedBox(width: 10,),
                                  Icon(Icons.group,color: Colors.grey[600]!,),
                                  Spacer(flex: 1,),
                                  Text("משתמשי המערכת" , style: GoogleFonts.assistant(
                                    color: greenClr,
                                    fontSize: 14,
                                  )),
                                  SizedBox(width: 10,),
                                ],
                              ),
                              SizedBox(height: 25,),
                              DataBaseService.UsersCounter,
                              Text("משתמשים" , style: assistantStyle(Colors.grey[600]!, 20),),
                              SizedBox(height: 10,),
                              Text("לחץ לצפייה" , style: assistantStyle(greenClr, 12),),

                            ],
                          ),
                        ),
                      ),
                    ),


                  ],
                ),
                ]: [
                //SizedBox(height:20),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color:Colors.grey[800]! , width: 0.25),
                    color: greyClr,
                  ),
                  width:size.width* 0.9,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Row(
                            children: [
                              Image.asset("assets/ticket.png",width: 37,height: 37,),
                              Spacer(flex:1),
                              Text("מנוי אישי" , style: GoogleFonts.assistant(
                                color: greenClr,
                                fontSize: 18,
                              )),
                            ],
                          ),
                        SizedBox(height:20),
                        GymHeroUser.userMemberShip.startDay == "-" ? Center(
                          child: Container(
                              child: Text("נא לגשת למאמן כדי לעדכן פרטי מנויי",style: TextStyle(color: Colors.grey,fontSize: 13),textAlign: TextAlign.center,)),
                        ) : Container(
                          width:size.width * 0.8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("תאריך סיום" , style: GoogleFonts.assistant(
                                    color: Colors.white,
                                    fontSize: 14,
                                  )),
                                  SizedBox(height:6),
                                  Text(GymHeroUser.userMemberShip.endDay == "-" ? "_": GymHeroUser.userMemberShip.endDay +" / " + GymHeroUser.userMemberShip.endMonth + " / " + GymHeroUser.userMemberShip.endYaer,style: assistantStyle(Colors.grey[600]!, 14),),

                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("תאריך התחלה" , style: GoogleFonts.assistant(
                                    color: Colors.white,
                                    fontSize: 14,
                                  )),
                                  SizedBox(height:6),
                                  Text(GymHeroUser.userMemberShip.startDay == "-" ? "_": GymHeroUser.userMemberShip.startDay +" / " + GymHeroUser.userMemberShip.startMonth + " / " + GymHeroUser.userMemberShip.startYaer,style: assistantStyle(Colors.grey[600]!, 14),),

                                ],
                              ),

                            ],
                          ),
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //   children: [
                        //     LinearPercentIndicator(
                        //       isRTL:true,
                        //       width: size.width * 0.8,
                        //       animation: true,
                        //       lineHeight: 16.0,
                        //       animationDuration: 1000,
                        //       center: Text((daysBetween(DateTime.now() , DateTime(int.parse(GymHeroUser.userMemberShip.endYaer.length == 2 ? "20" +  GymHeroUser.userMemberShip.endYaer: GymHeroUser.userMemberShip.endYaer),int.parse(GymHeroUser.userMemberShip.endMonth),int.parse(GymHeroUser.userMemberShip.endDay))) - daysBetween(DateTime(int.parse(GymHeroUser.userMemberShip.startYaer),int.parse(GymHeroUser.userMemberShip.startMonth),int.parse(GymHeroUser.userMemberShip.startDay)) , DateTime(int.parse(GymHeroUser.userMemberShip.endYaer),int.parse(GymHeroUser.userMemberShip.endMonth),int.parse(GymHeroUser.userMemberShip.endDay)))).toStringAsFixed(0) + "%" , style: GoogleFonts.assistant(
                        //         color: Colors.white,
                        //         fontSize: 11,
                        //       )),
                        //       percent : getPercent(DateTime(int.parse(GymHeroUser.userMemberShip.startYaer),int.parse(GymHeroUser.userMemberShip.startMonth),int.parse(GymHeroUser.userMemberShip.startDay)) , DateTime(int.parse(GymHeroUser.userMemberShip.endYaer),int.parse(GymHeroUser.userMemberShip.endMonth),int.parse(GymHeroUser.userMemberShip.endDay))),
                        //       linearStrokeCap: LinearStrokeCap.roundAll,
                        //       backgroundColor:Colors.grey[600]!,
                        //       progressColor: greenClr,
                        //
                        //     ),
                        //   ],
                        // ),
                        SizedBox(height:20),
                      ],
                    ),
                  ),
                ),
                SizedBox(height:20),
            Container(
            width : size.width * 0.9,
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color:Colors.grey[800]! , width: 0.25),
            color: greyClr,
          ),
          child: Column(
            children: [
              SizedBox(height: 10,),
              Text("רמת עומס בחדר כושר (משוערך)" , style: GoogleFonts.assistant(
                color: greenClr,
                fontSize: 17,
              )),
              SizedBox(height: 20,),
              Row(
                children: [
                  Spacer(flex: 1,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Text("אין עומס" , style: GoogleFonts.assistant(
                            color: picked == 0 ? greenClr : Colors.grey[600]!,
                            fontSize: 14,
                          )),
                          SizedBox(width: 10,),
                          Container(
                            width: 10,
                            height: 10,
                            color: picked == 0 ? greenClr : Colors.grey[600]!,
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Text("עומס בינוני" , style: GoogleFonts.assistant(
                            color: picked == 1 ? greenClr : Colors.grey[600]!,
                            fontSize: 14,
                          )),
                          SizedBox(width: 10,),
                          Container(
                            width: 10,
                            height: 10,
                            color: picked == 1 ? greenClr : Colors.grey[600]!,
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Text("עמוס" , style: GoogleFonts.assistant(
                            color: picked == 2 ? greenClr : Colors.grey[600]!,
                            fontSize: 14,
                          )),
                          SizedBox(width: 10,),
                          Container(
                            width: 10,
                            height: 10,
                            color: picked == 2 ? greenClr : Colors.grey[600]!,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Spacer(flex: 1,),
                  CircularPercentIndicator(

                    radius: 90.0,
                    lineWidth: 5.0,
                    backgroundColor:greenClr,
                    animation: true,
                    animationDuration :1000,
                    percent: 1 - 0.2,
                    center: new Text(
                        "20.0%",
                        style: GoogleFonts.assistant(
                          color: greenClr,
                          fontSize: 17,
                        )
                    ),
                    // footer: new Text(
                    //   "Sales this week",
                    //     style: GoogleFonts.assistant(
                    //       color: greenClr,
                    //       fontSize: 17,
                    //     )
                    // ),
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: Colors.grey[600]!,
                  ),
                  Spacer(flex: 1,),
                ],
              ),
              SizedBox(height: 20,),
            ],
          ),
        ),
        SizedBox(height: 20,),
        Material(
          color:Colors.transparent,

          child: InkWell(
            onTap:(){
              Navigator.push(context,CustomPageRoute(child:GeneralPlans()));
            },
            child: Container(
              width : size.width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color:Colors.grey[800]! , width: 0.25),
                color: greyClr,
              ),
              child:Padding(
                padding: const EdgeInsets.only(right:10.0,left:10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(height:10),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.chevron_left,color: greenClr,), onPressed: () {
                          Navigator.push(context,CustomPageRoute(child:GeneralPlans()));
                        },
                        ),
                        Spacer(flex:1),
                        Text("תוכניות אימון למתחילים" , style: GoogleFonts.assistant(
                          color: greenClr,
                          fontSize: 17,
                        )),
                      ],
                    ),
                    SizedBox(height:10),
                    Row(
                      children: [
                        SizedBox(width:15),
                        Container(
                            margin:EdgeInsets.only(top:20),
                            child: Image.asset("assets/list_2_.png" ,width :30 , height: 30,)),
                        Spacer(flex:1),
                        Container(
                          width:size.width * 0.7,
                          child: Text(" אתה מעוניין בתחום האימונים ולא יודע איך להתחיל?\n אנחנו כאן בדיוק בשבילך.\nצפה בתוכניות האימון המומלצות עבור מתאמנים מתחילים והתחל את המסע שלך לגוף בריא יותר" , style: GoogleFonts.assistant(
                            color: Colors.grey[600]!,
                            fontSize: 14,
                          ),textAlign: TextAlign.right,textDirection: TextDirection.rtl,),
                        ),
                      ],
                    ),
                    SizedBox(height:10),
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(height:20),
        Container(
          width : size.width * 0.9,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color:Colors.grey[800]! , width: 0.25),
            color: greyClr,
          ),
          child:Padding(
            padding: const EdgeInsets.only(right:10.0,left:10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(height:10),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.chevron_left,color: greenClr,), onPressed: () {  },
                    ),
                    Spacer(flex:1),
                    Text("תכירו אותנו יותר" , style: GoogleFonts.assistant(
                      color: greenClr,
                      fontSize: 17,
                    )),
                  ],
                ),
                SizedBox(height:10),
                Row(
                  //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap:(){
                            Navigator.push(context,CustomPageRoute(child:LocationWaze()));
                          },
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset("assets/location.png",width: 50,height: 50,),
                                SizedBox(height:10),
                                Center(child: Text("הגעה\nויצירת קשר" , style: assistantStyle(Colors.grey[600]!, 14),textDirection: TextDirection.rtl,textAlign: TextAlign.center,)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Expanded(
                    //   child: Container(
                    //     child: Column(
                    //       mainAxisAlignment: MainAxisAlignment.center,
                    //       children: [
                    //         Image.asset("assets/virtual.png",width: 50,height: 50,),
                    //         SizedBox(height:10),
                    //         Center(child: Text("סיור\nוירטואלי" , style: assistantStyle(Colors.grey[600]!, 14),textDirection: TextDirection.rtl,textAlign: TextAlign.center,)),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    Expanded(
                      child: Material(
                        color:Colors.transparent,
                        child: InkWell(
                          onTap:(){
                            Navigator.push(context,CustomPageRoute(child:AboutPage()));
                          },
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset("assets/about.png",width: 50,height: 50,),
                                SizedBox(height:10),
                                Center(child: Text("מי \nאנחנו?" , style: assistantStyle(Colors.grey[600]!, 14),textDirection: TextDirection.rtl,textAlign: TextAlign.center,)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height:25),
              ],
            ),
          ),
        ),
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            // Material(
            //   color: backGroundClr,
            //   borderRadius: BorderRadius.circular(10),
            //   elevation: 3,
            //   child: InkWell(
            //     splashColor: greyClr,
            //     onTap:(){
            //       ShowError(context, "נא לגשת למאמן כדי לעדכן מדידות");
            //
            //     },
            //     child: Container(
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(10),
            //         border: Border.all(color:Colors.grey[800]! , width: 0.25),
            //         color: greyClr,
            //       ),
            //       width: size.width * 0.42,
            //       height:  size.height * 0.28,
            //       child: Column(
            //         children: [
            //           SizedBox(height: 10,),
            //           Row(
            //             children: [
            //               SizedBox(width: 10,),
            //               Image.asset("assets/chart-bars.png" ,width :20 , height: 20,),
            //               Spacer(flex: 1,),
            //               Text("יעדים" , style: GoogleFonts.assistant(
            //                 color: greenClr,
            //                 fontSize: 14,
            //               )),
            //               SizedBox(width: 10,),
            //             ],
            //           ),
            //
            //           SizedBox(height: 25,),
            //           Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //             children: [
            //               Column(
            //                 children: [
            //                   Text("משקל",style: assistantStyle(Colors.white, 15),),
            //                   Text(gymHeroUser.goalMeasures[0].weight,style: assistantStyle(Colors.grey[600]!, 25),),
            //                 ],
            //               ),
            //               Column(
            //                 children: [
            //                   Text("היקף ידיים",style: assistantStyle(Colors.white, 15),),
            //                   Text(gymHeroUser.goalMeasures[0].arm,style: assistantStyle(Colors.grey[600]!, 25),),
            //                 ],
            //               ),
            //             ],
            //           ),
            //           SizedBox(height: 25,),
            //           Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //             children: [
            //               Column(
            //                 children: [
            //                   Text("אחוז שומן",style: assistantStyle(Colors.white, 15),),
            //                   Text(gymHeroUser.goalMeasures[0].bodyfat,style: assistantStyle(Colors.grey[600]!, 25),),
            //                 ],
            //               ),
            //               Column(
            //                 children: [
            //                   Text("היקף בטן",style: assistantStyle(Colors.white, 15),),
            //                   Text(gymHeroUser.goalMeasures[0].stomach,style: assistantStyle(Colors.grey[600]!, 25),),
            //                 ],
            //               ),
            //             ],
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            // Material(
            //   color: backGroundClr,
            //   borderRadius: BorderRadius.circular(10),
            //   elevation: 3,
            //   child: InkWell(
            //     splashColor: greyClr,
            //
            //     onTap:(){
            //       ShowError(context, "נא לגשת למאמן כדי לעדכן מדידות");
            //
            //     },
            //
            //     child: Container(
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(10),
            //         border: Border.all(color:Colors.grey[800]! , width: 0.25),
            //         color: greyClr,
            //       ),
            //       width: size.width * 0.42,
            //       height:  size.height * 0.28,
            //       child: Column(
            //         children: [
            //           SizedBox(height: 10,),
            //           Row(
            //             children: [
            //               SizedBox(width: 10,),
            //               Image.asset("assets/weight-scale.png" ,width :20 , height: 20,),
            //               Spacer(flex: 1,),
            //               Text("מדידות" , style: GoogleFonts.assistant(
            //                 color: greenClr,
            //                 fontSize: 14,
            //               )),
            //               SizedBox(width: 10,),
            //             ],
            //           ),
            //           SizedBox(height: 25,),
            //           Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //             children: [
            //               Column(
            //                 children: [
            //                   Text("משקל",style: assistantStyle(Colors.white, 15),),
            //                   Text(gymHeroUser.Measures[0].weight,style: assistantStyle(Colors.grey[600]!, 25),),
            //                 ],
            //               ),
            //               Column(
            //                 children: [
            //                   Text("היקף ידיים",style: assistantStyle(Colors.white, 15),),
            //                   Text(gymHeroUser.Measures[0].arm,style: assistantStyle(Colors.grey[600]!, 25),),
            //                 ],
            //               ),
            //             ],
            //           ),
            //           SizedBox(height: 25,),
            //           Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //             children: [
            //               Column(
            //                 children: [
            //                   Text("אחוז שומן",style: assistantStyle(Colors.white, 15),),
            //                   Text(gymHeroUser.Measures[0].bodyfat,style: assistantStyle(Colors.grey[600]!, 25),),
            //                 ],
            //               ),
            //               Column(
            //                 children: [
            //                   Text("היקף בטן",style: assistantStyle(Colors.white, 15),),
            //                   Text(gymHeroUser.Measures[0].stomach,style: assistantStyle(Colors.grey[600]!, 25),),
            //                 ],
            //               ),
            //             ],
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),

          ],
        ),
      //  SizedBox(height: size.height * 0.02,),
      //   Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     children: [
      //       Material(
      //         color: backGroundClr,
      //         borderRadius: BorderRadius.circular(10),
      //         elevation: 3,
      //         child: InkWell(
      //           splashColor: greyClr,
      //           onTap:(){
      //             ShowError(context,"נא לגשת למאמן כדי לעדכן את פרטי המנוי");
      //           },
      //
      //           child: Container(
      //             decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(10),
      //               border: Border.all(color:Colors.grey[800]! , width: 0.25),
      //               color: greyClr,
      //             ),
      //             width: size.width * 0.42,
      //             height:  size.height * 0.28,
      //             child: Column(
      //               children: [
      //                 SizedBox(height: 10,),
      //                 Center(
      //                   child: Text("מנוי אישי" , style: assistantStyle(greenClr, 16),),
      //                 ),
      //                 SizedBox(height: 10,),
      //                 Image.asset("assets/ticket.png",width: 70,height: 70,),
      //                 SizedBox(height: 20,),
      //                 GymHeroUser.userMemberShip.startDay == "-" ? Center(
      //                   child: Container(
      //                       width:size.width * 0.30,
      //                       child: Text("נא לגשת למתאמן כדי לעדכן פרטי מנויי",style: TextStyle(color: Colors.grey,fontSize: 13),textAlign: TextAlign.center,)),
      //                 ) : Column(
      //                   children: [
      //                     Center(
      //                       child: Text("החל מ",style:  assistantStyle(Colors.white, 14),),
      //                     ),
      //                     Center(child:
      //                     Text(GymHeroUser.userMemberShip.startDay == "-" ? "_": GymHeroUser.userMemberShip.startDay +" / " + GymHeroUser.userMemberShip.startMonth + " / " + GymHeroUser.userMemberShip.startYaer,style: assistantStyle(Colors.grey[600]!, 14),),
      //                     ),
      //                     Center(
      //                       child: Text("עד",style:  assistantStyle(Colors.white, 14),),
      //                     ),
      //
      //                     Center(child:
      //                     Text(GymHeroUser.userMemberShip.startDay == "-" ? "_":  GymHeroUser.userMemberShip.endDay +" / " + GymHeroUser.userMemberShip.endMonth + " / " + GymHeroUser.userMemberShip.endYaer,style: assistantStyle(Colors.grey[600]!, 14),),
      //                     ),
      //                   ],
      //                 ),
      //
      //               ],
      //             ),
      //           ),
      //         ),
      //       ),
      //       Material(
      //         color: backGroundClr,
      //         borderRadius: BorderRadius.circular(10),
      //         elevation: 3,
      //         child: InkWell(
      //           splashColor: greyClr,
      //           onTap: (){
      //             Navigator.push(context, CustomPageRoute(child: Plans()));
      //           },
      //
      //           child: Container(
      //             decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(10),
      //               border: Border.all(color:Colors.grey[800]! , width: 0.25),
      //               color: greyClr,
      //             ),
      //             width: size.width * 0.42,
      //             height:  size.height * 0.28,
      //             child: Column(
      //               children: [
      //                 SizedBox(height: 10,),
      //                 Row(
      //                   children: [
      //                     SizedBox(width: 10,),
      //                     Image.asset("assets/list_2_.png" ,width :20 , height: 20,),
      //                     Spacer(flex: 1,),
      //                     Text("תוכניות אימון" , style: GoogleFonts.assistant(
      //                       color: greenClr,
      //                       fontSize: 14,
      //                     )),
      //                     SizedBox(width: 10,),
      //                   ],
      //                 ),
      //                 SizedBox(height: 15,),
      //                 Column(
      //                   mainAxisAlignment: MainAxisAlignment.center,
      //                   children: [
      //                     SizedBox(height: 20,),
      //                     Container(
      //                         margin:EdgeInsets.only(left: 10),child: Image.asset("assets/plans.png",width: 70,height: 70,)),
      //                     SizedBox(height: 10,),
      //                     Row(
      //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                       children: [
      //                         Container(
      //                           margin: EdgeInsets.only(top:15),
      //                           child: IconButton(
      //                             icon: Icon(Icons.arrow_left,color: Colors.grey[600]!,),
      //                             onPressed: (){
      //                               setState(() {
      //                                 if(plansCurrent == 0 ){
      //                                   plansCurrent =  gymHeroUser.programs.length -1;
      //                                 }else{
      //                                   plansCurrent--;
      //                                 }
      //                               });
      //                             },
      //                           ),
      //                         ),
      //                         Column(
      //                           children: [
      //                             SizedBox(height: 15,),
      //                             Text((gymHeroUser.programs[plansCurrent].name.length > 5 ? ".." + gymHeroUser.programs[plansCurrent].name.substring(0,3): gymHeroUser.programs[plansCurrent].name),style: assistantStyle(Colors.white, 18),),
      //                             Text(gymHeroUser.programs[plansCurrent].days.length.toString() + "  אימונים",style: assistantStyle(Colors.grey[600]!, 14),textDirection: TextDirection.rtl,),
      //                           ],
      //                         ),
      //                         Container(
      //                           margin: EdgeInsets.only(top:15),
      //                           child: IconButton(
      //                             icon: Icon(Icons.arrow_right,color: Colors.grey[600]!,),
      //                             onPressed: (){
      //                               setState(() {
      //                                 if(plansCurrent == gymHeroUser.programs.length -1 ){
      //                                   plansCurrent =  0;
      //                                 }else{
      //                                   plansCurrent++;
      //                                 }
      //                               });
      //                             },
      //                           ),
      //                         ),
      //                       ],
      //                     ),
      //
      //                   ],
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
       // SizedBox(height: size.height * 0.02,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: size.width * 0.42,
              height:  size.height * 0.28,
            ),
            Material(
              color: backGroundClr,
              borderRadius: BorderRadius.circular(10),
              elevation: 3,
              child: InkWell(
                splashColor: greyClr,
                onTap:(){
                  Navigator.push(context, CustomPageRoute(child: Hours()));
                },

                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color:Colors.grey[800]! , width: 0.25),
                    color: greyClr,
                  ),
                  width: size.width * 0.42,
                  height:  size.height * 0.28,
                  child: Column(
                    children: [
                      SizedBox(height: 10,),
                      Center(
                        child: Text("שעות פתיחה" , style: assistantStyle(greenClr, 16),),
                      ),
                      SizedBox(height: 30,),
                      Image.asset("assets/watch.png",width: 70,height: 70,),
                      SizedBox(height: 20,),
                      Center(child: Text("ראשון , שלישי , חמישי" , style: assistantStyle(Colors.white, 14),textDirection: TextDirection.rtl,)),
                      gymHeroUser.gender ? Column(
                        children: [
                          Text("06:00 - 11:00" , style: assistantStyle(Colors.grey[600]!, 12),),
                          Text("18:30 - 23:30" , style: assistantStyle(Colors.grey[600]!, 12),),
                        ],
                      )  :
                      Text("11:00 - 18:30" , style: assistantStyle(Colors.grey[600]!, 12),),
                    ],
                  ),
                ),
              ),
            ),

          ],
        ),

        SizedBox(height: size.height * 0.02,),
        SizedBox(height: 50,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // SizedBox(width: 30,),
            Image.asset("assets/welcomePage1.png",height: 140,width: 140,),
            //Spacer(flex: 1,)
          ],
        ),
        SizedBox(height: 40,),
        ]
    ),

    ],
    ),
    )
    ),
    );
    }
}

double getPercent(DateTime from, DateTime to){
  if (daysBetween(from,DateTime.now()) < 0){
    return 0.0;
  }
  else if ((daysBetween(DateTime.now(),to) < 0)){
    return 1.0;
  }
  else{
    return double.parse((daysBetween(DateTime.now(),to) /  daysBetween(from,to)).toStringAsFixed(0));
  }
}
int daysBetween(DateTime from, DateTime to) {
  from = DateTime(from.year, from.month, from.day);
  to = DateTime(to.year, to.month, to.day);
  print("from: " + from.toString());
  print("to: " + to.toString());
  print("sssssssss " + (to.difference(from).inHours / 24).round().toString());
  return (to.difference(from).inHours / 24).round();
}

int getSum(){
  int sum = 0;
  DataBaseService.systemExcerises.forEach((key, value) {sum += value.length;});
  return sum;
}

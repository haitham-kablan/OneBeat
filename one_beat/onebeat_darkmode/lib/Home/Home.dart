

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onebeat_darkmode/DataBase/Services/DataBaseService.dart';
import 'package:onebeat_darkmode/DataBase/User/GymHeroUser.dart';
import 'package:onebeat_darkmode/Design/Animation/PageTransition.dart';
import 'package:onebeat_darkmode/Design/Button/HomeButton.dart';
import 'package:onebeat_darkmode/Design/ColorsPallete/Pallete.dart';
import 'package:onebeat_darkmode/Design/TextStyle/TextStyle.dart';
import 'package:onebeat_darkmode/Home/HomePages/AllExcerises.dart';
import 'package:onebeat_darkmode/Home/HomePages/Mesure.dart';
import 'package:onebeat_darkmode/Home/HomePages/Support.dart';
import 'package:intl/intl.dart' as x;
import 'package:onebeat_darkmode/Home/adminHomePages/allUsers.dart';
import 'package:onebeat_darkmode/utils/GeneralExcerises.dart';
import 'package:onebeat_darkmode/utils/MainDrawer.dart';
import 'package:onebeat_darkmode/utils/exitDialouge.dart';


import 'HomePages/Hours.dart';
import 'HomePages/Plans.dart';
import 'HomePages/goals.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<String> muscles = ["חזה","גב","יד קדמית","יד אחורית","כתפיים","בטן","רגליים"];
  int current = 0;
  int plansCurrent = 0;
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
        endDrawer: mainDr(size,context,refresh),
        appBar: AppBar(

          backgroundColor: backGroundClr,
          elevation: 3,
          centerTitle: true,
          title: Container(
           // margin: EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Text("GYM HERO" , style: assistantStyle(greenClr, 25),),
                Text(" - " , style: assistantStyle(greenClr, 25),),
                Container(
                  margin: EdgeInsets.only(top: 6),
                    child: Text("Fitness Club" , style: assistantStyle(Colors.grey[600]!, 15),)),
                //Text("Fitness Application" , style: assistantStyle(Colors.grey[600]!, 10),),
              ],
            ),
          ),
        ),
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
                          onTap: () async{
                            await DataBaseService.getSystemUsers();

                          //  await DataBaseService.getSystemMeasures();
                           // await DataBaseService.getSystemGoalMeasures();
                            Navigator.push(context, CustomPageRoute(child: AllUsers()));
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
                      Material(
                        color: backGroundClr,
                        borderRadius: BorderRadius.circular(10),
                        elevation: 3,
                        child: InkWell(
                          splashColor: greyClr,
                          onTap: (){
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
                                SizedBox(height: 10,),
                                Row(
                                  children: [
                                    SizedBox(width: 10,),
                                    Icon(Icons.apps_sharp,color: Colors.grey[600]!,),
                                    Spacer(flex: 1,),
                                    Text("לו\"ז  שעות" , style: GoogleFonts.assistant(
                                      color:greenClr,
                                      fontSize: 14,
                                    ),textDirection: TextDirection.rtl,),
                                    SizedBox(width: 10,),
                                  ],
                                ),
                                SizedBox(height: 40,),
                                Image.asset("assets/work_calendar.png" ,width :80 , height: 80,),

                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  ]: [

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
                    Expanded(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/virtual.png",width: 50,height: 50,),
                            SizedBox(height:10),
                            Center(child: Text("סיור\nוירטואלי" , style: assistantStyle(Colors.grey[600]!, 14),textDirection: TextDirection.rtl,textAlign: TextAlign.center,)),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
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

                        Material(
                          color: backGroundClr,
                          borderRadius: BorderRadius.circular(10),
                          elevation: 3,
                          child: InkWell(
                            splashColor: greyClr,
                            onTap: (){
                             // Navigator.push(context, CustomPageRoute(child: goals(refresh: refresh,)));
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
                                      Image.asset("assets/chart-bars.png" ,width :20 , height: 20,),
                                      Spacer(flex: 1,),
                                      Text("יעדים" , style: GoogleFonts.assistant(
                                        color: greenClr,
                                        fontSize: 14,
                                      )),
                                      SizedBox(width: 10,),
                                    ],
                                  ),

                                  SizedBox(height: 25,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        children: [
                                          Text("משקל",style: assistantStyle(Colors.white, 15),),
                                          Text(gymHeroUser.goalMeasures[0].weight,style: assistantStyle(Colors.grey[600]!, 25),),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text("היקף ידיים",style: assistantStyle(Colors.white, 15),),
                                          Text(gymHeroUser.goalMeasures[0].arm,style: assistantStyle(Colors.grey[600]!, 25),),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 25,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        children: [
                                          Text("אחוז שומן",style: assistantStyle(Colors.white, 15),),
                                          Text(gymHeroUser.goalMeasures[0].bodyfat,style: assistantStyle(Colors.grey[600]!, 25),),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text("היקף בטן",style: assistantStyle(Colors.white, 15),),
                                          Text(gymHeroUser.goalMeasures[0].stomach,style: assistantStyle(Colors.grey[600]!, 25),),
                                        ],
                                      ),
                                    ],
                                  ),
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
            onTap:(){
            //  Navigator.push(context, CustomPageRoute(child: Measure(refresh: refresh,)));
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
                      Image.asset("assets/weight-scale.png" ,width :20 , height: 20,),
                      Spacer(flex: 1,),
                      Text("מדידות" , style: GoogleFonts.assistant(
                        color: greenClr,
                        fontSize: 14,
                      )),
                      SizedBox(width: 10,),
                    ],
                  ),
                  SizedBox(height: 25,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text("משקל",style: assistantStyle(Colors.white, 15),),
                          Text(gymHeroUser.Measures[0].weight,style: assistantStyle(Colors.grey[600]!, 25),),
                        ],
                      ),
                      Column(
                        children: [
                          Text("היקף ידיים",style: assistantStyle(Colors.white, 15),),
                          Text(gymHeroUser.Measures[0].arm,style: assistantStyle(Colors.grey[600]!, 25),),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 25,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text("אחוז שומן",style: assistantStyle(Colors.white, 15),),
                          Text(gymHeroUser.Measures[0].bodyfat,style: assistantStyle(Colors.grey[600]!, 25),),
                        ],
                      ),
                      Column(
                        children: [
                          Text("היקף בטן",style: assistantStyle(Colors.white, 15),),
                          Text(gymHeroUser.Measures[0].stomach,style: assistantStyle(Colors.grey[600]!, 25),),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),

                      ],
                    ),
                    SizedBox(height: size.height * 0.02,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Material(
                          color: backGroundClr,
                          borderRadius: BorderRadius.circular(10),
                          elevation: 3,
                          child: InkWell(
                            splashColor: greyClr,
                            onTap: (){
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
                                  SizedBox(height: 10,),
                                  Row(
                                    children: [
                                      SizedBox(width: 10,),
                                      Image.asset("assets/stretching.png" ,width :20 , height: 20,),
                                      Spacer(flex: 1,),
                                      Text("תרגילים" , style: GoogleFonts.assistant(
                                        color:greenClr,
                                        fontSize: 14,
                                      )),
                                      SizedBox(width: 10,),
                                    ],
                                  ),
                                  SizedBox(height: 15,),
                                  Row(
                                    children:[
                                      Spacer(flex: 1,),
                                      IconButton(
                                        icon: Icon(Icons.arrow_left,color: Colors.grey[600]!,),
                                        onPressed: (){
                                          setState(() {
                                            if(current == 0){
                                              current = 6;
                                            }else{
                                              current--;
                                            }
                                          });
                                        },
                                      ),

                                      Image.asset(
                                        GeneralExcerise(stringCategoryToCategory(muscles[current]),"")
                                            .getCategoryPic(),width: 60,height: 100,),
                                      IconButton(
                                        icon: Icon(Icons.arrow_right,color: Colors.grey[600]!,),
                                        onPressed: (){
                                          setState(() {
                                            if(current == 6){
                                              current = 0;
                                            }else{
                                              current++;
                                            }
                                          });
                                        },
                                      ),
                                      Spacer(flex: 1,),
                                    ],
                                  ),
                                  Text(muscles[current],style: assistantStyle(Colors.white, 20),),
                                  Text(  DataBaseService.systemExcerises[stringCategoryToCategory(muscles[current])]!.length.toString() + "  תרגילים",style: assistantStyle(Colors.grey[600]!, 15),textDirection: TextDirection.rtl,),
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
                            onTap: (){
                              Navigator.push(context, CustomPageRoute(child: Plans()));
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
                                      Image.asset("assets/list_2_.png" ,width :20 , height: 20,),
                                      Spacer(flex: 1,),
                                      Text("תוכניות אימון" , style: GoogleFonts.assistant(
                                        color: greenClr,
                                        fontSize: 14,
                                      )),
                                      SizedBox(width: 10,),
                                    ],
                                  ),
                                  SizedBox(height: 15,),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(height: 20,),
                                      Container(
                                          margin:EdgeInsets.only(left: 10),child: Image.asset("assets/plans.png",width: 70,height: 70,)),
                                      SizedBox(height: 10,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(top:15),
                                            child: IconButton(
                                              icon: Icon(Icons.arrow_left,color: Colors.grey[600]!,),
                                              onPressed: (){
                                                setState(() {
                                                  if(plansCurrent == 0 ){
                                                    plansCurrent =  gymHeroUser.programs.length -1;
                                                  }else{
                                                    plansCurrent--;
                                                  }
                                                });
                                              },
                                            ),
                                          ),
                                          Column(
                                            children: [
                                              SizedBox(height: 15,),
                                              Text((gymHeroUser.programs[plansCurrent].name.length > 7 ? gymHeroUser.programs[plansCurrent].name.substring(0,6) + "...": gymHeroUser.programs[plansCurrent].name),style: assistantStyle(Colors.white, 18),),
                                              Text(gymHeroUser.programs[plansCurrent].days.length.toString() + "  אימונים",style: assistantStyle(Colors.grey[600]!, 14),textDirection: TextDirection.rtl,),
                                            ],
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(top:15),
                                            child: IconButton(
                                              icon: Icon(Icons.arrow_right,color: Colors.grey[600]!,),
                                              onPressed: (){
                                                setState(() {
                                                  if(plansCurrent == gymHeroUser.programs.length -1 ){
                                                    plansCurrent =  0;
                                                  }else{
                                                    plansCurrent++;
                                                  }
                                                });
                                              },
                                            ),
                                          ),
                                        ],
                                      ),

                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),




                      ],
                    ),
                    SizedBox(height: size.height * 0.02,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
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
                                    child: Text("סיור ורטואלי" , style: assistantStyle(greenClr, 16),),
                                  ),
                                  SizedBox(height: 30,),
                                  Image.asset("assets/virtual.png",width: 70,height: 70,),
                                  SizedBox(height: 20,),
                                  Center(child: Text("לחץ לצפייה" , style: assistantStyle(Colors.white, 14),textDirection: TextDirection.rtl,)),

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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [



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
                        child: Text("הגעה ויצירת קשר" , style: assistantStyle(greenClr, 16),),
                      ),
                      SizedBox(height: 30,),
                      Image.asset("assets/location.png",width: 70,height: 70,),
                      SizedBox(height: 20,),
                      Center(child: Text("Waze and phone" , style: assistantStyle(Colors.white, 14),textDirection: TextDirection.rtl,)),

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
                        child: Text("מי אנחנו?" , style: assistantStyle(greenClr, 16),textDirection: TextDirection.rtl,),
                      ),
                      SizedBox(height: 30,),
                      Image.asset("assets/about.png",width: 70,height: 70,),
                      SizedBox(height: 25,),
                      Center(child: Text("נעים להכיר" , style: assistantStyle(Colors.white, 14),textDirection: TextDirection.rtl,)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
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


String getDay(int index){

  switch(index){
    case 1: return "ראשון";
    case 2: return "שני";
    case 3: return "שלישי";
    case 4: return "רביעי";
    case 5: return "חמישי";
    case 6: return "שישי";
    case 7: return "שבת";
  }

  return "ראשון";
  
}

String getDayFromEngDay(){

  String engDay = x.DateFormat('EEEE').format(DateTime.now());
  print(engDay);

  switch (engDay){
  case "Sunday": return "ראשון";
  case "Monday": return "שני";
  case "Tuesday": return "שלישי";
  case "Wednesday": return "רביעי";
  case "Thursday": return "חמישי";
  case "Friday": return "שישי";
  case "Saturday": return "שבת";
  }
  return "ראשון";
}

String getDate(DateTime dateTime){

  List<String> x = dateTime.toString().split("-");
  return x[0] + " / " + x[1] +" / " + x[2].split(" ")[0];

}

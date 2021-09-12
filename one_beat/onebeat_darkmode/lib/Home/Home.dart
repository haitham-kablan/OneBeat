

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onebeat_darkmode/DataBase/User/GymHeroUser.dart';
import 'package:onebeat_darkmode/Design/Animation/PageTransition.dart';
import 'package:onebeat_darkmode/Design/Button/HomeButton.dart';
import 'package:onebeat_darkmode/Design/ColorsPallete/Pallete.dart';
import 'package:onebeat_darkmode/Design/TextStyle/TextStyle.dart';
import 'package:onebeat_darkmode/Home/HomePages/AllExcerises.dart';
import 'package:onebeat_darkmode/Home/HomePages/Mesure.dart';
import 'package:onebeat_darkmode/Home/HomePages/Support.dart';

import 'HomePages/Hours.dart';
import 'HomePages/Plans.dart';
import 'HomePages/goals.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: backGroundClr,
        body: Column(
              children: [
                Container(
                  width: size.width,
                  color: greenClr,
                  child: Column(
                        children: [
                          SizedBox(height: size.height * 0.03,),
                          // Padding(
                          //   padding: const EdgeInsets.only(left: 30),
                          //   child: Align(
                          //       alignment: Alignment.bottomLeft,
                          //       child: Text(DateTime("EEEE").day.toString(),style: whiteText(15),)),
                          // ),
                          Padding(
                            padding: const EdgeInsets.only(right: 30),
                            child: Align(
                                alignment: Alignment.bottomRight,
                                child: Text(gymHeroUser.name + " "+"שלום",style: GoogleFonts.assistant(fontSize: 40 , color: Colors.white,fontWeight: FontWeight.bold),)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 30),
                            child: Align(
                                alignment: Alignment.bottomRight,
                                child: Text(gymHeroUser.age.toString()+" " + "סטטוס: מתאמן בן",style: GoogleFonts.assistant(fontSize: 17 , color: Colors.white),)),
                          ),
                          SizedBox(height: size.height * 0.03,),
                        ],
                      ),
                ),
                Container(
                  child:  Column(
                    children: [
                      SizedBox(height: size.height * 0.02,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          HomeButton(size, "assets/weight-scale.png", "מדידות" , onClick: (){
                            Navigator.push(
                              context,
                              CustomPageRoute( child: Measure(),),
                            );
                          }),
                          HomeButton(size, "assets/list_2_.png", "תוכניות אימון" , onClick: (){
                            Navigator.push(
                              context,
                              CustomPageRoute( child: Plans(),),
                            );
                          }),
                          HomeButton(size, "assets/chart-bars.png", "יעדים" , onClick: (){
                            Navigator.push(
                              context,
                              CustomPageRoute( child: goals(),),
                            );
                          }),
                        ],
                      ),
                      SizedBox(height: size.height * 0.02,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          HomeButton(size, "assets/stretching.png", "תרגילים" , onClick: (){
                            Navigator.push(
                              context,
                              CustomPageRoute( child: AllExcerises(),),
                            );
                          }),
                          HomeButton(size, "assets/profile.png", "אזור אישי"),
                          HomeButton(size, "assets/clock.png", "שעות פתיחה" , onClick: (){
                            Navigator.push(
                              context,
                              CustomPageRoute( child: Hours(),),
                            );
                          }),

                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          HomeButton(size, "assets/support.png", "תמיכה" , onClick: (){
                            Navigator.push(
                              context,
                              CustomPageRoute( child: Support(),),
                            );
                          }),
                          Container(
                            color: Colors.transparent,
                            width: size.width * 0.27,
                            height:  size.height * 0.18,
                          ),
                          Container(
                            color: Colors.transparent,
                            width: size.width * 0.27,
                            height:  size.height * 0.18,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Spacer(flex: 1,),
                Row(
                  children: [
                    Spacer(flex: 1,),
                    Image.asset("assets/welcomePage1.png",width: 100,height: 100,),
                    SizedBox(width: 30,)
                  ],
                ),
                SizedBox(height: 30,),
           ],
        ),
      ),
    );
  }
}

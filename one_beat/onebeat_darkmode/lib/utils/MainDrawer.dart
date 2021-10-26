

import 'package:flutter/material.dart';
import 'package:onebeat_darkmode/DataBase/User/GymHeroUser.dart';
import 'package:onebeat_darkmode/Design/Animation/PageTransition.dart';
import 'package:onebeat_darkmode/Design/ColorsPallete/Pallete.dart';
import 'package:onebeat_darkmode/Design/TextStyle/TextStyle.dart';
import 'package:onebeat_darkmode/Home/HomePages/GeneralPlans.dart';
import 'package:onebeat_darkmode/Home/HomePages/Hours.dart';
import 'package:onebeat_darkmode/Home/HomePages/Mesure.dart';
import 'package:onebeat_darkmode/Home/HomePages/Plans.dart';
import 'package:onebeat_darkmode/Home/HomePages/goals.dart';

import 'exitDialouge.dart';

Drawer mainDr(Size size,context,action){
  return Drawer(
    child: Container(
      height: size.height,
      width: size.width * 0.8,
      decoration: BoxDecoration(
        border: Border(
            left: BorderSide(color: Colors.grey[600]! , width: 0.15)
        ),
        color: greyClr,
      ),
      child: Column(
        children: [
          SizedBox(height: 50,),
          Container(
              margin: EdgeInsets.only(left: 20),child: Image.asset("assets/welcomePage1.png",width: 100,height: 100,)),
          SizedBox(height: 20,),
          Center(
            child: Text(gymHeroUser.email,style: assistantStyle(Colors.grey[600]!, 20),),
          ),
          Center(
            child: Text(gymHeroUser.name,style: assistantStyle(Colors.white, 20),),
          ),
          SizedBox(height: 70,),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap:(){
                Navigator.pop(context);
              },
              child: Row(
                children: [
                  Spacer(flex: 1,),
                  Container(
                    margin: EdgeInsets.only(bottom: 3),
                      child: Text("דף ראשי" , style: assistantStyle(Colors.grey[600]!, 20),)),
                  SizedBox(width: 15,),
                  Icon(
                    Icons.home,
                    color: Colors.grey[600]!,
                    size: 20,
                  ),
                  SizedBox(width: 25,),
                ],
              ),
            ),
          ),
          // SizedBox(height: 30,),
          // Material(
          //   color: Colors.transparent,
          //   child: InkWell(
          //     onTap:(){
          //       Navigator.pop(context);
          //       Navigator.push(context, CustomPageRoute(child: Measure(refresh: action,)));
          //
          //     },
          //     child: Row(
          //       children: [
          //         Spacer(flex: 1,),
          //         Container(
          //             margin: EdgeInsets.only(bottom: 3),
          //             child: Text("מדידות" , style: assistantStyle(Colors.grey[600]!, 20),)),
          //         SizedBox(width: 15,),
          //         Icon(
          //           Icons.accessibility,
          //           color: Colors.grey[600]!,
          //           size: 20,
          //         ),
          //         SizedBox(width: 25,),
          //       ],
          //     ),
          //   ),
          // ),
          // SizedBox(height: 30,),
          // Material(
          //   color: Colors.transparent,
          //   child: InkWell(
          //     onTap:(){
          //       Navigator.pop(context);
          //       Navigator.push(context, CustomPageRoute(child: goals(refresh: action,)));
          //
          //     },
          //     child: Row(
          //       children: [
          //         Spacer(flex: 1,),
          //         Container(
          //             margin: EdgeInsets.only(bottom: 3),
          //             child: Text("יעדים" , style: assistantStyle(Colors.grey[600]!, 20),)),
          //         SizedBox(width: 15,),
          //         Image.asset("assets/chart-bars.png" ,width :20 , height: 20,),
          //         SizedBox(width: 25,),
          //       ],
          //     ),
          //   ),
          // ),
          SizedBox(height: 30,),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap:(){
                Navigator.pop(context);
                Navigator.push(context, CustomPageRoute(child: GeneralPlans()));

              },
              child: Row(
                children: [
                  Spacer(flex: 1,),
                  Container(
                      margin: EdgeInsets.only(bottom: 3),
                      child: Text("תוכניות אימון למתחילים" , style: assistantStyle(Colors.grey[600]!, 20),)),
                  SizedBox(width: 15,),
                  Icon(
                    Icons.dashboard,
                    color: Colors.grey[600]!,
                    size: 20,
                  ),
                  SizedBox(width: 25,),
                ],
              ),
            ),
          ),
          SizedBox(height: 30,),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap:(){
                Navigator.pop(context);
                Navigator.push(context, CustomPageRoute(child: Plans()));

              },
              child: Row(
                children: [
                  Spacer(flex: 1,),
                  Container(
                      margin: EdgeInsets.only(bottom: 3),
                      child: Text("תוכניות אימון אישיות" , style: assistantStyle(Colors.grey[600]!, 20),)),
                  SizedBox(width: 15,),
                  Icon(
                    Icons.accessibility_new_sharp,
                    color: Colors.grey[600]!,
                    size: 20,
                  ),
                  SizedBox(width: 25,),
                ],
              ),
            ),
          ),
          SizedBox(height: 30,),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap:(){
                Navigator.pop(context);
                Navigator.push(context, CustomPageRoute(child: Hours()));

              },
              child: Row(
                children: [
                  Spacer(flex: 1,),
                  Container(
                      margin: EdgeInsets.only(bottom: 3),
                      child: Text("שעות פתיחה" , style: assistantStyle(Colors.grey[600]!, 20),)),
                  SizedBox(width: 15,),
                  Icon(
                    Icons.access_time,
                    color: Colors.grey[600]!,
                    size: 20,
                  ),
                  SizedBox(width: 25,),
                ],
              ),
            ),
          ),
          SizedBox(height: 30,),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap:(){
                ExitDialouge(context, size);
              },
              child: Row(
                children: [
                  Spacer(flex: 1,),
                  Container(
                      margin: EdgeInsets.only(bottom: 3),
                      child: Text("יציאה" , style: assistantStyle(Colors.grey[600]!, 20),)),
                  SizedBox(width: 15,),
                  Icon(
                    Icons.exit_to_app,
                    color: Colors.grey[600]!,
                    size: 20,
                  ),
                  SizedBox(width: 25,),
                ],
              ),
            ),
          ),

        ],
      ),

    ),
  );
}
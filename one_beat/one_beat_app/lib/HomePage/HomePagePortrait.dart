
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:one_beat_app/colors/colors_pallete.dart';
import 'package:one_beat_app/db_service/classes/Excercise.dart';
import 'package:one_beat_app/db_service/dataBaseService.dart';
import 'package:one_beat_app/main_drawer/drawer.dart';
import 'package:one_beat_app/main_screens/AllExcerises.dart';
import 'package:one_beat_app/main_screens/FAQ.dart';
import 'package:one_beat_app/main_screens/MyPlan.dart';
import 'package:one_beat_app/main_screens/Profile.dart';
import 'package:one_beat_app/main_screens/Users.dart';
import 'package:one_beat_app/main_screens/measurments.dart';


enum CURRENT_TAB{PROFILE,MY_PLAN,MEASURMENTS,FAQ}

class AdminHomePagePortrait extends StatefulWidget {
  @override
  _AdminHomePagePortrait createState() => _AdminHomePagePortrait();
}

class _AdminHomePagePortrait extends State<AdminHomePagePortrait> {

  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          endDrawer: Align(alignment: Alignment.topRight,child: MainDrawer(size: size)),
          appBar:  AppBar(
              elevation: 20,
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/app_bar_bg.png"),
                    fit: BoxFit.fill,
                  ),

                ),
              ),
              title:  Column(
                  children: [
                    Text('ONE BEAT' , style: TextStyle(fontSize: 30,fontFamily: 'Title',color: current_color.color.title_heading),),
                  ],
                ),
              centerTitle: true,
              bottom: TabBar(
                indicatorColor: Colors.white,
                indicatorWeight: 3,
                tabs: [
                  Tab(icon:Icon(Icons.info_outline,color: Colors.white,),text : "שאלות"),
                  Tab(icon:Icon(Icons.dashboard,color: Colors.white,),text : "תרגילים"),
                  Tab(icon:Icon(Icons.group,color: Colors.white,),text : "משתמשים"),
                ],

              ),
            ),
          body: TabBarView(
            children: [
              FAQ(),
              AllExcerises(),
              UsersScreen(),
            ],
          ),
        ),
      ),
    );
  }
}


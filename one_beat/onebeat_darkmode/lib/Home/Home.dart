



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
import 'package:onebeat_darkmode/Home/MeasureHome.dart';
import 'package:onebeat_darkmode/Home/adminHomePages/allUsers.dart';
import 'package:onebeat_darkmode/utils/GeneralExcerises.dart';
import 'package:onebeat_darkmode/utils/MainDrawer.dart';
import 'package:onebeat_darkmode/utils/ProgressBar.dart';
import 'package:onebeat_darkmode/utils/exitDialouge.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';


import 'GreetingHome.dart';
import 'HomePages/About.dart';
import 'HomePages/GeneralPlans.dart';
import 'HomePages/Hours.dart';
import 'HomePages/Location.dart';
import 'HomePages/Plans.dart';
import 'HomePages/goals.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int index = 0;
  List<Widget> homeBody = [
    GreetingHome(),
    MeasureHome(),

    Plans(),

  ];

  bool switched = false;
  void refresh(){
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: switched ? null : CurvedNavigationBar(
          height: 60,
          backgroundColor: Colors.transparent,
          color: greenClr,
          items: <Widget>[
            Icon(Icons.home_filled, size: 25,color:Colors.white),
            Icon(Icons.accessibility_new_sharp, size: 25,color:Colors.white),
            Icon(Icons.dashboard, size: 25,color:Colors.white),


          ],
          onTap: (newIndex) {
            setState(() {
              index = newIndex;
            });
            //Handle button tap
          },
        ),
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
        body: homeBody[index],

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


String getDate(DateTime dateTime , {flag = false}){

  List<String> x = dateTime.toString().split("-");
  if (flag){
    return x[2].split(" ")[0] +" / " + x[1] + " / " +x[0];
  }
  return (x[0] + " / " + x[1] +" / " + x[2].split(" ")[0]);


}
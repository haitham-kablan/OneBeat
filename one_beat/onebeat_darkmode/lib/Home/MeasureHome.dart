import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onebeat_darkmode/DataBase/User/GymHeroUser.dart';
import 'package:onebeat_darkmode/Design/Animation/PageTransition.dart';
import 'package:onebeat_darkmode/Design/ColorsPallete/Pallete.dart';
import 'package:onebeat_darkmode/Design/ShowError.dart';
import 'package:onebeat_darkmode/LoginPage/LoginPage.dart';

class MeasureHome extends StatelessWidget {
  const MeasureHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backGroundClr,
      body: gymHeroUser.email.isEmpty ? Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child:Icon(
              Icons.admin_panel_settings_outlined,
              color: Colors.grey[700]!,
              size: 100,
            )
          ),
          SizedBox(height: 20,),
          Center(
            child: Container(
              width: size.width * 0.8,
              child: Text("נא היכנס למערכת כדי לקבל את המדידות שלך" , textAlign: TextAlign.center,style: GoogleFonts.assistant(
                color: Colors.grey[600]!,
                fontSize: 18,
              )),
            ),
          ),
          SizedBox(height: 10,),
          InkWell(
            onTap: (){
              Navigator.pop(context);
              Navigator.push(context, CustomPageRoute(child: LogInPage()));
            },
            child: Text("לחץ לכניסה" , textAlign: TextAlign.center,style: GoogleFonts.assistant(
              color: greenClr,
              fontSize: 20,
            )),
          ),
        ],
      ) : SingleChildScrollView(
        child:Column(
          children: [
            SizedBox(height: 30,),
            Center(
              child: Container(
                width: size.width * 0.8,
                child: Center(
                  child: Text("אזור מדידות אישי" , textAlign: TextAlign.center,style: GoogleFonts.assistant(
                    color: Colors.white,
                    fontSize: 20,
                  )),
                ),
              ),
            ),
            SizedBox(height: 15,),
            Center(
              child: Text(  "*  במידה ויש לך מדידות ריקים נא לגשת למאמן למלא אותם" , textDirection: TextDirection.rtl,textAlign: TextAlign.center,style: GoogleFonts.assistant(
                color: Colors.grey[600]!,
                fontSize: 14,
              )),
            ),
            SizedBox(height: 30,),
            MeasureUnit(size: size, name: "משקל", curr: gymHeroUser.Measures[0].weight, dist: gymHeroUser.goalMeasures[0].weight),
            SizedBox(height: 30,),
            MeasureUnit(size: size, name: "אחוז שומן", curr: gymHeroUser.Measures[0].bodyfat, dist: gymHeroUser.goalMeasures[0].bodyfat),
            SizedBox(height: 30,),
            MeasureUnit(size: size, name: "היקף יד", curr: gymHeroUser.Measures[0].arm, dist: gymHeroUser.goalMeasures[0].arm),
            SizedBox(height: 30,),
            MeasureUnit(size: size, name: "היקף בטן", curr: gymHeroUser.Measures[0].stomach, dist: gymHeroUser.goalMeasures[0].stomach),
            SizedBox(height: 30,),
            MeasureUnit(size: size, name: "גובה", curr: gymHeroUser.Measures[0].height, dist: gymHeroUser.goalMeasures[0].height),
            SizedBox(height: 100,),


          ],
        ),
      ),
    );
  }
}

class MeasureUnit extends StatelessWidget {
  final Size size;
  final String name;
  final String curr;
  final String dist;
  const MeasureUnit({Key? key, required this.size, required this.name, required this.curr, required this.dist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color:Colors.transparent,
      child: InkWell(
        onTap:(){
          ShowError(context, "נא לגשת למאמן כדי לעדכן מדידות");
        },
        child: Container(
          width : size.width * 0.9,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color:Colors.grey[800]! , width: 0.25),
            color: greyClr,
          ),
          child:Padding(
            padding: const EdgeInsets.only(right:10.0,left:10,top: 20,bottom: 20),
            child: Column(
              children: [
                Text(name , textAlign: TextAlign.center,style: GoogleFonts.assistant(
                  color: greenClr,
                  fontSize: 25,
                )),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text("הפרש" , textAlign: TextAlign.center,style: GoogleFonts.assistant(
                          color: Colors.white,
                          fontSize: 20,
                        )),
                        SizedBox(height: 10,),
                        Text(curr != "-" && dist != '-' ? (double.parse(dist) - double.parse(curr)).abs().toStringAsFixed(1) : '-', textAlign: TextAlign.center,style: GoogleFonts.assistant(
                          color: greenClr,
                          fontSize: 20,
                        )),
                      ],
                    ),
                    Column(
                      children: [
                        Text("יעד" , textAlign: TextAlign.center,style: GoogleFonts.assistant(
                          color: Colors.white,
                          fontSize: 20,
                        )),
                        SizedBox(height: 10,),
                        Text(dist , textAlign: TextAlign.center,style: GoogleFonts.assistant(
                          color: Colors.grey[500]!,
                          fontSize: 20,
                        )),
                      ],
                    ),
                    Column(
                      children: [
                        Text("נוכחי" , textAlign: TextAlign.center,style: GoogleFonts.assistant(
                          color: Colors.white,
                          fontSize: 20,
                        )),
                        SizedBox(height: 10,),
                        Text(curr , textAlign: TextAlign.center,style: GoogleFonts.assistant(
                          color: Colors.grey[500]!,
                          fontSize: 20,
                        )),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:onebeat_darkmode/ColorsPallete/ColorsPallete.dart';
import 'package:onebeat_darkmode/Constants.dart';
import 'package:onebeat_darkmode/DataBase/Services/DataBaseService.dart';
import 'package:onebeat_darkmode/Design/Button.dart';
import 'package:onebeat_darkmode/Design/DayBox.dart';
import 'package:onebeat_darkmode/HomePage/screens/Excerise/BuildProgram.dart';
import 'package:onebeat_darkmode/HomePage/screens/Excerise/GeneralPlan.dart';
import 'package:onebeat_darkmode/HomePage/screens/FAQ/EmptyFaq.dart';
import 'package:onebeat_darkmode/Users/CurrentUser.dart';
import 'package:onebeat_darkmode/Users/TrainerUser.dart';


class EmptyExcerise extends StatefulWidget {
  @override
  _EmptyExceriseState createState() => _EmptyExceriseState();
}

class _EmptyExceriseState extends State<EmptyExcerise> {
  bool isLoading =false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return (currentUser as TrainerUser).firstExcerise ? Scaffold(
      backgroundColor: backGroundClr,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(child: Image.asset("assets/myworkout.png")),
            SizedBox(height:20,),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 40),
                child: RichText(
                  text: TextSpan(
                    children:  <TextSpan>[
                      TextSpan(text: 'המומלצות ', style: TextStyle(color: greenClr,fontSize: 16)),
                      TextSpan(text: " של המאמנים",style: TextStyle(color: offWhite,fontSize: 16),),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 40,right: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DayBox(day: "A",onpress: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GenralPlan(name: "A",excerises: A,)),);
                  },isPressed:false),
                  DayBox(day: "AB",onpress: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GenralPlan(name: "AB",excerises: ABA1)),);
                  },isPressed:false),
                  DayBox(day: "ABC",onpress: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GenralPlan(name: "ABC",excerises: ABCA)),);
                  },isPressed:false),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Align(
              alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Text( "תוכניות שלי",style: TextStyle(color: offWhite,fontSize: 16),textAlign: TextAlign.right,),
                )),
            SizedBox(height: 20,),
            Center(
              child: Container(
                width: size.width* 0.6,
                child: Text("עדיין אין לך תוכניות אישיות , גש למאמן לצור אחת , או צור אחת בעצמך." ,
                  textDirection: TextDirection.rtl,textAlign: TextAlign.center,
                  style: TextStyle(color: navBarItemsClr),
                ),
              ),

            ),

          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: greenClr,
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BuildProgram()),
            );
          },
          icon: Icon(Icons.add),
          label: Text(
            "הוספת תוכנית"
          )),

    ):
    Scaffold(
      backgroundColor: backGroundClr,
      body: Column(
        children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: [
          //     Image.asset('assets/topLeftLogo.png'),
          //   ],
          // ),
          SizedBox(height: 70,),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/plan.png'),
              ],
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(top: 20,bottom: 20,left: 40,right: 40),
            child: Text("עדיין אין לך תוכנית אימון ? \nצור אחת בעצמך או דבר עם המאמן!",
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white,fontStyle: FontStyle.italic,fontSize: 17),
            ),
          ),
          SizedBox(height: 20,),isLoading ?  CircularProgressIndicator(
            backgroundColor: navBarClr,
            color: greenClr,
          ):
          button(backGroundClr, "בניית תוכנית", Colors.white, BorderRadius.circular(20), size.width * 0.5, size.width * 0.085, ()async{
            setState(() {
              isLoading = true;
            });
            (currentUser as TrainerUser).firstExcerise = true;
            await DataBaseService.updateFeild(currentUser!.email, "firstExcerise", true);

            setState(() {
              isLoading = false;
            });
          }
          ),

        ],
      ),
    );
  }
}


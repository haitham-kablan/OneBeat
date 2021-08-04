
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:onebeat_darkmode/ColorsPallete/ColorsPallete.dart';
import 'package:onebeat_darkmode/DataBase/Services/DataBaseService.dart';
import 'package:onebeat_darkmode/Design/Button.dart';
import 'package:onebeat_darkmode/Design/DayBox.dart';
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
            SizedBox(height: 40,),
            Center(child: Image.asset("assets/myworkout.png")),
            SizedBox(height:20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DayBox(day: "1",onpress: (){},),DayBox(day: "2",onpress: (){},),DayBox(day: "3",onpress: (){},),
              ],
            ),
            SizedBox(height:20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DayBox(day: "4",onpress: (){},),DayBox(day: "5",onpress: (){},),DayBox(day: "6",onpress: (){},),
              ],
            ),
            SizedBox(height:20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DayBox(day: "7",onpress: (){},)
              ],
            ),

          ],
        ),
      ),
      

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


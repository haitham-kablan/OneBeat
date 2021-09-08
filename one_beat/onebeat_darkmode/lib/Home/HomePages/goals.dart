

import 'package:flutter/cupertino.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onebeat_darkmode/Design/Button/ButtonStyle.dart';
import 'package:onebeat_darkmode/Design/ColorsPallete/Pallete.dart';
import 'package:onebeat_darkmode/Design/TextStyle/TextStyle.dart';


class goals extends StatefulWidget {
  const goals({Key? key}) : super(key: key);

  @override
  _goalsState createState() => _goalsState();
}

class _goalsState extends State<goals> {
  double value = 25;
  String category = "משקל";
  String sizeElm = "ק\"ג";
  double min = 25;
  double max = 170;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 10,
          backgroundColor: greenClr,
          title: Text(
            "יעדים" , style: whiteText(20),
          ),
          centerTitle: true,
          leading:  IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.chevron_left , color: Colors.white, size: 35,)),
        ),
        backgroundColor: backGroundClr,
        body: Column(
          children: [
            SizedBox(height: size.height * 0.05,),
            Padding(
              padding: const EdgeInsets.only(left: 35,right: 35),
              child: Container(
                color: Color(0xfff0f0f0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap :(){
                        setState(() {
                          category = "ידיים";
                          sizeElm = "ס\"מ";
                          max = 60;
                          min = 5;
                          value = 5;
                        });
                      },
                      child: category == "ידיים" ? Image.asset("assets/black_arm.png" , width: 30,height: 30,)
                          : Image.asset("assets/grey_arm.png", width: 25,height: 25,) ,
                    ),
                    Container(
                      width: 2,
                      height: 40,
                      color: Colors.grey[200],
                    ),
                    InkWell(
                      onTap :(){
                        setState(() {
                          category = "בטן";
                          sizeElm = "ס\"מ";
                          max = 100;
                          min = 15;
                          value = 15;
                        });
                      },
                      child: category == "בטן" ? Image.asset("assets/black_stomach.png" , width: 30,height: 30,)
                          : Image.asset("assets/grey_stomach.png", width: 25,height: 25,) ,
                    ),
                    Container(
                      width: 2,
                      height: 40,
                      color: Colors.grey[200],
                    ),
                    InkWell(
                      onTap: (){
                        setState(() {
                          category = "משקל";
                          sizeElm = "ק\"ג";
                          max = 170;
                          min = 25;
                          value = 25;
                        });
                      },
                      child: category == "משקל" ? Image.asset("assets/black_scale.png" , width: 30,height: 30,)
                          : Image.asset("assets/grey_scale.png", width: 25,height: 25,) ,
                    ),
                    Container(
                      width: 2,
                      height: 40,
                      color: Colors.grey[200],
                    ),
                    InkWell(
                      onTap: (){
                        setState(() {
                          category = "שומן";
                          sizeElm = "%";
                          max = 50;
                          min = 3;
                          value = 3;
                        });
                      },
                      child: category == "שומן" ? Image.asset("assets/black_fat.png" , width: 30,height: 30,)
                          : Image.asset("assets/grey_fat.png", width: 25,height: 25,) ,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            Text(category , style: explaintion(30),),
            SizedBox(height: 20,),
            Container(

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(value.toStringAsFixed(1) , style: GoogleFonts.rubik(
                      color: Colors.black,
                      fontSize: 90,
                    ),),
                    Text(sizeElm , style: GoogleFonts.rubik(
                      color: Colors.black,
                      fontSize: 30,
                    ),)
                  ],
                )
            ),
            SizedBox(height: 35,),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 37),
                  child: Row(
                    children: [
                      Text("Min  " , style: GoogleFonts.rubik(
                        color: Color(0xff707070),
                        fontSize: 15,
                      ),),
                      Text(min.toStringAsFixed(0), style: GoogleFonts.rubik(
                        color: Color(0xff707070),
                        fontSize: 15,
                      ),),
                    ],
                  ),
                ),
                Spacer(flex: 1,),
                Padding(
                  padding: const EdgeInsets.only(right: 37),
                  child: Row(
                    children: [
                      Text("Max  " , style: GoogleFonts.rubik(
                        color: Color(0xff707070),
                        fontSize: 15,
                      ),),
                      Text(max.toStringAsFixed(0), style: GoogleFonts.rubik(
                        color: Color(0xff707070),
                        fontSize: 15,
                      ),),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.01,),
            Padding(
              padding: const EdgeInsets.only(left: 15 , right: 15),
              child: Container(
                child: Slider(
                    activeColor: greenClr,
                    inactiveColor: Colors.grey[300],
                    min: min,
                    max: max,
                    value: value,
                    onChanged: (val){
                      setState(() {
                        value = val;
                      });
                    }),
              ),
            ),
            Spacer(flex: 1,),
            Image.asset("assets/goalsBg.png" ,height: 85,),
            SizedBox(height: 20,),
            button(greenClr , "עדכן" , Colors.white , BorderRadius.circular(5),size.width * 0.5,size.height * 0.05,(){}),
            SizedBox(height: size.height * 0.06,)
          ],
        ),
      ),
    );
  }
}

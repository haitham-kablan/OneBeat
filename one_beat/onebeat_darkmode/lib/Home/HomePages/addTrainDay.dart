//

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onebeat_darkmode/ColorsPallete/ColorsPallete.dart' as old;
import 'package:onebeat_darkmode/DataBase/Services/DataBaseService.dart';
import 'package:onebeat_darkmode/DataBase/SpecicficExcerise.dart';
import 'package:onebeat_darkmode/Design/Button.dart';
import 'package:onebeat_darkmode/Design/ColorsPallete/Pallete.dart';
import 'package:onebeat_darkmode/Design/TextStyle/TextStyle.dart';
import 'package:onebeat_darkmode/HomePage/screens/Excerise/addTrainDay.dart';
import 'package:onebeat_darkmode/utils/GeneralExcerises.dart';


class addTrainDay extends StatefulWidget {
  const addTrainDay({Key? key, required this.day}) : super(key: key);
  final int day;

  @override
  _addTrainDayState createState() => _addTrainDayState(day);
}

class _addTrainDayState extends State<addTrainDay> {

  final int day;

  List<String> muscles = ["חזה","גב","יד קדמית","יד אחורית","כתפיים","בטן","רגליים"];
  _addTrainDayState(this.day);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: backGroundClr,
        appBar: AppBar(
          elevation: 10,
          backgroundColor: greenClr,
          title: Text(
            "בניית תוכנית" , style: whiteText(20),
          ),
          centerTitle: true,
          leading:  IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.chevron_left , color: Colors.white, size: 35,)),
        ),
        body: Column(
          children: [
            SizedBox(height: 20,),
            Center(child: Text(day.toString() + "  " +"אימון " , style: pageHeader(25),)),
            SizedBox(height: size.height * 0.05,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GeneralExcerise(Category.CHEST,"").getPicTile((){}),
                GeneralExcerise(Category.BACK,"").getPicTile((){}),
                GeneralExcerise(Category.SHOULDERS,"").getPicTile((){}),

              ],
            ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GeneralExcerise(Category.LEGS,"").getPicTile((){}),
                GeneralExcerise(Category.BICEPS,"").getPicTile((){}),
                GeneralExcerise(Category.TRICEPS,"").getPicTile((){}),
              ],
            ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GeneralExcerise(Category.ABS,"").getPicTile((){}),
              ],
            ),
            Spacer(flex: 1,),
            button(greenClr , "הוספת תוכנית" , Colors.white , BorderRadius.circular(5),size.width * 0.5,size.height * 0.06,(){
            }),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}



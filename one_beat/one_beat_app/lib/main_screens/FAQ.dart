

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:one_beat_app/colors/colors_pallete.dart';
import 'package:one_beat_app/db_service/classes/Excercise.dart';
import 'package:one_beat_app/db_service/classes/FAQ.dart' as db_faq;
import 'package:one_beat_app/db_service/dataBaseService.dart';
import 'package:one_beat_app/main_screens/MyPlan.dart';
import 'package:one_beat_app/main_screens/Profile.dart';
import 'package:one_beat_app/main_screens/measurments.dart';


class FAQ extends StatefulWidget {
  @override
  _FAQState createState() => _FAQState();
}

class _FAQState extends State<FAQ> {

  bool answered = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffECF0F1 ),
      body: Column(
        children: [
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: (){
                  setState(() {
                    answered = false;
                    print(answered);
                    return;
                  });
                },
                child: Material(
                  borderRadius: BorderRadius.circular(10),
                  elevation: 10,
                  child: Container(
                    width: size.width * 0.4,
                    height: size.height * 0.07,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        colors:[
                          Color(0xff414141),
                          Colors.black,
                        ],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                      ),
                    ),
                    child: Center(
                      child: Text("שאלות חדשות",textAlign:TextAlign.center,style: TextStyle(
                          color: answered == false ? current_color.color.title_heading : Colors.white,
                          fontSize:17
                      ),),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  setState(() {
                    answered = true;
                    print(answered);
                    return;
                  });
                },
                child: Material(
                  borderRadius: BorderRadius.circular(10),
                  elevation: 10,
                  child: Container(
                    width: size.width * 0.4,
                    height: size.height * 0.07,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        colors:[
                          Color(0xff414141),
                          Colors.black,
                        ],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                      ),
                    ),
                    child: Center(
                      child: Text("שאלות ותשובות",textAlign:TextAlign.center,style: TextStyle(
                          color: answered == true ? current_color.color.title_heading : Colors.white,
                          fontSize:17
                      ),),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}



class Empty_faq extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: current_color.color.background_color,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width:size.width * 0.7,
                child: Text("עדיין אין למתאמנים שלנו שאלות , תוכל להוסיף שאלה על ידי לחיצת כפתור +" ,
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: current_color.color.title_heading,
                    fontSize: 20,
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}


class AddFaq extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffECF0F1 ),
      
    );
  }
}


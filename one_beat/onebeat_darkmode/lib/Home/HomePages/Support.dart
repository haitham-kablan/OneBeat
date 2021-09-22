

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onebeat_darkmode/Design/ColorsPallete/Pallete.dart';
import 'package:onebeat_darkmode/Design/TextStyle/TextStyle.dart';


class Support extends StatelessWidget {
  const Support({Key? key}) : super(key: key);

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
              "תמיכה" , style: whiteText(20),
            ),
            centerTitle: true,
            leading:  IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(Icons.chevron_left , color: Colors.white, size: 35,)),
          ),
          body: Column(
            children: [
              SizedBox(height: size.height * 0.05,),
              Center(child: Text("מאמנים" , style: pageHeader(50),)),
              SizedBox(height: 30,),
              Text("קרים חמוד" , style: explaintion(30),),
              Text("054-5522973" , style: GoogleFonts.assistant(
                color: Color(0xff707070),
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),),
              SizedBox(height: 30,),
              Text("אדהם סויד" , style: explaintion(30),),
              Text("054-5522973" , style: GoogleFonts.assistant(
                color: Color(0xff707070),
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),),
              SizedBox(height: 30,),
              Center(child: Text("תמיכה טכנית" , style: pageHeader(50),)),
              Text("הייתם קבלאן" , style: explaintion(30),),
              Text("054-5522973" , style: GoogleFonts.assistant(
                color: Color(0xff707070),
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),),
              Spacer(flex: 1,),
              Image.asset("assets/measureBg.png" , width: 100,height: 100,),
              SizedBox(height: 40,),
            ],
          ),
        ));
  }
}

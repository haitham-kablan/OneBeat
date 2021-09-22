

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onebeat_darkmode/Design/ColorsPallete/Pallete.dart';
import 'package:onebeat_darkmode/Design/TextStyle/TextStyle.dart';


class Hours extends StatefulWidget {
  const Hours({Key? key}) : super(key: key);

  @override
  _HoursState createState() => _HoursState();
}

class _HoursState extends State<Hours> {
  
  bool male = true;
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
          backgroundColor: backGroundClr,
          appBar: AppBar(
            elevation: 3,
            backgroundColor: greyClr,
            title: Text(
              "שעות פתיחה" , style: whiteText(20),
            ),
            centerTitle: true,
            leading:  IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(Icons.chevron_left , color: Colors.white, size: 35,)),
          ),
          body:
              SingleChildScrollView(
                child: Container(
                  height: size.height,
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      Center(child: Text(male? "גברים" : "נשים" , style: greenText(50),)),
                      Center(
                        child: FlutterSwitch(
                          value: isSwitched,
                          width: 60,
                          height: 20,
                          toggleSize: 10,
                          inactiveColor: Color(0xff2A2A2A),
                          activeColor: greenClr,
                          onToggle: (bool value) {
                            setState(() {
                              isSwitched = value;
                              male = !male;
                              print(isSwitched);
                            });
                          },
                        ),
                      ),
                      SizedBox(height: 50,),
                      Center(child: Text("ראשון , שלישי , חמישי" , style: GoogleFonts.rubik(
                        color: Colors.white,
                        fontSize: 30,
                      ),textDirection: TextDirection.rtl,)),
                      male ? Column(
                        children: [
                          Text("06:00 - 11:00" , style: GoogleFonts.rubik(
                            color: Color(0xff707070),
                            fontSize: 20,
                          ),),
                          Text("18:30 - 23:30" , style: GoogleFonts.rubik(
                            color: Color(0xff707070),
                            fontSize: 20,
                          ),),
                        ],
                      )  :
                      Text("11:00 - 18:30" , style: GoogleFonts.rubik(
                        color: Color(0xff707070),
                        fontSize: 20,
                      ),),

                      SizedBox(height: 20,),
                      Center(child: Text("שני רביעי" , style: GoogleFonts.rubik(
                        color: Colors.white,
                        fontSize: 30,
                      ),textDirection: TextDirection.rtl,)),
                      male ? Column(
                        children: [
                          Text("06:00 - 14:00" , style: GoogleFonts.rubik(
                            color: Color(0xff707070),
                            fontSize: 20,
                          ),),
                          Text("20:00 - 23:30" , style: GoogleFonts.rubik(
                            color: Color(0xff707070),
                            fontSize: 20,
                          ),),
                        ],
                      )  :
                      Text("14:00 - 20:00" , style: GoogleFonts.rubik(
                        color: Color(0xff707070),
                        fontSize: 20,
                      ),),

                      SizedBox(height: 20,),
                      Center(child: Text("שישי" , style: GoogleFonts.rubik(
                        color: Colors.white,
                        fontSize: 30,
                      ),textDirection: TextDirection.rtl,)),
                      !male ? Column(
                        children: [
                          Text("06:00 - 08:00" , style: GoogleFonts.rubik(
                            color: Color(0xff707070),
                            fontSize: 20,
                          ),),
                          Text("16:00 - 22:00" , style: GoogleFonts.rubik(
                            color: Color(0xff707070),
                            fontSize: 20,
                          ),),
                        ],
                      )  :
                      Text("08:00 - 15:30" , style: GoogleFonts.rubik(
                        color: Color(0xff707070),
                        fontSize: 20,
                      ),),

                      SizedBox(height: 20,),
                      Center(child: Text("שבת" , style: GoogleFonts.rubik(
                        color: Colors.white,
                        fontSize: 30,
                      ),textDirection: TextDirection.rtl,)),
                      male ? Column(
                        children: [
                          Text("06:00 - 10:00" , style: GoogleFonts.rubik(
                            color: Color(0xff707070),
                            fontSize: 20,
                          ),),
                          Text("17:00 - 22:00" , style: GoogleFonts.rubik(
                            color: Color(0xff707070),
                            fontSize: 20,
                          ),),
                        ],
                      )  :
                      Text("10:00 - 17:00" , style: GoogleFonts.rubik(
                        color: Color(0xff707070),
                        fontSize: 20,
                      ),),
                      SizedBox(height: male? 30 : 50,),
                  Align(
                    alignment: Alignment.bottomCenter,
                     child: Container(margin:EdgeInsets.only(bottom: 20),child: Image.asset(male ? "assets/maleBg.png" : "assets/femaleBg.png" , width: 50, height: 70,)),
                  ),

            ],

          ),
                ),
              ),
        ));
  }
}



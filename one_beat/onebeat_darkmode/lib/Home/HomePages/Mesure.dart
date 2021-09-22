

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onebeat_darkmode/DataBase/Services/DataBaseService.dart';
import 'package:onebeat_darkmode/DataBase/User/GymHeroUser.dart';
import 'package:onebeat_darkmode/Design/Button/ButtonStyle.dart';
import 'package:onebeat_darkmode/Design/ColorsPallete/Pallete.dart';
import 'package:onebeat_darkmode/Design/TextStyle/TextStyle.dart';

class Measure extends StatefulWidget {
  const Measure({Key? key, this.refresh}) : super(key: key);
  final refresh;

  @override
  _MeasureState createState() => _MeasureState(refresh);
}

class _MeasureState extends State<Measure> {
  final refresh;

  String category = "משקל";
  String sizeElm = "ק\"ג";
  double min = 25;
  double max = 170;
  bool isLoading = false;

  int counter = 0;
  List<String> program = ["משקל" , "אחוז שומן", "היקף ידיים","היקף בטן"];

  _MeasureState(this.refresh);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 10,
          backgroundColor: greyClr,
          title: Text(
            "מדידות" , style: whiteText(20),
          ),
          centerTitle: true,
          leading:  IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.chevron_left , color: Colors.white, size: 35,)),
        ),
        backgroundColor: backGroundClr,
        body: SingleChildScrollView(
          child: Container(
            height: size.height,
            child: Column(
              children: [
                SizedBox(height: size.height * 0.05,),
                Row(
                  children: [
                    Spacer(flex: 1,),
                    counter != 0 ? IconButton(
                      icon: Icon(Icons.arrow_left , color: emptyDotClr,size: 33,),
                      onPressed: (){
                        setState(() {
                          counter--;
                          if(counter == 0){
                            min = 25;
                            max = 170;

                            category = "משקל";
                            sizeElm = "ק\"ג";
                          }
                          if(counter == 1){
                            min = 3;

                            max = 45;
                            category = program[counter];
                            sizeElm = "%";
                          }
                          if(counter == 2){
                            min = 10;

                            max = 60;
                            category = program[counter];
                            sizeElm = "ס\"מ";
                          }
                          if(counter == 3){
                            min = 15;

                            max = 120;
                            category = program[counter];
                            sizeElm = "ס\"מ";
                          }
                        });
                      },
                    ) : Container(width: 25,height: 25,),
                    SizedBox(width: 25,),
                    Text(program[counter], style: GoogleFonts.assistant(
                      color: Colors.grey[600]!,
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                    ),),
                    SizedBox(width: 25,),
                    counter == program.length - 1 ? Container(width: 25,height: 25,) : IconButton(
                      icon: Icon(Icons.arrow_right , color: emptyDotClr , size: 33,),
                      onPressed: (){
                        setState(() {
                          counter++;
                          if(counter == 0){
                            min = 25;
                            max = 170;

                            category = "משקל";
                            sizeElm = "ק\"ג";
                          }
                          if(counter == 1){
                            min = 3;

                            max = 45;
                            category = program[counter];
                            sizeElm = "%";
                          }
                          if(counter == 2){
                            min = 10;

                            max = 60;
                            category = program[counter];
                            sizeElm = "ס\"מ";
                          }
                          if(counter == 3){
                            min = 15;

                            max = 120;
                            category = program[counter];
                            sizeElm = "ס\"מ";
                          }
                        });
                      },
                    ),
                    Spacer(flex: 1,),
                  ],
                ),
                SizedBox(height: 20,),
                SizedBox(height: 40,),
                SizedBox(height: 40,),
                Container(

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text((counter == 0 ? gymHeroUser.weight : (counter == 1 ? gymHeroUser.bodyfat : (counter == 2? gymHeroUser.armSize:gymHeroUser.stomachSize))).toStringAsFixed(1) , style: GoogleFonts.rubik(
                          color: Colors.white,
                          fontSize: 90,
                        ),),
                        Text(sizeElm , style: GoogleFonts.rubik(
                          color: Colors.white,
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
                        value: (counter == 0 ? gymHeroUser.weight : (counter == 1 ? gymHeroUser.bodyfat : (counter == 2? gymHeroUser.armSize:gymHeroUser.stomachSize))).toDouble(),
                        onChanged: (val){
                          setState(() {
                            if(counter == 0){
                              gymHeroUser.weight = val;
                            }
                            if(counter == 1){
                              gymHeroUser.bodyfat = val;
                            }
                            if(counter == 2){
                              gymHeroUser.armSize = val;
                            }
                            if(counter == 3){
                              gymHeroUser.stomachSize = val;
                            }

                          });
                        }),
                  ),
                ),
                SizedBox(height: 120,),
              isLoading ? CircularProgressIndicator(
                backgroundColor: navBarClr,
                color: greenClr,
              ): button(greenClr , "עדכן" , Colors.white , BorderRadius.circular(5),size.width * 0.5,size.height * 0.05,() async {
                setState(() {
                  isLoading = true;
                });


                Map<String,dynamic> map = Map();
                map["weight"] = gymHeroUser.weight;
                map["bodyfat"] = gymHeroUser.bodyfat;
                map["armSize"] = gymHeroUser.armSize;
                map["stomachSize"] = gymHeroUser.stomachSize;
                await DataBaseService.updateUser(map);
                setState(() {
                  isLoading = false;
                });
                refresh();
              }),
                SizedBox(height: size.height * 0.06,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onebeat_darkmode/Design/Animation/PageTransition.dart';
import 'package:onebeat_darkmode/Design/Button.dart';
import 'package:onebeat_darkmode/Design/ColorsPallete/Pallete.dart';
import 'package:onebeat_darkmode/Design/DayBox.dart';
import 'package:onebeat_darkmode/Design/TextStyle/TextStyle.dart';
import 'package:onebeat_darkmode/Home/HomePages/addTrainDay.dart';
import 'package:onebeat_darkmode/HomePage/screens/Excerise/addTrainDay.dart' as x;


class BuildPlan extends StatefulWidget {
  const BuildPlan({Key? key}) : super(key: key);

  @override
  _BuildPlanState createState() => _BuildPlanState();
}

class _BuildPlanState extends State<BuildPlan> {

  List<Widget> list = [];
  double value =0;
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
            "בניית תוכנית אימון" , style: whiteText(20),
          ),
          centerTitle: true,
          leading:  IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.chevron_left , color: Colors.white, size: 35,)),
        ),
        body: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 30,),
                Center(child: Text("שם תוכנית" , style: pageHeader(25),)),
                SizedBox(height: 10,),
                Center(child: Text("vhas asd2 asds" , style: explaintion(20),)),
                SizedBox(height: 30,),
                Center(child: Text("מספר ימים בשבוע" , style: pageHeader(25),)),
                SizedBox(height: 15,),
                Center(child: Text(value.toStringAsFixed(0) , style: explaintion(40),)),
                Padding(
                  padding: const EdgeInsets.only(left: 35 , right: 35),
                  child: Container(
                    child: Slider(
                        activeColor: greenClr,
                        divisions: 7,
                        label: "$value",
                        inactiveColor: Colors.grey[300],
                        min: 0,
                        max: 7,
                        value: value,
                        onChanged: (val){
                          setState(() {
                            value = val;
                            print("$value");
                            list.clear();
                            for(int i =0 ; i<value.toInt() ; i++){
                              list.add(
                                Container(
                                  margin: EdgeInsets.all(8),
                                  child: DayBox(
                                      day: "יום  " + (i+1).toStringAsFixed(0) , isPressed: false , onpress: (){
                                    Navigator.push(
                                      context,
                                      CustomPageRoute( child: addTrainDay(day: i+1,),),
                                    );
                                  },
                                  ),
                                ),
                              );
                            }
                          });
                        }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40,right: 40),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Wrap(
                      children: list,
                    ),
                  ),
                ),
                Spacer(flex: 1,),
                value != 0 ? button(greenClr , "עדכן" , Colors.white , BorderRadius.circular(5),size.width * 0.5,size.height * 0.05,(){}) : Container(),
                SizedBox(height: 50,)

              ],
            ),
            Align(
              alignment: Alignment.bottomLeft,
                child: Container(
                  margin: EdgeInsets.only(bottom: 20),
                    child: Image.asset("assets/measureBgOpacity.png" , width: 100,height: 100,))),
          ],
        ),

      ),
    );
  }

  void addDay(){
    setState(() {
      list.add(
        Container(
          margin: EdgeInsets.all(8),
          child: DayBox(
              day: "יום  " + value.toStringAsFixed(0) , isPressed: false
          ),
        ),
      );


    });
  }
}

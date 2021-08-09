

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onebeat_darkmode/ColorsPallete/ColorsPallete.dart';
import 'package:onebeat_darkmode/Design/DayBox.dart';
import 'package:onebeat_darkmode/HomePage/screens/Excerise/ExceriseTile.dart';

import '../../../Constants.dart';


class GenralPlan extends StatefulWidget {

  final String name;
  List<ExceriseTile> excerises;



  GenralPlan({Key? key,  required this.name,required this.excerises}) : super(key: key);

  @override
  _GenralPlanState createState() => _GenralPlanState(name,excerises);
}

class _GenralPlanState extends State<GenralPlan> {

  final String name;
  List<ExceriseTile> excerises;

  bool ABA1_flag = true;
  bool ABA2_flag = false;
  bool ABB1_flag = false;
  bool ABB2_flag = false;

  bool ABCA_flag = true;
  bool ABCB_flag = false;
  bool ABCC_flag = false;

  _GenralPlanState(this.name,this.excerises);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: backGroundClr,
        appBar: AppBar(
          backgroundColor: backGroundClr,
          elevation: 0,
        ),
        body: Container(
          child: Column(
            children: [
              SizedBox(height: 15,),
              Align(
                alignment: Alignment.center,
                child: RichText(
                  text: TextSpan(
                    children:  <TextSpan>[
                      TextSpan(text: name,style: TextStyle(color: greenClr,fontSize: 35,fontStyle: FontStyle.italic),),
                      TextSpan(text: '   תוכנית', style: TextStyle(color: offWhite,fontSize: 35,fontStyle: FontStyle.italic)),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40,),
              name == 'A' ?  SizedBox(height: 0,) :
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: name =="AB" ? [
                  DayBox(day: "A1",onpress: (){
                    setState(() {

                      excerises = ABA1;

                      ABA1_flag = true;
                      ABA2_flag = false;
                      ABB1_flag = false;
                      ABB2_flag = false;
                      ABCA_flag = false;
                      ABCB_flag = false;
                      ABCC_flag = false;

                    });
                  },isPressed: ABA1_flag,),
                  DayBox(day: "B1",onpress: (){
                    setState(() {
                      excerises = ABB1;
                      ABA1_flag = false;
                      ABA2_flag = false;
                      ABB1_flag = true;
                      ABB2_flag = false;
                      ABCA_flag = false;
                      ABCB_flag = false;
                      ABCC_flag = false;
                    });
                  },isPressed: ABB1_flag,),
                  DayBox(day: "A2",onpress: (){
                    setState(() {
                      excerises = ABA2;
                      ABA1_flag = false;
                      ABA2_flag = true;
                      ABB1_flag = false;
                      ABB2_flag = false;
                      ABCA_flag = false;
                      ABCB_flag = false;
                      ABCC_flag = false;
                    });
                  },isPressed: ABA2_flag,),
                  DayBox(day: "B2",onpress: (){
                    setState(() {
                      excerises = ABB2;
                      ABA1_flag = false;
                      ABA2_flag = false;
                      ABB1_flag = false;
                      ABB2_flag = true;
                      ABCA_flag = false;
                      ABCB_flag = false;
                      ABCC_flag = false;
                    });
                  },isPressed: ABB2_flag,),
                ] : [
                  DayBox(day: "A",onpress: (){
                    setState(() {
                      excerises = ABCA;
                      ABA1_flag = false;
                      ABA2_flag = false;
                      ABB1_flag = false;
                      ABB2_flag = false;
                      ABCA_flag = true;
                      ABCB_flag = false;
                      ABCC_flag = false;
                  });
                  },isPressed: ABCA_flag,),
                  DayBox(day: "B",onpress: (){
                    setState(() {
                      excerises = ABCB;
                      ABA1_flag = false;
                      ABA2_flag = false;
                      ABB1_flag = false;
                      ABB2_flag = false;
                      ABCA_flag = false;
                      ABCB_flag = true;
                      ABCC_flag = false;
                    });

                  },isPressed: ABCB_flag,),
                  DayBox(day: "C",onpress: (){
                    setState(() {
                      excerises = ABCC;
                      ABA1_flag = false;
                      ABA2_flag = false;
                      ABB1_flag = false;
                      ABB2_flag = false;
                      ABCA_flag = false;
                      ABCB_flag = false;
                      ABCC_flag = true;
                    });

                  },isPressed: ABCC_flag,),
                ],
              ),
              Container(
                height: size.height * 0.6,
                child: ListView(
                  padding: EdgeInsets.all(45),
                  children: excerises
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}





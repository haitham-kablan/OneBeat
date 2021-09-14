

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onebeat_darkmode/DataBase/Services/DataBaseService.dart';
import 'package:onebeat_darkmode/DataBase/User/GymHeroUser.dart';
import 'package:onebeat_darkmode/Design/Animation/PageTransition.dart';
import 'package:onebeat_darkmode/Design/Button.dart';
import 'package:onebeat_darkmode/Design/ColorsPallete/Pallete.dart';
import 'package:onebeat_darkmode/Design/DayBox.dart';
import 'package:onebeat_darkmode/Design/ShowError.dart';
import 'package:onebeat_darkmode/Design/TextStyle/TextStyle.dart';
import 'package:onebeat_darkmode/Home/HomePages/addTrainDay.dart';
import 'package:onebeat_darkmode/HomePage/screens/Excerise/addTrainDay.dart' as x;
import 'package:onebeat_darkmode/utils/GeneralExcerises.dart';
import 'package:onebeat_darkmode/utils/Porgram.dart';
import 'package:onebeat_darkmode/utils/ProgramDay.dart';


class BuildPlan extends StatefulWidget {
  const BuildPlan({Key? key, this.refresh}) : super(key: key);
  final refresh;

  @override
  _BuildPlanState createState() => _BuildPlanState(refresh);
}

class _BuildPlanState extends State<BuildPlan> {

  List<Widget> list = [];
  final refresh;
  List<addTrainDay> daysList = [
    addTrainDay(day: 1),
    addTrainDay(day: 2),
    addTrainDay(day: 3),
    addTrainDay(day: 4),
    addTrainDay(day: 5),
    addTrainDay(day: 6),
    addTrainDay(day: 7),
  ];

  double value =0;
  TextEditingController name = TextEditingController();
  bool isLoading =false;

  _BuildPlanState(this.refresh);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: backGroundClr,
        appBar: AppBar(
          elevation: 10,
          backgroundColor: greenClr,
          title: Text(
            "בניית תוכנית אימון" , style: whiteText(20),
          ),
          centerTitle: true,
          leading:  IconButton(onPressed: (){
            addTrainDay.clear();
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: size.width * 0.8,
                      child: Center(
                        child: TextField(
                          textAlign: TextAlign.center,
                          controller: name,
                          style: GoogleFonts.assistant(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintText: "שם תוכנית",
                            hintStyle:  GoogleFonts.assistant(
                              color: emptyDotClr,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
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
                            if(value.toInt() == 0){
                              addTrainDay.clear();
                            }
                            for(int i =0 ; i<value.toInt() ; i++){
                              list.add(
                                Container(
                                  margin: EdgeInsets.all(8),
                                  child: DayBox(
                                      day: "יום  " + (i+1).toStringAsFixed(0) , isPressed: false , onpress: (){
                                    Navigator.push(
                                      context,
                                      CustomPageRoute( child: daysList[i]),
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
                value != 0 ? (isLoading ? CircularProgressIndicator(
                  backgroundColor: navBarClr,
                  color: greenClr,
                ) : button(greenClr , "הוספת תוכנית האימון" , Colors.white , BorderRadius.circular(5),size.width * 0.5,size.height * 0.05,()
                async{
                  if(name.text.isEmpty){
                    ShowError(context, "נא בחר שם לתוכנית");
                    return;
                  }

                  if(name.text.length > 25){
                    ShowError(context, "שם התוכנית ארוך יותר מדי , נא שנה אותו");
                    return;
                  }

                  if(gymHeroUser.programs.any((element) => element.name == name.text)){
                    ShowError(context, "יש לך כבר תוכנית עם שם כזה");
                    return;
                  }

                  if(addTrainDay.isEmpty(list.length)){
                    ShowError(context, "אחד הימים של התוכנית  הוא ריק , נא מלא אותו");
                    return;
                  }

                  setState(() {
                    isLoading = true;
                  });


                  Program program = Program(name.text , addTrainDay.getProgram(list.length));

                  await DataBaseService.addProgramToDb(
                      program
                  );
                  addTrainDay.clear();
                  gymHeroUser.programs.insert(0, program);

                  refresh();
                  Navigator.pop(context);

                  setState(() {
                    isLoading = false;
                  });




                })) : Container(),
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

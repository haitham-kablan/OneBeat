

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onebeat_darkmode/DataBase/Services/DataBaseService.dart';
import 'package:onebeat_darkmode/DataBase/User/GymHeroUser.dart';
import 'package:onebeat_darkmode/Design/Button/ButtonStyle.dart';
import 'package:onebeat_darkmode/Design/ColorsPallete/Pallete.dart';
import 'package:onebeat_darkmode/Design/ShowError.dart';
import 'package:onebeat_darkmode/Design/TextStyle/TextStyle.dart';
import 'package:onebeat_darkmode/Home/adminHomePages/allUsers.dart';
import 'package:onebeat_darkmode/utils/SpecificMeasure.dart';

class Measure extends StatefulWidget {
  const Measure({Key? key, this.refresh, required this.onClick}) : super(key: key);
  final refresh;
  final onClick;

  @override
  _MeasureState createState() => _MeasureState(refresh,onClick);
}

class _MeasureState extends State<Measure> {
  final refresh;
  final onClick;


  TextEditingController heightc = TextEditingController();
  TextEditingController bodyfatc = TextEditingController();
  TextEditingController weightc = TextEditingController();
  TextEditingController stomachc = TextEditingController();
  TextEditingController armc = TextEditingController();

  String category = "משקל";
  String sizeElm = "ק\"ג";
  double min = 25;
  double max = 170;
  bool isLoading = false;
  bool x  = true;

  String weight = "25";
  String bodyfat = "45";
  String arm = "10";
  String stomach = "15";


  int counter = 0;
  List<String> program = ["משקל" , "אחוז שומן", "היקף ידיים","היקף בטן"];

  _MeasureState(this.refresh, this.onClick);


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
          child:
              Container(
                child: Column(
                  children: [
                    SizedBox(height: 20,),
                    Center(
                      child: Text(
                        "נא הזן את המדידות החדשות" , style: greenText(20),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.only(left: 40,right: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 40,
                            child: TextField(
                              controller: heightc,
                              style: greenText(17),
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                hintText: "160",
                                hintStyle: GoogleFonts.assistant(
                                  color: emptyDotClr,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ),
                          Text("גובה  (ס\"מ)" , style: pageSecondHeader(17),textDirection: TextDirection.rtl,),
                        ],
                      ),
                    ),
                    SizedBox(height: size.height * 0.03,),
                    Padding(
                      padding: const EdgeInsets.only(left: 40,right: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 40,
                            child: TextField(
                              controller: weightc,
                              style: greenText(17),
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                hintText: "70",
                                hintStyle:  GoogleFonts.assistant(
                                  color: emptyDotClr,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ),
                          Text("משקל  (ק\"ג)" , style: pageSecondHeader(17),textDirection: TextDirection.rtl,),
                        ],
                      ),
                    ),
                    SizedBox(height: size.height * 0.03,),
                    Padding(
                      padding: const EdgeInsets.only(left: 40,right: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 40,
                            child: TextField(
                              controller: stomachc,
                              style: greenText(17),
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                hintText: "40",
                                hintStyle:  GoogleFonts.assistant(
                                  color: emptyDotClr,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ),
                          Text("היקף בטן  (ק\"ג)" , style: pageSecondHeader(17),textDirection: TextDirection.rtl,),
                        ],
                      ),
                    ),
                    SizedBox(height: size.height * 0.03,),
                    Padding(
                      padding: const EdgeInsets.only(left: 40,right: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 40,
                            child: TextField(
                              controller: armc,
                              style: greenText(17),
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                hintText: "20",
                                hintStyle:  GoogleFonts.assistant(
                                  color: emptyDotClr,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ),
                          Text("היקף יד  (ק\"ג)" , style: pageSecondHeader(17),textDirection: TextDirection.rtl,),
                        ],
                      ),
                    ),
                    SizedBox(height: size.height * 0.03,),
                    Padding(
                      padding: const EdgeInsets.only(left: 40,right: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 40,
                            child: TextField(
                              controller: bodyfatc,
                              style: greenText(17),
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                hintText: "20",
                                hintStyle:  GoogleFonts.assistant(
                                  color: emptyDotClr,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ),
                          Text("אחוז שומן  (ק\"ג)" , style: pageSecondHeader(17),textDirection: TextDirection.rtl,),
                        ],
                      ),
                    ),
                    SizedBox(height: 40,),
                    isLoading ? CircularProgressIndicator(
                      backgroundColor: navBarClr,
                      color: greenClr,
                    ): button(greenClr , "עדכן" , Colors.white , BorderRadius.circular(5),size.width * 0.5,size.height * 0.05,() async {


                      if(heightc.text.isEmpty || weightc.text.isEmpty || armc.text.isEmpty || stomachc.text.isEmpty || bodyfatc.text.isEmpty){
                        ShowError(context, "נא מלא את כל השדות");
                        return;
                      }


                      try{
                        double weightAsDouble = double.parse(weightc.text);
                        if(weightAsDouble < 25 || weightAsDouble > 170){
                          ShowError(context, "משקל לא מתאים");
                          return;
                        }
                      }catch(e){
                        ShowError(context, "משקל לא מתאים");
                        return;
                      }


                      try{
                        double heightAsDouble = double.parse(heightc.text);
                        if(heightAsDouble < 50 || heightAsDouble > 250){
                          ShowError(context, "גובה לא מתאים");
                          return;
                        }
                      }catch(e){
                        ShowError(context, "גובה לא מתאים");
                        return;
                      }

                      try{
                        double bodyfatasDouble = double.parse(bodyfatc.text);
                        if(bodyfatasDouble < 0 || bodyfatasDouble > 100){
                          ShowError(context, "אחוז שומן לא מתאים");
                          return;
                        }
                      }catch(e){
                        ShowError(context, "אחוז שומן לא מתאים");
                        return;
                      }

                      try{
                        double armAsDouble = double.parse(armc.text);
                        if(armAsDouble < 0 || armAsDouble > 100){
                          ShowError(context, "היקף יד לא מתאים");
                          return;
                        }
                      }catch(e){
                        ShowError(context, "היקף יד לא מתאים");
                        return;
                      }

                      try{
                        double stmAsDouble = double.parse(stomachc.text);
                        if(stmAsDouble < 0 || stmAsDouble > 100){
                          ShowError(context, "היקף בטן לא מתאים");
                          return;
                        }
                      }catch(e){
                        ShowError(context, "היקף בטן לא מתאים");
                        return;
                      }


                      setState(() {
                        isLoading = true;
                      });

                      weight = weightc.text;
                      String height = heightc.text;
                      arm = armc.text;
                      bodyfat = bodyfatc.text;
                      stomach = stomachc.text;
                      await DataBaseService.addMeasureForUser(AllUsers.pickedUser!.email, SpecificMeasure(weight, arm, stomach, bodyfat, DateTime.now(),height));
                      AllUsers.pickedUser!.Measures.insert(0,SpecificMeasure(weight, arm, stomach, bodyfat, DateTime.now(),height));
                      if( AllUsers.pickedUser!.email == gymHeroUser.email){
                        gymHeroUser.Measures.insert(0,SpecificMeasure(weight, arm, stomach, bodyfat, DateTime.now(),height));
                      }



                      setState(() {
                        isLoading = false;
                      });
                      refresh( );
                      if(onClick != null){
                        onClick();
                      }
                      Navigator.pop(context);
                    }),
                    SizedBox(height: 40,),
                  ],
                ),
              )
        ),
      ),
    );
  }
}

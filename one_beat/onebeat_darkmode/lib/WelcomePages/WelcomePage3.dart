

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onebeat_darkmode/DataBase/Services/DataBaseService.dart';
import 'package:onebeat_darkmode/DataBase/User/GymHeroUser.dart';
import 'package:onebeat_darkmode/Design/Accesories/Dots.dart';
import 'package:onebeat_darkmode/Design/Button/ButtonStyle.dart';
import 'package:onebeat_darkmode/Design/ColorsPallete/Pallete.dart';
import 'package:onebeat_darkmode/Design/ShowError.dart';
import 'package:onebeat_darkmode/Design/TextStyle/TextStyle.dart';
import 'package:onebeat_darkmode/Home/Home.dart';
import 'package:onebeat_darkmode/utils/SpecificMeasure.dart';

class WelcomePage3 extends StatefulWidget {
  const WelcomePage3({Key? key}) : super(key: key);

  @override
  _WelcomePage3State createState() => _WelcomePage3State();
}

class _WelcomePage3State extends State<WelcomePage3> {

  bool male = true;
  bool isLoading = false;
  TextEditingController age = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController height = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Material(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: backGroundClr,
          body: Column(
            children: [
              SizedBox(height: size.height * 0.05,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.chevron_left,color: Colors.white,),
                  ),
                  Text("שלב 3 מתוך 3" , style: pageHeader(20),),
                  IconButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.chevron_left,color: Colors.transparent,),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.02,),
              Text("נתונים אישיים" , style: pageSecondHeader(20),),
              SizedBox(height: size.height * 0.03,),
              Center(
                  child: Container(
                      width: size.width * 0.8,
                      child: Text("עדכן את הנתונים האישיים שלך כדי שתוכל לעקוב אחריהם ולהשיג את התוצאות שחלמת עליהן", style: GoogleFonts.assistant(
                        color: Colors.grey[600],
                        fontSize: 20,
                      ) , textAlign: TextAlign.center,))),
              SizedBox(height: size.height * 0.05,),
              Padding(
                padding: const EdgeInsets.only(left: 40,right: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 40,
                      child: TextField(
                        controller: height,
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
                            color: Colors.grey[600],
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                    Text("גובה  (ס\"מ)" , style: pageSecondHeader(17),textDirection: TextDirection.rtl,),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.02,),
              Padding(
                padding: const EdgeInsets.only(left: 30 , right: 30),
                child: Container(
                  height: 1,
                  color: emptyDotClr,
                ),
              ),
              SizedBox(height: size.height * 0.02,),
              Padding(
                padding: const EdgeInsets.only(left: 40,right: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 40,
                      child: TextField(
                        controller: weight,
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
                            color: Colors.grey[600],
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                    Text("משקל  (ק\"ג)" , style: pageSecondHeader(17),textDirection: TextDirection.rtl,),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.02,),
              Padding(
                padding: const EdgeInsets.only(left: 30 , right: 30),
                child: Container(
                  height: 1,
                  color: emptyDotClr,
                ),
              ),
              SizedBox(height: size.height * 0.02,),
              Padding(
                padding: const EdgeInsets.only(left: 40,right: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 40,
                      child: TextField(
                        controller: age,
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
                            color: Colors.grey[600],
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                    Text("גיל" , style: pageSecondHeader(17),),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.03,),
              Padding(
                padding: const EdgeInsets.only(left: 30 , right: 30),
                child: Container(
                  height: 1,
                  color: emptyDotClr,
                ),
              ),
              SizedBox(height: size.height * 0.03,),
              Padding(
                padding: const EdgeInsets.only(left: 35,right: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: (){
                            setState(() {
                              male = true;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                bottomLeft: Radius.circular(5),
                              ),
                              color: male ? greenClr : Colors.transparent,
                              border: Border.all(
                                color: greenClr,
                                width: 2,
                              ),
                            ),
                            width: 60,
                            height: 27,

                            child: Center(
                              child: Text("זכר" , style: male ? whiteText(15) : greenText(15)),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            setState(() {
                              male = false;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(5),
                                bottomRight: Radius.circular(5),
                              ),
                              color: !male ? greenClr : Colors.transparent,
                              border: Border.all(
                                color: greenClr,
                                width: 2,
                              ),
                            ),
                            width: 60,
                            height: 27,

                            child: Center(
                              child: Text("נקבה" , style: !male ? whiteText(15) : greenText(15)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text("מין" , style: pageSecondHeader(17),),
                  ],
                ),
              ),
              Spacer(flex: 1,),
              isLoading ? CircularProgressIndicator(
                backgroundColor: navBarClr,
                color: greenClr,
              )
                  :button(greenClr , "התחל" , Colors.white , BorderRadius.circular(30),size.width * 0.8,size.height * 0.06,() async {

                if(age.text.isEmpty || weight.text.isEmpty || height.text.isEmpty){
                  ShowError(context, "נא מלא את כל השדות");
                  return;
                }


                  try{

                    double weightAsDouble = double.parse(weight.text);
                    if(weightAsDouble < 25 || weightAsDouble > 170){
                      ShowError(context, "משקל לא מתאים");
                      return;
                    }
                  }catch(e){
                    ShowError(context, "משקל לא מתאים");
                    return;
                  }


                  try{
                    gymHeroUser.height = height.text;
                    double heightAsDouble = double.parse(gymHeroUser.height);
                    if(heightAsDouble < 50 || heightAsDouble > 250){
                      ShowError(context, "גובה לא מתאים");
                      return;
                    }
                  }catch(e){
                    ShowError(context, "גובה לא מתאים");
                    return;
                  }



                  try{
                    gymHeroUser.age = double.parse(age.text);
                    if(gymHeroUser.age < 5 || gymHeroUser.age > 100){
                      ShowError(context, "גיל לא מתאים");
                      return;
                    }
                  }catch(e){
                    ShowError(context, "גיל לא מתאים");
                    return;
                  }



                gymHeroUser.fristTime = false;

                Map<String,dynamic> map =  Map();

                gymHeroUser.Measures.insert(0,SpecificMeasure(weight.text, "-", "-", "-", DateTime.now()));
                gymHeroUser.goalMeasures.insert(0,SpecificMeasure("-", "-", "-", "-", DateTime.now()));

                map["age"] = gymHeroUser.age;
                //map["weight"] = gymHeroUser.weight;
                map["height"] = gymHeroUser.height;
                map["gender"] = male;
                map["fristTime"] = gymHeroUser.fristTime;
                gymHeroUser.gender = male;

                setState(() {
                  isLoading = true;
                });

                await DataBaseService.updateUser(map);
                await DataBaseService.addMeasureForUser(gymHeroUser.email, SpecificMeasure(weight.text, "-", "-", "-", DateTime.now()));
                await DataBaseService.addGoalMeasureForUser(gymHeroUser.email, SpecificMeasure("-", "-", "-", "-", DateTime.now()));

                setState(() {
                  isLoading = false;
                });

                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => Home(),
                  ),
                      (route) => false,
                );
              }),
              SizedBox(height: size.height * 0.05,),
              Dots(2),
              SizedBox(height: size.height * 0.05,),

            ],
          ),
        ),
      ),
    );
  }
}

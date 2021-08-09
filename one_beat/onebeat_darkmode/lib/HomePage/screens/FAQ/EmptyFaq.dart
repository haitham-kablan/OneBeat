

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onebeat_darkmode/ColorsPallete/ColorsPallete.dart';
import 'package:onebeat_darkmode/DataBase/Services/DataBaseService.dart';
import 'package:onebeat_darkmode/Design/Button.dart';
import 'package:onebeat_darkmode/Design/WrappedMultipleChip.dart';
import 'package:onebeat_darkmode/Drawer/LogOut.dart';
import 'package:onebeat_darkmode/HomePage/screens/FAQ/addQuestDialouge.dart';
import 'package:onebeat_darkmode/Users/CurrentUser.dart';
import 'package:onebeat_darkmode/Users/TrainerUser.dart';


class EmptyFaq extends StatefulWidget {
  const EmptyFaq({Key? key}) : super(key: key);

  @override
  _EmptyFaqState createState() => _EmptyFaqState();
}

class _EmptyFaqState extends State<EmptyFaq> {
  String expString = "הגעת לעמדת השאלות שלנו , כאן אתה יכול לשאול מה שבא לך או לראות שאלות של אחרים";
  List<String> categories = ["כללי" , "אירובי" , "תזונה" , "תוכניות אימון" , "תרגילים", "אחר"];
  List<String> selected =[];
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return (currentUser as TrainerUser).firstFaq ? Scaffold(
      backgroundColor: backGroundClr,
    ):
    Scaffold(
      backgroundColor: backGroundClr,
      body: Column(
        children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: [
          //     Image.asset('assets/topLeftLogo.png'),
          //   ],
          // ),
          SizedBox(height: 70,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/pencil.png',height: 120,width: 120,),
              SizedBox(width: 20,)
            ],
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(top: 20,bottom: 20,left: 40,right: 40),
            child: Text(expString,
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white,fontStyle: FontStyle.italic,fontSize: 17),
            ),
          ),
          SizedBox(height: 60,),
          button(greenClr, "הוספת שאלה", Colors.white, BorderRadius.circular(20), size.width * 0.5, size.width * 0.085, (){

            // setState(() {
            //   (currentUser as TrainerUser).firstFaq = true;
            // });
            //
            // DataBaseService.updateFeild(currentUser!.email, "firstFaq", true);
            //addQuestDialouge(size.height * 0.8 , size.width * 0.85 ,context);
            showDialog(
              context: context,
              builder: (BuildContext context) =>
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(15),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: backGroundClr,
                          ),
                          height: size.height * 0.65,
                          width: size.width * 0.85,
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: IconButton(
                                  icon: Icon(Icons.close_sharp , color: Colors.white,),
                                  onPressed: (){
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                              SizedBox(height: 30,),
                              Text("נא בחר את הקטגוריות של השאלה:",textDirection: TextDirection.rtl,
                                textAlign: TextAlign.right,style: TextStyle(color: greenClr,fontSize: 16),),
                              SizedBox(height: 30,),
                              MultiSelectChip(categories,
                                onSelectionChanged: (selectedList) {
                                  setState(() {
                                    selected = selectedList;
                                  });
                                },
                              ),
                              SizedBox(height: 30,),
                              Padding(
                                padding: const EdgeInsets.only(left: 30,right: 30),
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    hintText: "שאלה..",
                                    hintStyle: TextStyle(
                                      color: navBarItemsClr
                                    ),hintTextDirection: TextDirection.rtl
                                  ),
                                  textAlign: TextAlign.right,
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                  keyboardType: TextInputType.multiline,
                                  maxLines: 4,
                                ),
                              ),
                              SizedBox(height: 50,),
                              button(greenClr, "פרסם שאלה", Colors.white, BorderRadius.circular(15), size.width * 0.45, size.height * 0.03, (){}),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
            );


          }),
          SizedBox(height: 20,),
          button(backGroundClr, "שאלות אחרים", Colors.white, BorderRadius.circular(20), size.width * 0.5, size.width * 0.085, (){

            setState(() {
              (currentUser as TrainerUser).firstFaq = true;
            });

            // DataBaseService.updateFeild(currentUser!.email, "firstFaq", true);

          }),
        ],
      ),
    );
  }
}


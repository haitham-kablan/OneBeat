



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onebeat_darkmode/DataBase/Services/DataBaseService.dart';
import 'package:onebeat_darkmode/DataBase/User/GymHeroUser.dart';
import 'package:onebeat_darkmode/Design/Animation/PageTransition.dart';
import 'package:onebeat_darkmode/Design/ColorsPallete/Pallete.dart';
import 'package:onebeat_darkmode/Design/TextStyle/TextStyle.dart';
import 'package:onebeat_darkmode/Home/HomePages/BuildPlan.dart';
import 'package:onebeat_darkmode/Home/HomePages/Plans.dart';
import 'package:onebeat_darkmode/Home/adminHomePages/AdminMeasure.dart';
import 'package:onebeat_darkmode/Home/adminHomePages/AdminPlans.dart';
import 'package:onebeat_darkmode/Home/adminHomePages/allUsers.dart';

import 'MemberShip.dart';
import 'adminGoalMeasure.dart';

class SelectedUser extends StatefulWidget {
  final onClick;
  const SelectedUser({Key? key, required this.onClick}) : super(key: key);

  @override
  _SelectedUserState createState() => _SelectedUserState(onClick);
}

class _SelectedUserState extends State<SelectedUser> {
  final onClick;

  _SelectedUserState(this.onClick);
  void refresh(){
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(height: size.height * 0.05,),
        AllUsers.pickedUser!.gender ? Image.asset("assets/maleFace.png" , width: 80,height: 80,) :
        Image.asset("assets/femaleFace.png", width: 80,height: 80,),
        Center(
          child: Text(AllUsers.pickedUser!.name,style: assistantStyle(greenClr, 25),),
        ),
        Center(
          child: Text(AllUsers.pickedUser!.email,style: assistantStyle(Colors.grey[400]!, 20),),
        ),
        SizedBox(height: size.height * 0.05,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: (){

                  Navigator.push(context, CustomPageRoute(child: AdminMeasure(onClick: onClick,)));
                },
                child: Container(

                  width: size.width * 0.28,
                  height: size.height * 0.13,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: greyClr,
                    border: Border.all(color: Colors.grey[800]! , width: 0.5),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/weight.png",width: 55,height: 55,),
                      Text("מדידות",style: assistantStyle(Colors.grey[600]!, 18),),
                    ],


                  ),
                ),
              ),
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: (){
                  Navigator.push(context, CustomPageRoute(child: AdminGoalMeasure()));
                },
                child: Container(

                  width: size.width * 0.28,
                  height: size.height * 0.13,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: greyClr,
                    border: Border.all(color: Colors.grey[800]! , width: 0.5),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/goalAdmin.png",width: 55,height: 55,),
                      Text("יעדים",style: assistantStyle(Colors.grey[600]!, 18),),
                    ],


                  ),
                ),
              ),
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: (){
                  Navigator.push(context, CustomPageRoute(child: MemperShipPage()));
                },
                child: Container(

                  width: size.width * 0.28,
                  height: size.height * 0.13,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: greyClr,
                    border: Border.all(color: Colors.grey[800]! , width: 0.5),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/ticket.png",width: 55,height: 55,),
                      Text("מנוי אישי",style: assistantStyle(Colors.grey[600]!, 18),),
                    ],


                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AllUsers.pickedUser!.trainer ? Container(
              width: size.width * 0.28,
              height: size.height * 0.13,
            ) : Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: (){
                  showDialog(context: context,
                      builder: (buildContext){
                        return Center(
                            child: Material(
                              color: Colors.transparent,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: greyClr,
                                  border: Border.all(
                                    color: Colors.grey[700]! , width: 0.3
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                width: size.width * 0.8,
                                height: size.height * 0.4,
                                child: Column(
                                  children: [
                                    SizedBox(height: 40,),
                                    Center(
                                      child: Container(
                                        width: size.width * 0.7,
                                        child: Text("האם אתה בטוח שרוצה להפוך את משתמש זה למנהל?",textDirection: TextDirection.rtl,style: assistantStyle(greenClr, 20),textAlign: TextAlign.center,),
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Center(
                                      child: Container(
                                        width: size.width * 0.7,
                                        child: Text(AllUsers.pickedUser!.email,textDirection: TextDirection.rtl,style: assistantStyle(Colors.grey[500]!, 20),textAlign: TextAlign.center,),
                                      ),
                                    ),
                                    Spacer(flex: 1,),
                                    Image.asset("assets/adminAdd.png",width: 65,height: 65,),
                                    Spacer(flex: 1,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        GestureDetector(
                                            child: Text("לא",textDirection: TextDirection.rtl,style: assistantStyle(Colors.white, 20),),
                                        onTap: (){
                                              Navigator.pop(context);
                                        },),

                                        GestureDetector(
                                            child: Text("כן",textDirection: TextDirection.rtl,style: assistantStyle(Colors.white, 20),),
                                        onTap: () async {
                                              setState(() {
                                                AllUsers.pickedUser!.trainer = true;

                                              });

                                              await DataBaseService.makeAdmin(AllUsers.pickedUser!.email);
                                              Navigator.pop(context);
                                        },)
                                      ],
                                    ),
                                    SizedBox(height: 40,),
                                  ],
                                ),
                              ),
                            )
                        );
                      });
                },
                child: Container(

                  width: size.width * 0.28,
                  height: size.height * 0.13,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: greyClr,
                    border: Border.all(color: Colors.grey[800]! , width: 0.5),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/adminAdd.png",width: 55,height: 55,),
                      Text("הפוך למאמן",style: assistantStyle(Colors.grey[600]!, 18),),
                    ],


                  ),
                ),
              ),
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: (){
                  Navigator.push(context, CustomPageRoute(child: BuildPlan(refresh: refresh,)));
                },
                child: Container(

                  width: size.width * 0.28,
                  height: size.height * 0.13,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: greyClr,
                    border: Border.all(color: Colors.grey[800]! , width: 0.5),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/addPlan.png",width: 50,height: 50,),
                      SizedBox(height: 5,),
                      Container
                        (width: size.width * 0.25,
                          child: Text("הוספת תוכנית",style: assistantStyle(Colors.grey[600]!, 18),textAlign: TextAlign.center,)),
                    ],


                  ),
                ),
              ),
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: (){
                  Navigator.push(context, CustomPageRoute(child: AdminPlans()));
                },
                child: Container(

                  width: size.width * 0.28,
                  height: size.height * 0.13,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: greyClr,
                    border: Border.all(color: Colors.grey[800]! , width: 0.5),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/plans.png",width: 55,height: 55,),
                      Text("תוכניות אימון",style: assistantStyle(Colors.grey[600]!, 18),),
                    ],


                  ),
                ),
              ),
            ),


          ],
        ),


      ],

    );
  }
}

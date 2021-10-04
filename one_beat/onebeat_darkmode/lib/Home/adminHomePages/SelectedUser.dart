



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onebeat_darkmode/DataBase/User/GymHeroUser.dart';
import 'package:onebeat_darkmode/Design/Animation/PageTransition.dart';
import 'package:onebeat_darkmode/Design/ColorsPallete/Pallete.dart';
import 'package:onebeat_darkmode/Design/TextStyle/TextStyle.dart';
import 'package:onebeat_darkmode/Home/HomePages/Plans.dart';
import 'package:onebeat_darkmode/Home/adminHomePages/AdminMeasure.dart';
import 'package:onebeat_darkmode/Home/adminHomePages/allUsers.dart';

import 'MemberShip.dart';

class SelectedUser extends StatefulWidget {
  const SelectedUser({Key? key}) : super(key: key);

  @override
  _SelectedUserState createState() => _SelectedUserState();
}

class _SelectedUserState extends State<SelectedUser> {
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

                  Navigator.push(context, CustomPageRoute(child: AdminMeasure()));
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

            Container(width: size.width * 0.28,
              height: size.height * 0.13,),
            Container(width: size.width * 0.28,
              height: size.height * 0.13,),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: (){
                  Navigator.push(context, CustomPageRoute(child: Plans()));
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

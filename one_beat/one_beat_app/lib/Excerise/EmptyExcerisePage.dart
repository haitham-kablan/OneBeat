
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:one_beat_app/LoginPage/FinalLoginPage.dart';
import 'package:one_beat_app/colors/colors.dart';
import 'package:one_beat_app/users/current_user.dart';

class EmptyExcerisePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("שלום לך," , textDirection: TextDirection.rtl,style: TextStyle(color: Colors.black,fontSize: 45,fontWeight: FontWeight.bold),),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(current_user.name , textDirection: TextDirection.rtl,style: TextStyle(color: Color(0xff9F9E9E),fontSize: 35),),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Center(child: Image.asset('assets/MainLogo.png',width: 270,height: 270,)),
          Center(child: Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Text("עדיין אין לך תוכנית אימון, דבר עם המנהל או צור אחת בעצמך!" , textDirection: TextDirection.rtl,textAlign: TextAlign.center,style: TextStyle(color: Colors.grey[900],fontSize: 20),),
          )),
          SizedBox(height: 30,),
          Center(
            child:InkWell(
              onTap: (){
              },
              child: Material(
                elevation: 10.0,
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: greyButtonBg,
                    ),
                    borderRadius: BorderRadius.circular(30),
                    color: greyButtonBg,
                  ),
                  width: size.width * 0.7,
                  height: size.height * 0.06,
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('יצירת תוכנית אימון' ,textDirection: TextDirection.rtl,
                        style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
              ),
            ) ,
          ),
        ],
      ),
    );
  }
}

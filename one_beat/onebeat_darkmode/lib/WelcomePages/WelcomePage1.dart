import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onebeat_darkmode/Design/Accesories/Dots.dart';
import 'package:onebeat_darkmode/Design/Animation/PageTransition.dart';
import 'package:onebeat_darkmode/Design/Button/ButtonStyle.dart';
import 'package:onebeat_darkmode/Design/ColorsPallete/Pallete.dart';
import 'package:onebeat_darkmode/Design/TextStyle/TextStyle.dart';
import 'package:onebeat_darkmode/WelcomePages/WelcomePage2.dart';



class WelcomePage1 extends StatelessWidget {
  const WelcomePage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: backGroundClr,
        body: Column(
          children: [
            SizedBox(height: size.height * 0.05,),
            Text("שלב 1 מתוך 3", style: pageHeader(20),),
            SizedBox(height: size.height * 0.05,),
            Container(
              margin: EdgeInsets.only(left: 15),
                child: Center(child: Image.asset("assets/welcomePage1.png",width: 250,height: 250,))),
            SizedBox(height: size.height * 0.08,),
            Text("ברוכים הבאים", style: pageSecondHeader(20)),
            Text("Gym Hero Fitness Application", style: pageSecondHeader(20)),
            SizedBox(height: size.height * 0.035,),
            Center(
              child: Container(
                  width: size.width * 0.8,
                  child: Text("תוכניות אימון עוזרות לך לשפר את הכוח, המראה ומעודדות לאופן חיים בריא",
                      textDirection: TextDirection.rtl,
                      style:explaintion(17),
                      textAlign: TextAlign.center,)),
            ),
            Spacer(flex: 1,),
            button(greenClr , "התחל עכשיו" , Colors.white , BorderRadius.circular(30),size.width * 0.8,size.height * 0.06,(){
              Navigator.push(
                context,
                CustomPageRoute(child: WelcomePage2()),
              );
            }),
            SizedBox(height: size.height * 0.05,),
            Dots(0),
            SizedBox(height: size.height * 0.05,),
          ],
        ),
      ),
    );
  }
}

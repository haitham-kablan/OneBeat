
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:one_beat_app/colors/colors.dart';

class FinalLoginPage extends StatefulWidget {
  @override
  _FinalLoginPageState createState() => _FinalLoginPageState();
}

class _FinalLoginPageState extends State<FinalLoginPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            color: backGround,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 30,),
                Center(child: MainLogo()),
                SizedBox(height: 20,),
                Center(child: Heading()),
                SizedBox(height: 60,),
                Center(child: LogInButton()),
                SizedBox(height: 20,),
                Center(child: ReigesterButton()),
              ],
            ),
        ),
      ),
    );
  }
}


class MainLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/MainLogo.png');
  }
}


class Heading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("ONE BEAT",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold , fontStyle: FontStyle.italic,fontSize: 45),),
        Text("מעדון הכושר בקצב שלך!",
          textDirection: TextDirection.rtl,
          style: TextStyle(color: secondHeading ,fontSize: 17, fontStyle: FontStyle.italic),),
      ],
    );
  }
}


class LogInButton extends StatefulWidget {

  @override
  _LogInButtonState createState() => _LogInButtonState();
}

class _LogInButtonState extends State<LogInButton> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
      elevation: 10.0,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: greyButtonBg,
          ),
          borderRadius: BorderRadius.circular(10),
          color: Colors.transparent,
        ),
        width: size.width * 0.7,
        height: size.height * 0.06,
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('כניסה' ,textDirection: TextDirection.rtl,
                 style: TextStyle(color: greyButtonBg,fontSize: 20,fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }
}

class ReigesterButton extends StatefulWidget {
  @override
  _ReigesterButtonState createState() => _ReigesterButtonState();
}

class _ReigesterButtonState extends State<ReigesterButton> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
      elevation: 10.0,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: greyButtonBg,
          ),
          borderRadius: BorderRadius.circular(10),
          color: greyButtonBg,
        ),
        width: size.width * 0.7,
        height: size.height * 0.06,
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('הרשמה' ,textDirection: TextDirection.rtl,
              style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }
}



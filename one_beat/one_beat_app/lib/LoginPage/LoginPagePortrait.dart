
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:one_beat_app/colors/colors.dart';
import 'package:one_beat_app/reigester/regiesterPortrait.dart';
import 'package:one_beat_app/tools/text_feild.dart';
import 'package:one_beat_app/users/current_user.dart';


class LoginPagePortrait extends StatefulWidget {
  @override
  _LoginPagePortraitState createState() => _LoginPagePortraitState();
}

class _LoginPagePortraitState extends State<LoginPagePortrait> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.black,Colors.black
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              SizedBox(height: 50,),
              Center(child: Text("ONE BEAT" , style: TextStyle(color: Colors.white , fontSize: 50,fontStyle: FontStyle.italic),)),
              Center(child: Text("מעדון הכושר בקצב שלך" ,
                style: TextStyle(color: Color(0xffC1C1C1) , fontSize: 18,fontStyle: FontStyle.italic),
                textAlign: TextAlign.center,)
              ),
              Image(image : AssetImage("assets/login_page_bg.png")),
              Center(
                child: Material(
                  elevation: 10.0,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    //color: current_color.color.text,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.red,
                    ),
                    width: size.width * 0.65,
                    height: size.height * 0.06,
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.facebook_outlined,color: Colors.white,),
                        SizedBox(width: 10,),
                        Text('Sign in with Google' , style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                ),
              ),
              Center(
                child: Material(
                  elevation: 10.0,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    //color: current_color.color.text,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.red,
                    ),
                    width: size.width * 0.65,
                    height: size.height * 0.06,
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.facebook_outlined,color: Colors.white,),
                        SizedBox(width: 10,),
                        Text('Sign in with Google' , style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                ),
              ),
              Center(
                child: Material(
                  elevation: 10.0,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    //color: current_color.color.text,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.red,
                    ),
                    width: size.width * 0.65,
                    height: size.height * 0.06,
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.facebook_outlined,color: Colors.white,),
                        SizedBox(width: 10,),
                        Text('Sign in with Google' , style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                ),
              ),
            ],

          ),

        ),
      ),
    );
  }
}

class LoginPageProtrait2 extends StatefulWidget {
  @override
  _LoginPageProtrait2State createState() => _LoginPageProtrait2State();
}

class _LoginPageProtrait2State extends State<LoginPageProtrait2> {

  final TextEditingController email_Controler = TextEditingController();
  final TextEditingController pw_Controler = TextEditingController();
  final _formkey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffFCFCFC),
        body: Column(
          children: [
            SizedBox(height: 30,),
            Image(image : AssetImage("assets/adham_lgo.png")),
            SizedBox(height: 20,),
            Align(
              alignment: Alignment.centerRight,
              child: Material(
                elevation: 10.0,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),topLeft: Radius.circular(10)),
                child: Container(
                  //color: current_color.color.text,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),topLeft: Radius.circular(10)),
                    color: Color(0xff99C01B),
                  ),
                  width: size.width * 0.7,
                  height: size.height * 0.08,
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 20,),
                      Icon(Icons.facebook_outlined,color: Colors.white,),
                      Spacer(flex: 1,),
                      Text('ברוכים הבאים' , style: TextStyle(color: Colors.white,fontSize: 20,fontStyle: FontStyle.italic),),
                      SizedBox(width: 20,),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Material(
                elevation: 10,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      Text_Feild(email_Controler,(val) => isEmail(val) ? null : "נא הזן כתובת מייל חוקית",Icon(Icons.email,color: Colors.blue,),"דואר אלקטרוני",false),
                      SizedBox(height: 20,),
                      Text_Feild(email_Controler,(val) => isEmail(val) ? null : "נא הזן כתובת מייל חוקית",Icon(Icons.email,color: Colors.blue,),"דואר אלקטרוני",false),

                    ],
                  ),
                ),

              ),
            ),

          ],
        ),
      ),
    );
  }
}


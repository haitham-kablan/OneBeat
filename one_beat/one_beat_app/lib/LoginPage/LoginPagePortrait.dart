
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:one_beat_app/colors/colors.dart';


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
            main_bg_color,gradient_bg_second_color
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

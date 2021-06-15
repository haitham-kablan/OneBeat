


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:one_beat_app/HomePage/HomePagePortrait.dart';
import 'package:one_beat_app/colors/colors_pallete.dart';
import 'package:one_beat_app/db_service/Authentication.dart';
import 'package:one_beat_app/db_service/dataBaseService.dart';
import 'package:one_beat_app/reigester/regiesterPortrait.dart';
import 'package:one_beat_app/tools/text_feild.dart';
import 'package:one_beat_app/users/current_user.dart';
import 'package:provider/provider.dart';

class WelcomePagePortrait extends StatefulWidget {
  @override
  _WelcomePagePortraitState createState() => _WelcomePagePortraitState();
}

class _WelcomePagePortraitState extends State<WelcomePagePortrait> {

  final TextEditingController email_Controler = TextEditingController();
  final TextEditingController pw_Controler = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final ReigesterProvider = Provider.of<Authentication>(context);
    Size size = MediaQuery.of(context).size;
    return  Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/Welcome_Page_Portrait.png'),
              fit: BoxFit.fill,
            )
        ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Form(
              key: _formkey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/logo_without_pic.png' ,width: 250,height: 100,),
                      SizedBox(height: 15,),
                      Material(
                        color: Colors.transparent,
                        child: ReigesterProvider.errorMessage.isEmpty ? SizedBox(height: 30,) :
                        Center(
                          child: Column(
                            children: [
                              SizedBox(height: 15,),
                              Container(
                                decoration: BoxDecoration(
                                  color: current_color.color.title_heading,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                width: size.width * 0.8,
                                child: Row(
                                  children: [
                                    IconButton(onPressed: (){
                                      ReigesterProvider.set_ErrorMessage("");
                                    }, icon: Icon(Icons.close) , color: Colors.black,),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(width: size.width * 0.6,child: Text(ReigesterProvider.errorMessage , style: TextStyle(color: Colors.black),textDirection: TextDirection.rtl,)),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 15,),
                            ],
                          ),
                        ),
                      ),
                      Text_Feild(email_Controler,(val) => isEmail(val) ? null : "נא הזן כתובת מייל חוקית",Icon(Icons.email,color: current_color.color.title_heading,),"דואר אלקטרוני",false),
                      SizedBox(height: 10,),
                      Text_Feild(pw_Controler,(val) => val.isNotEmpty ? null : "הסיסמה חייבת לפחות להיות 6 תווים",Icon(Icons.vpn_key,color: current_color.color.title_heading,),"סיסמה",true),
                      SizedBox(height: 20,),
                      Center(
                        child:  ReigesterProvider.isLoading ? SpinKitCircle(color: current_color.color.title_heading,) : Material(
                          elevation: 10.0,
                          borderRadius: BorderRadius.circular(10),
                          child: InkWell(
                            onTap: () async {
                              if(_formkey.currentState!.validate()){
                                User? user = await ReigesterProvider.Login(email_Controler.text, pw_Controler.text);
                                current_user = await DataBaseService.getUserByEmail(email_Controler.text);
                                // if(user != null) {
                                //   Navigator.pushAndRemoveUntil(context,
                                //       MaterialPageRoute(builder: (context) =>
                                //           HomePageProtrait()), (
                                //           route) => false);
                                // }
                              }
                            },
                            child:  Container(
                              //color: current_color.color.text,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: current_color.color.title_heading,
                              ),
                              width: size.width * 0.65,
                              height: size.height * 0.06,
                              child:Center(child: Text('כניסה' , style: TextStyle(color: current_color.color.background_color,fontSize: 17,fontWeight: FontWeight.bold),),),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Center(
                        child: RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(text: 'עדיין אין לך משתמש? ',
                                style: TextStyle(color: Colors.grey[400]),),
                              TextSpan(
                                  text: 'לחץ כאן להירשם',
                                  style: TextStyle(color: current_color.color.title_heading , fontWeight: FontWeight.bold),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) =>
                                            ChangeNotifierProvider(
                                                create: (context) => Authentication(),
                                                child: ReigesterPagePortrait2()
                                            )
                                        ),
                                      );
                                    }),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(height: 1,width: 50,color: Colors.grey[400],),
                          SizedBox(width: 10,),
                          Text("OR",style: TextStyle(color: current_color.color.title_heading , fontSize: 12,decoration: TextDecoration.none),),
                          SizedBox(width: 10,),
                          Container(height: 1,width: 50,color: Colors.grey[400],),
                        ],
                      ),
                      SizedBox(height: 20,),
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
                      SizedBox(height: 20,),
                      Center(
                        child: Material(
                          elevation: 10.0,
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            //color: current_color.color.text,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blue,
                            ),
                            width: size.width * 0.65,
                            height: size.height * 0.06,
                            child:  Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.facebook_outlined,color: Colors.white,),
                                SizedBox(width: 10,),
                                Text('Sign in with Facebook' , style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 40,),
                    ],
                  ),
                ),

            ),
          ),


      );

  }
}


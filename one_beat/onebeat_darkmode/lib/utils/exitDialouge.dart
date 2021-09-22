import 'package:flutter/material.dart';
import 'package:onebeat_darkmode/DataBase/Authentication/Authentication.dart';
import 'package:onebeat_darkmode/Design/Animation/PageTransition.dart';
import 'package:onebeat_darkmode/Design/ColorsPallete/Pallete.dart';
import 'package:onebeat_darkmode/Design/TextStyle/TextStyle.dart';
import 'package:onebeat_darkmode/LoginPage/LoginPage.dart';


ExitDialouge(context,Size size){
  return showDialog(
      builder: (BuildContext context){
        return
          Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SingleChildScrollView(
                child: Container(
                  height: 200,
                  width: 300,
                  decoration: BoxDecoration(
                      color: greyClr,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 24,),
                      Material(
                          color:Colors.transparent,child: Text("האם אתה בטוח \nשרוצה לצאת?",textAlign: TextAlign.center,textDirection: TextDirection.rtl,style: assistantStyle(Colors.white, 25),)),
                      SizedBox(height: 8,),
                      SizedBox(height: 24,),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          RaisedButton(onPressed: (){
                            return Navigator.of(context).pop(true);
                          }, child: Text('לא'), color: Colors.white, textColor: greenClr,),
                          FlatButton(onPressed: ()async{
                            await AuthenticationService.Logout();
                            Navigator.pushAndRemoveUntil<dynamic>(
                              context,
                              CustomPageRoute(child: LogInPage()),
                                  (route) => false,//if you want to disable back feature set to false
                            );
                          }, child: Text('כן'),textColor: Colors.white,),
                          SizedBox(width: 8,),

                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
      }, context: context
  );
}

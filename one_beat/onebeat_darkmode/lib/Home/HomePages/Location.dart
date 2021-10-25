import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onebeat_darkmode/Design/ColorsPallete/Pallete.dart';
import 'package:onebeat_darkmode/Design/ShowError.dart';
import 'package:onebeat_darkmode/Design/TextStyle/TextStyle.dart';
import 'package:url_launcher/url_launcher.dart';

class LocationWaze extends StatelessWidget {
  const LocationWaze({Key? key}) : super(key: key);

  final String facebookLink = "https://www.facebook.com/gymhero17";
  final String instagramLink = "https://www.instagram.com/gym_hero_beit_jann/";

  openUrl(String url,context) async{
    if(await canLaunch(url)){
      await launch(url);
    }else{
      ShowError(context, "לא יכול לפתוח את הקשיור כרגע");
    }

  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: backGroundClr,
        appBar: AppBar(
          title: Text("הגעה ויצירת קשר",style: assistantStyle(Colors.white, 22),),
          backgroundColor: backGroundClr,
          centerTitle: true,
        ),
        body: Column(
          children: [
            SizedBox(height: 35,),
            Text("צוות GYM HERO",style: assistantStyle(Colors.white, 20),textDirection: TextDirection.rtl,),
           Text("נשמח לשרת אותכם",style: assistantStyle(greenClr, 40),),
            SizedBox(height: 60),
           Container(
               child: Image.asset("assets/logo.png",width: 170,height: 170,),
           margin: EdgeInsets.only(left: 20),),
           Spacer(flex: 2,),
           Material(
             color: Colors.transparent,
             child: InkWell(
               onTap: (){
                 launch("tel:046260464");
               },
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text("04-6260464",style: assistantStyle(Colors.white, 20),),
                   SizedBox(width: 20,),
                   Container(
                     width: 35,
                     height: 35,
                     decoration: BoxDecoration(
                       shape: BoxShape.circle,
                       color: greenClr
                     ),
                     child: Icon(Icons.call,color: Colors.white,size: 20,),
                   ),

                 ],
               ),
             ),
           ),
            SizedBox(height: 20),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: (){
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Waze:  \"חדר כושר GYM HERO\"",style: assistantStyle(Colors.white, 20),textDirection: TextDirection.rtl,),
                    SizedBox(width: 20,),
                    Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: greenClr
                      ),
                      child: Icon(Icons.location_on,color: Colors.white,size: 20,),
                    ),

                  ],
                ),
              ),
            ),
            Spacer(flex: 3,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: ()async{
                      await openUrl(instagramLink, context);
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/insta.png"),fit: BoxFit.fill
                        )
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 35,),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: ()async{
                      await openUrl(facebookLink, context);
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/facebook.png"),fit: BoxFit.fill
                          )
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 100,),
          ],
        ),
      ),
    );
  }
}

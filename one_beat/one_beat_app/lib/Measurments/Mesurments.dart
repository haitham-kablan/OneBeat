

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:one_beat_app/colors/colors.dart';
import 'package:one_beat_app/users/current_user.dart';

class Mesurments extends StatefulWidget {
  @override
  _MesurmentsState createState() => _MesurmentsState();
}

class _MesurmentsState extends State<Mesurments> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backGround,
        body: Column(
          children: [
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("שלום לך," , textDirection: TextDirection.rtl,style: TextStyle(color: Colors.black,fontSize: 45,fontWeight: FontWeight.bold),),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(current_user.name , textDirection: TextDirection.rtl,style: TextStyle(color: Color(0xff9F9E9E),fontSize: 35),),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Center(child:Icon(Icons.accessibility,color: darkGreen,size: 35,),),
            Center(child: Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Text("חשוב מאוד לעקוב אחרי המדידות כדי לבדוק את ההתקדמות שלך!" , textDirection: TextDirection.rtl,textAlign: TextAlign.center,style: TextStyle(color: Colors.grey[600],fontSize: 17),),
            )),
            SizedBox(height: 35,),
            SingleMeasure(text: "משקל (ק\"ג): "),
            SizedBox(height: 15,),
            SingleMeasure(text: "גובה (ס\"ם): "),
            SizedBox(height: 15,),
            SingleMeasure(text: "אחוז שומן (%): "),
            SizedBox(height: 15,),
            SingleMeasure(text: "היקף בטן (ס\"ם): "),
            SizedBox(height: 15,),
            SingleMeasure(text: "היקף יד (ס\"ם): "),
            SizedBox(height: 15,),
          ],
        ),
      ),
    );
  }
}

class SingleMeasure extends StatelessWidget {
  final String text;

  const SingleMeasure({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.only(left: 30,right: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Container(
              color: Color(0xffE8E5E5),
              height: 30,
              width: 80,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10,bottom: 5),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
          Spacer(flex: 1,),
          Text(text, textDirection: TextDirection.rtl,style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
        ],
      ),
    );
  }
}

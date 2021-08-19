

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onebeat_darkmode/ColorsPallete/ColorsPallete.dart';
import 'package:onebeat_darkmode/Design/DayBox.dart';

class BuildProgram extends StatefulWidget {
  const BuildProgram({Key? key}) : super(key: key);

  @override
  _BuildProgramState createState() => _BuildProgramState();
}

class _BuildProgramState extends State<BuildProgram> {

  List<DayBox> list = [
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundClr,
      body: Column(
        children: [
          SizedBox(height: 25,),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios_sharp , color: Colors.white,),
                onPressed: (){
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          Image.asset('assets/schedule.png'),
          SizedBox(height: 10,),
          Text(
            "אזור בניית תוכנית אישית",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 35 , right: 50),
            child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: "שם התוכנית:",
                  hintStyle: TextStyle(
                      color: navBarItemsClr
                  ),hintTextDirection: TextDirection.rtl
              ),
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                color: Colors.white,
              ),
              keyboardType: TextInputType.multiline,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35 , right: 50),
            child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: "מספר ימים בשבוע:",
                  hintStyle: TextStyle(
                      color: navBarItemsClr
                  ),hintTextDirection: TextDirection.rtl
              ),
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                color: Colors.white,
              ),
                keyboardType: TextInputType.number,
            ),
          ),
          SizedBox(height: 15,),
          Padding(padding: EdgeInsets.only(left: 50 , right: 50)),

        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat ,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: greenClr,
          icon: Icon(Icons.add , color: Colors.white,),
          onPressed: (){}, label: Text("הוספה")),
    );
  }
}

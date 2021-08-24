

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onebeat_darkmode/ColorsPallete/ColorsPallete.dart';
import 'package:onebeat_darkmode/DataBase/Program.dart';
import 'package:onebeat_darkmode/DataBase/ProgramDay.dart';
import 'package:onebeat_darkmode/DataBase/Services/DataBaseService.dart';
import 'package:onebeat_darkmode/DataBase/SpecicficExcerise.dart';
import 'package:onebeat_darkmode/Design/Button.dart';
import 'package:onebeat_darkmode/Design/DayBox.dart';
import 'package:onebeat_darkmode/Design/ShowError.dart';
import 'package:onebeat_darkmode/Users/CurrentUser.dart';

import 'addTrainDay.dart';


Program program = Program();

class BuildProgram extends StatefulWidget {
  const BuildProgram({Key? key}) : super(key: key);

  @override
  _BuildProgramState createState() => _BuildProgramState();
}

class _BuildProgramState extends State<BuildProgram> {

  List<Widget> list = [];

  int counter = 1;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: backGroundClr,
        body: Column(
          children: [
            SizedBox(height: 10,),
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
            SizedBox(height: 10,),
            Text(
              "לחץ על כפתור הוספה כדי להוסיף ימים חדשים",
              style: TextStyle(
                  color: navBarItemsClr,
                  fontSize: 12
              ),
            ),
            SizedBox(height: 35,),
            Padding(
              padding: const EdgeInsets.only(left: 40,right: 40),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Wrap(
                  children: list,
                ),
              ),
            ),
            SizedBox(height: 20,),
            counter > 1 ? isLoading ? CircularProgressIndicator(
              backgroundColor: navBarClr,
              color: greenClr,
            ) : button(greenClr,
                "הוספת תוכנית",
                Colors.white,
                BorderRadius.circular(20),
                size.width * 0.5, size.width * 0.085, ()async{
                  setState(() {
                    isLoading = true;
                  });
                  await DataBaseService.addProgramToDb(program, currentUser!);
                  program = Program();
                  setState(() {
                    isLoading = false;
                  });
                  Navigator.pop(context);
                }
                ) : Container(),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat ,
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: greenClr,
            icon: Icon(Icons.add , color: Colors.white,),
            onPressed: (){
            if(counter > 7){
              ShowError(context, "יש רק 7 ימים בשבוע!");
              return;
            }
            addTrainDay(context, size, counter,addDay);
            }, label: Text("הוספת יום אימון")),
      ),
    );
  }

  void addDay(){
    setState(() {
      list.add(
        Container(
          margin: EdgeInsets.all(8),
          child: DayBox(
              day: "יום  " + counter.toString() , isPressed: false
          ),
        ),
      );
      counter++;

    });
  }
}


import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onebeat_darkmode/Design/Animation/PageTransition.dart';
import 'package:onebeat_darkmode/Design/ColorsPallete/Pallete.dart';
import 'package:onebeat_darkmode/Design/TextStyle/TextStyle.dart';
import 'package:onebeat_darkmode/utils/Porgram.dart';


class SpecificPlan extends StatefulWidget {
  const SpecificPlan({Key? key, required this.name, required this.program}) : super(key: key);
  final String name;
  final Program program;

  @override
  _SpecificPlanState createState() => _SpecificPlanState(name,program);
}

class _SpecificPlanState extends State<SpecificPlan> {



  int counter  = 1;
  final Program program;
  final String name;

  _SpecificPlanState(this.name, this.program);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: backGroundClr,
        appBar: AppBar(
          elevation: 10,
          backgroundColor: greenClr,
          title: Text(
             name +  "  "+"תוכנית"  , style: whiteText(20),
          ),
          centerTitle: true,
          leading:  IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.chevron_left , color: Colors.white, size: 35,)),
        ),
        body: Column(
          children: [
            SizedBox(height: 20,),
            Row(
              children: [
                Spacer(flex: 1,),
                counter != 1 ? IconButton(
                  icon: Icon(Icons.arrow_left , color: emptyDotClr,size: 27,),
                  onPressed: (){
                    setState(() {
                      counter--;
                    });

                  },
                ) : Container(width: 25,height: 25,),
                SizedBox(width: 25,),
                Text(counter.toString()+"   " + "אימון" , style: GoogleFonts.assistant(
                  color: greenClr,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),),
                SizedBox(width: 25,),
                counter == program.days.length ? Container(width: 25,height: 25,) : IconButton(
                  icon: Icon(Icons.arrow_right , color: emptyDotClr,size: 27,),
                  onPressed: (){
                    setState(() {
                      counter++;
                    });
                  },
                ),
                Spacer(flex: 1,),
              ],
            ),
            SizedBox(height: 30,),
            Container(
              height: size.height * 0.65,
              width: size.width * 0.8,
              child: ListView(
                children: program.days[counter-1].excerises,
              ),
            ),
          ],
        ),

      ),
    );
  }
}

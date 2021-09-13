
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onebeat_darkmode/DataBase/Services/DataBaseService.dart';
import 'package:onebeat_darkmode/Design/ColorsPallete/Pallete.dart';
import 'package:onebeat_darkmode/Design/TextStyle/TextStyle.dart';
import 'package:onebeat_darkmode/utils/GeneralExcerises.dart';

class ExceriseTile extends StatelessWidget {

  final String name;
  final String category;
  final int sets;
  final String reps;
  final String machineNumber;




  const ExceriseTile({Key? key,  required this.name,  required this.sets,  required this.reps,  required this.machineNumber, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
    //  margin: EdgeInsets.only(left: 10,right: 10),
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Color(0xff272727),
        borderRadius: BorderRadius.circular(5),
        ),
      child: Column(
        children: [
          SizedBox(height: 15,),
          Row(
            children: [
              Spacer(flex: 1,),

              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(height: 7,),
                  Text(
                      category , style: TextStyle(color: greenClr,fontSize: 20,fontWeight: FontWeight.bold)
                  ),
                  Container(
                    width: 200,
                    child: Text(
                        name , style: TextStyle(color: emptyDotClr,fontSize: 20),textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 25,),

              Image.asset(GeneralExcerise(stringCategoryToCategory(category),name).getCategoryPic(),height: 70,width: 70,),
              SizedBox(width: 25,),

            ],
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              Spacer(flex: 1,),
              Text("סטים: " + sets.toString(),style: GoogleFonts.assistant(
                  color: emptyDotClr,
                  fontSize: 17,
              ),textDirection: TextDirection.rtl,),
              SizedBox(width: 30,),
            ],
          ),
          SizedBox(height: 5,),
          Row(

            children: [
              SizedBox(width: 30,),
              machineNumber == "-1" ? Container() : Text("מכונה מספר: " + machineNumber,style: GoogleFonts.assistant(
                color: emptyDotClr,
                fontSize: 17,
              ), textDirection: TextDirection.rtl,),
              Spacer(flex: 1,),
              Text("חזרות: " + reps.toString(),style: GoogleFonts.assistant(
                color: emptyDotClr,
                fontSize: 17,
              ),textDirection: TextDirection.rtl,),

              SizedBox(width: 30,),
            ],
          ),
          SizedBox(height: 20,),
        ],
      ),
    );
  }
}
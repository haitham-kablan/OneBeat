
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onebeat_darkmode/Design/ColorsPallete/Pallete.dart';
import 'package:onebeat_darkmode/Design/TextStyle/TextStyle.dart';

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
      decoration: BoxDecoration(
        color: backGroundClr,
        border: Border(
          bottom: BorderSide(width: 0.4,color: emptyDotClr),
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 10,),
          Align(
              alignment: Alignment.topRight,
              child: RichText(
                textAlign: TextAlign.right,
                text: TextSpan(
                  children: [
                    TextSpan(text: category  + "  -  ", style: TextStyle(color: greenClr,fontSize: 20,fontWeight: FontWeight.bold)),
                    TextSpan(text: name , style: TextStyle(color: emptyDotClr,fontSize: 20)),
                  ]
                ),

              ),

          ),
          SizedBox(height: 10,),
          Align(
              alignment: Alignment.topRight,
              child: Text("סטים: " + sets.toString(),style: GoogleFonts.assistant(
                color: emptyDotClr,
                fontSize: 17,
              ),textDirection: TextDirection.rtl,)
          ),
          SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              machineNumber == "-1" ? Container() : Text("מכונה מספר: " + machineNumber,style: GoogleFonts.assistant(
                color: emptyDotClr,
                fontSize: 17,
              ),textDirection: TextDirection.rtl,),
              Text("חזרות: " + reps.toString(),style: GoogleFonts.assistant(
                color: emptyDotClr,
                fontSize: 17,
              ),textDirection: TextDirection.rtl,),

            ],
          ),
          SizedBox(height: 10,),
        ],
      ),
    );
  }
}

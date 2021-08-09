
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onebeat_darkmode/ColorsPallete/ColorsPallete.dart';
import 'package:onebeat_darkmode/Constants.dart';

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
            bottom: BorderSide(width: 0.3,color: listTileColor),
          ),
      ),
      child: Column(
        children: [
          SizedBox(height: 10,),
          Align(
            alignment: Alignment.topRight,
              child: Text(category + " - " + name,style: TextStyle(color: greenClr,fontSize: 17),textAlign: TextAlign.right,textDirection: TextDirection.rtl,)
          ),
          SizedBox(height: 10,),
          Align(
              alignment: Alignment.topRight,
              child: Text("סטים: " + sets.toString(),style: TextStyle(color: listTileColor,fontSize: 13),textDirection: TextDirection.rtl,)
          ),
          SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              machineNumber == "-1" ? Container() : Text("מכונה מספר: " + machineNumber,style: TextStyle(color: listTileColor,fontSize: 13),textDirection: TextDirection.rtl,),
              Text("חזרות: " + reps.toString(),style: TextStyle(color: listTileColor,fontSize: 13),textDirection: TextDirection.rtl,),

            ],
          ),
          SizedBox(height: 10,),
        ],
      ),
    );
  }
}

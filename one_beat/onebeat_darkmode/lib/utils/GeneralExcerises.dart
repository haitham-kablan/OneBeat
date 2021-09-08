

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onebeat_darkmode/Design/ColorsPallete/Pallete.dart';
import 'package:onebeat_darkmode/Design/TextStyle/TextStyle.dart';

enum Category {CHEST , SHOULDERS,ABS,BACK,BICEPS,TRICEPS,LEGS}

class GeneralExcerise{

  final Category category;
  final String name;

  GeneralExcerise(this.category, this.name);
  
  Widget getTile(){
    return Container(
      decoration: BoxDecoration(
        color: backGroundClr,
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Text(name , style: explaintion(18),textDirection: TextDirection.rtl,),),
          SizedBox(height: 35,),
        ],
      ),
    );
  }
  
  String getCategoryPic(){
    switch (category){

      case Category.CHEST:
        return "assets/chest.png";

      case Category.SHOULDERS:
        return "assets/shoulders.png";

      case Category.ABS:
        return "assets/abs.png";

      case Category.BACK:
        return "assets/back.png";

      case Category.BICEPS:
        return "assets/biceps.png";

      case Category.TRICEPS:
        return "assets/triceps.png";

      case Category.LEGS:
        return "assets/legs.png";
    }
  }
}

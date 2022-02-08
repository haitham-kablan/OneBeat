

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onebeat_darkmode/DataBase/Services/DataBaseService.dart';
import 'package:onebeat_darkmode/Design/ColorsPallete/Pallete.dart';
import 'package:onebeat_darkmode/Design/TextStyle/TextStyle.dart';

enum Category {CHEST , SHOULDERS,ABS,BACK,BICEPS,TRICEPS,LEGS,CARDIO}

class GeneralExcerise{

  final Category category;
  final String name;
  final String? link;

  GeneralExcerise(this.category, this.name,this.link);

  StatefulWidget getSpecifcTile(){
    return getSpecificExceriseTile(name:name);
  }
  Widget getTile(){
    return Container(
      decoration: BoxDecoration(
        color: backGroundClr,
        border: Border.all(color:Colors.grey[800]! , width: 0.25),

      ),
      child: Column(
        children: [
          SizedBox(height: 16,),
          Align(
            alignment: Alignment.center,
            child: Text( name , style: assistantStyle(Colors.grey[600]!,20),textDirection: TextDirection.rtl,textAlign: TextAlign.center,),),
          SizedBox(height: 16,),
        ],
      ),
    );
  }

  Widget getPicTile(onTap){
    return Material(
      color: greyClr,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 5.0),
          decoration: BoxDecoration(
              border: Border.all(color:Colors.grey[800]! , width: 0.25),
              color: greyClr,
              borderRadius: BorderRadius.circular(10)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 10,),
              Image.asset(getCategoryPic() , width: 100,height: 90,),
              SizedBox(height: 10,),
              Text(category.toString().substring(9) , style: greenText(15),),
              SizedBox(height: 10,),
            ],
          ),
        ),
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
      case Category.CARDIO:
        return "assets/cardio.png";

    }
  }

}

class getSpecificExceriseTile extends StatefulWidget {
  final String name;
  const getSpecificExceriseTile({Key? key, required this.name}) : super(key: key);

  @override
  _getSpecificExceriseTileState createState() => _getSpecificExceriseTileState(name);
}

class _getSpecificExceriseTileState extends State<getSpecificExceriseTile> {
  final String name;
  bool isChecked = false;
  int sets = 4;
  int reps = 10;

  _getSpecificExceriseTileState(this.name);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          decoration: BoxDecoration(
            color: backGroundClr,
            border: Border(
              bottom: BorderSide(width: 1,color: SeperatorClr),
            ),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith((states) => getColor(states)),
                    onChanged: (bool? value) {
                      if(value!){
                        //onPress(SpecificExcerise(GeneralExcerise(data["name"], data["category"]), sets, reps));
                      }else{
                        //remove(SpecificExcerise(GeneralExcerise(data["name"], data["category"]), sets, reps));
                      }
                      setState(() {
                        isChecked = value;
                      });
                    },
                    value: isChecked,

                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Container(
                      width: size.width * 0.6,
                      child: Align(
                        alignment: Alignment.topRight,
                        child: RichText(
                          text: TextSpan(
                            children:  <TextSpan>[
                              //TextSpan(text: data["category"],style: TextStyle(color: greenClr,fontSize: 14)),
                              TextSpan(text: name,style: explaintion(20))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15,),
              isChecked ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text("סטים" ,style: TextStyle(color: navBarItemsClr,fontSize: 11)),
                      Row(
                        children: [
                          IconButton(onPressed: (){
                            setState(() {
                              if(sets -1 < 0){
                                sets = 0;
                              }else{
                                sets--;
                              }
                            });
                            //onPress(SpecificExcerise(GeneralExcerise(data["name"], data["category"]), sets, reps));


                          },
                              icon: Icon(Icons.arrow_downward_sharp , color:navBarItemsClr,size: 15,)),
                          Text(sets.toString(),style: TextStyle(color: greenClr,fontSize: 13)),
                          IconButton(onPressed: (){
                            setState(() {
                              sets++;
                            });
                            //onPress(SpecificExcerise(GeneralExcerise(data["name"], data["category"]), sets, reps));
                          },
                              icon: Icon(Icons.arrow_upward_sharp , color: navBarItemsClr,size: 15,)),
                        ],
                      ),

                    ],
                  ),
                  Column(
                    children: [
                      Text("חזרות" ,style: TextStyle(color: navBarItemsClr,fontSize: 11)),
                      Row(
                        children: [
                          IconButton(onPressed: (){
                            setState(() {
                              if(reps -1 < 0){
                                reps = 0;
                              }else{
                                reps--;
                              }
                            });
                           // onPress(SpecificExcerise(GeneralExcerise(data["name"], data["category"]), sets, reps));
                          },
                              icon: Icon(Icons.arrow_downward_sharp , color:navBarItemsClr,size: 15,)),
                          Text(reps.toString(),style: TextStyle(color: greenClr,fontSize: 13)),
                          IconButton(onPressed: (){
                            setState(() {
                              reps++;
                            });
                            //onPress(SpecificExcerise(GeneralExcerise(data["name"], data["category"]), sets, reps));
                          },
                              icon: Icon(Icons.arrow_upward_sharp , color: navBarItemsClr,size: 15,)),
                        ],
                      ),
                    ],
                  ),
                ],
              ) : Container(),
              SizedBox(height: isChecked ? 15 : 0,),
            ],
          ),
        ),
      ),
    );
  }

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return greenClr;
  }
}


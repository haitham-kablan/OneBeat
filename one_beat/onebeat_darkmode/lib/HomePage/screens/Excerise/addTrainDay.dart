
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onebeat_darkmode/ColorsPallete/ColorsPallete.dart';
import 'package:onebeat_darkmode/DataBase/GenerealExcerise.dart';
import 'package:onebeat_darkmode/DataBase/ProgramDay.dart';
import 'package:onebeat_darkmode/DataBase/SpecicficExcerise.dart';
import 'package:onebeat_darkmode/Design/Button.dart';
import 'package:onebeat_darkmode/Design/ShowError.dart';
import 'package:onebeat_darkmode/Design/WrappedMultipleChip.dart';
import 'package:onebeat_darkmode/Design/WrappedSingleChip.dart';
import 'package:onebeat_darkmode/HomePage/screens/Excerise/BuildProgram.dart';

addTrainDay(context , Size size , int day , onDone){
return showDialog(
  context: context,
  builder: (BuildContext context) =>
      Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Material(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: backGroundClr,
              ),
              height: size.height * 0.8,
              width: size.width * 0.85,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconButton(onPressed: (){
                            Navigator.pop(context);
                          }, icon: Icon(Icons.clear,color: Colors.white,)),
                        ),
                      ),
                      Spacer(flex: 1,),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RichText(
                            text: TextSpan(
                              children:  <TextSpan>[
                                TextSpan(text: 'יום ', style: TextStyle(color: offWhite,fontSize: 35,fontStyle: FontStyle.italic)),
                                TextSpan(text: day.toString(),style: TextStyle(color: greenClr,fontSize: 35,fontStyle: FontStyle.italic),),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10,),

                    ],
                  ),
                  SizedBox(height: 10,),
                  CategoriesExceriseList(onDone: onDone,),


                ],
              ),
              )
          )
        )
      )
                // mainAxisAlignment: MainAxisAlignment.cent
    );
}


class CategoriesExceriseList extends StatefulWidget {
  final onDone;
  const CategoriesExceriseList({Key? key, this.onDone}) : super(key: key);

  @override
  _CategoriesExceriseListState createState() => _CategoriesExceriseListState(onDone);
}

class _CategoriesExceriseListState extends State<CategoriesExceriseList> {

  List<String> categories = ["חזה" , "גב" , "כתפיים" , "יד קדמית" , "יד אחורית" , "רגליים", "בטן"];
  List<SpecificExcerise> answer = [];

  int index = 0;
  final onDone;
  late Size size;

  _CategoriesExceriseListState(this.onDone);



  @override
  Widget build(BuildContext context) {

    List<SpecificExceriseList> excList = [
    SpecificExceriseList( selected: ["חזה"],onPress: addToList,remove: removeFromList,),
    SpecificExceriseList( selected: ["גב"],onPress: addToList,remove: removeFromList,),
    SpecificExceriseList( selected: ["כתפיים"],onPress: addToList,remove: removeFromList,),
    SpecificExceriseList( selected: ["יד קדמית"],onPress: addToList,remove: removeFromList,),
    SpecificExceriseList( selected: ["יד אחורית"],onPress: addToList,remove: removeFromList,),
    SpecificExceriseList( selected: ["רגליים"],onPress: addToList,remove: removeFromList,),
    SpecificExceriseList( selected: ["בטן"],onPress: addToList,remove: removeFromList,)];

    Size size = MediaQuery.of(context).size;
    return  Column(
      children: [
        SingleSelectChip(categories,
          onSelectionChanged: (selectedList) {
            setState(() {
              print(selectedList);
              if(selectedList.isEmpty){
                index = 0;
              }else{
                for ( int i=0 ; i< excList.length ; i++){
                  if(excList[i].selected[0] == selectedList[0]){
                    index = i;
                  }
                }

              }
            });

          },
        ),
        SizedBox(height: 10,),
        IndexedStack(
          children: excList,
          index: index,
        ),
        SizedBox(height: 30,),
        button(greenClr, "סיום", Colors.white, BorderRadius.circular(20), size.width * 0.3, size.height * 0.03, (){
          if(answer.isEmpty){
            ShowError(context, "תוכנית אימון ריקה");
          }else{
            print(answer);
            onDone();
            program.program.add(ProgramDay(answer));
            Navigator.pop(context);

          }

        }),
      ],


    );
  }

  void removeFromList(SpecificExcerise specificExcerise){
    this.answer.removeWhere((element) => element.generalExcerise.category == specificExcerise.generalExcerise.category
        && element.generalExcerise.name == specificExcerise.generalExcerise.name);
  }
  void addToList(SpecificExcerise specificExcerise){
    bool found = false;
    this.answer.forEach((element) {
      if(element.generalExcerise.category == specificExcerise.generalExcerise.category
      && element.generalExcerise.name == specificExcerise.generalExcerise.name){
        found = true;
        element.sets = specificExcerise.sets;
        element.reps = specificExcerise.reps;
      }
    });
    if(!found){
      this.answer.add(specificExcerise);
    }
  }
}

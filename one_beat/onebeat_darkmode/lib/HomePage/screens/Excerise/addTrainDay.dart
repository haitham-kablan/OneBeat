
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onebeat_darkmode/ColorsPallete/ColorsPallete.dart';
import 'package:onebeat_darkmode/DataBase/GenerealExcerise.dart';
import 'package:onebeat_darkmode/DataBase/ProgramDay.dart';
import 'package:onebeat_darkmode/DataBase/Services/DataBaseService.dart';
import 'package:onebeat_darkmode/DataBase/SpecicficExcerise.dart';
import 'package:onebeat_darkmode/Design/Button.dart';
import 'package:onebeat_darkmode/Design/ShowError.dart';
import 'package:onebeat_darkmode/Design/TextStyle/TextStyle.dart';
import 'package:onebeat_darkmode/Design/WrappedMultipleChip.dart';
import 'package:onebeat_darkmode/Design/WrappedSingleChip.dart';
import 'package:onebeat_darkmode/HomePage/screens/Excerise/BuildProgram.dart';
import 'package:onebeat_darkmode/utils/GeneralExcerises.dart' as utils;


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

  List<String> muscles = ["חזה","גב","יד קדמית","יד אחורית","כתפיים","בטן","רגליים"];
  utils.Category current = utils.Category.CHEST;
  CarouselController carouselController = CarouselController();

  void changeIndex(int index, CarouselPageChangedReason reason){

    setState(() {
      index = index;
      print(index);
    });

  }



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
        Row(
          mainAxisAlignment:MainAxisAlignment.spaceBetween,
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
            Padding(
              padding: const EdgeInsets.only(right:15),
              child: Image.asset(utils.GeneralExcerise(stringCategoryToCategory(muscles[index]),"").getCategoryPic() , width: 80,height: 70,),
            )
          ],
        ),

        Padding(
          padding: const EdgeInsets.only(left: 10,right: 10 , top: 15),
          child: SingleSelectChip(categories,
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
        ),

        SizedBox(height: 25,),
        IndexedStack(
          children: excList,
          index: index,
        ),
        SizedBox(height: 45,),
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

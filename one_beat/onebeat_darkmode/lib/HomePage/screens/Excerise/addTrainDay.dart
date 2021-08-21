
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onebeat_darkmode/ColorsPallete/ColorsPallete.dart';
import 'package:onebeat_darkmode/DataBase/SpecicficExcerise.dart';
import 'package:onebeat_darkmode/Design/Button.dart';
import 'package:onebeat_darkmode/Design/WrappedMultipleChip.dart';

addTrainDay(context , Size size , int day){
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
                  CategoriesExceriseList(),


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
  const CategoriesExceriseList({Key? key}) : super(key: key);

  @override
  _CategoriesExceriseListState createState() => _CategoriesExceriseListState();
}

class _CategoriesExceriseListState extends State<CategoriesExceriseList> {

  List<String> categories = ["חזה" , "גב" , "כתפיים" , "יד קדמית" , "יד אחורית" , "רגליים", "בטן"];
  List<String> selected = ["חזה" , "גב" , "כתפיים" , "יד קדמית" , "יד אחורית" , "רגליים", "בטן"];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Column(
      children: [
        MultiSelectChip(categories,
          onSelectionChanged: (selectedList) {
            setState(() {
              print(selectedList);
              if(selectedList.isEmpty){
                selected = ["חזה"];
              }else{
                selected = selectedList;
              }
            });
          },
        ),
        SizedBox(height: 10,),
        SpecificExceriseList(size: size.height * 0.45, selected: selected,),
        SizedBox(height: 30,),
        button(greenClr, "סיום", Colors.white, BorderRadius.circular(20), size.width * 0.3, size.height * 0.03, (){
          Navigator.pop(context);
        }),
      ],


    );
  }
}

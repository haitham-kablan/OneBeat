//

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onebeat_darkmode/ColorsPallete/ColorsPallete.dart' as old;
import 'package:onebeat_darkmode/DataBase/Services/DataBaseService.dart';
import 'package:onebeat_darkmode/DataBase/SpecicficExcerise.dart' as oldSpecifc;

import 'package:onebeat_darkmode/Design/Button.dart';
import 'package:onebeat_darkmode/Design/ColorsPallete/Pallete.dart';
import 'package:onebeat_darkmode/Design/TextStyle/TextStyle.dart';
import 'package:onebeat_darkmode/HomePage/screens/Excerise/addTrainDay.dart' as x;
import 'package:onebeat_darkmode/HomePage/screens/Excerise/addTrainDay.dart';
import 'package:onebeat_darkmode/utils/ExceriseTile.dart' as newExc;
import 'package:onebeat_darkmode/utils/GeneralExcerises.dart';
import 'package:onebeat_darkmode/utils/ProgramDay.dart';
import 'package:onebeat_darkmode/utils/SpecificExcerise.dart';


class addTrainDay extends StatefulWidget {
  const addTrainDay({Key? key, required this.day}) : super(key: key);
  final int day;

  @override
  _addTrainDayState createState() => _addTrainDayState(day);


  static List<ProgramDay> getProgram(int stopIndex){

    List<ProgramDay> l = [];
    return _addTrainDayState.selectedExcerises.sublist(0,stopIndex).map(
            (e) => ProgramDay(
                e.map((e) => newExc.ExceriseTile(name: e.name, sets: e.sets, reps: e.reps.toString(), machineNumber: "-1", category: categoryToString(e.category))
                ).toList())
    ).toList();
  }
  static bool isEmpty(int stopIndex){
    return _addTrainDayState.selectedExcerises.sublist(0,stopIndex).any((element) => element.isEmpty);
  }
  static void clear(){
    _addTrainDayState.selectedExcerises.forEach((element) {element.clear();});
  }
}

class _addTrainDayState extends State<addTrainDay> {

  final int day;

  List<String> muscles = ["חזה","גב","יד קדמית","יד אחורית","כתפיים","בטן","רגליים"];
  List<ExcerisesWidget> widgets = [];

  _addTrainDayState(this.day){
    widgets = [
      ExcerisesWidget(category: Category.CHEST,day: day -1),
      ExcerisesWidget(category: Category.BACK,day: day -1),
      ExcerisesWidget(category: Category.BICEPS,day: day-1),
      ExcerisesWidget(category: Category.TRICEPS,day: day-1),
      ExcerisesWidget(category: Category.SHOULDERS,day: day-1),
      ExcerisesWidget(category: Category.ABS,day: day-1),
      ExcerisesWidget(category: Category.LEGS,day: day-1),
    ];
  }

  static List<List<SpecificExcerise>> selectedExcerises = [
    [],[],[],[],[],[],[]
  ];


  static void onAdd(SpecificExcerise specificExcerise,int i){

    selectedExcerises[i].removeWhere((element) => element.name  == specificExcerise.name && element.category  == specificExcerise.category);
    selectedExcerises[i].add(specificExcerise);
  }

  static void onRemove(SpecificExcerise specificExcerise,int i){
    selectedExcerises[i].removeWhere((element) => element.name == specificExcerise.name&& element.category  == specificExcerise.category);
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: backGroundClr,
        appBar: AppBar(

          elevation: 3,
          backgroundColor: greyClr,
          title: Text(
            "בניית תוכנית" , style: whiteText(20),
          ),
          centerTitle: true,
          leading:  IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.chevron_left , color: Colors.white, size: 35,)),
        ),
        body: Stack(
          children: [
            Column(
              children: [
                SizedBox(height: 20,),
                Center(child: Text(day.toString() + "  " +"אימון " , style: assistantStyle(Colors.white, 25),)),
                SizedBox(height: size.height * 0.05,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GeneralExcerise(Category.CHEST,"").getPicTile((){
                      ExceriseListDialouge(context, size, widgets[0]);
                    }),
                    GeneralExcerise(Category.BACK,"").getPicTile((){
                      ExceriseListDialouge(context, size, widgets[1]);
                    }),
                    GeneralExcerise(Category.SHOULDERS,"").getPicTile((){
                      ExceriseListDialouge(context, size, widgets[4]);
                    }),

                  ],
                ),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GeneralExcerise(Category.LEGS,"").getPicTile((){
                      ExceriseListDialouge(context, size, widgets[6]);
                    }),
                    GeneralExcerise(Category.BICEPS,"").getPicTile((){
                      ExceriseListDialouge(context, size, widgets[2]);
                    }),
                    GeneralExcerise(Category.TRICEPS,"").getPicTile((){
                      ExceriseListDialouge(context, size, widgets[3]);
                    }),
                  ],
                ),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GeneralExcerise(Category.ABS,"").getPicTile((){
                      ExceriseListDialouge(context, size, widgets[5]);
                    }),
                  ],
                ),
                Spacer(flex: 1,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class ExceriseTile extends StatefulWidget {
  ExceriseTile({Key? key, required this.name, required this.category , required this.isChecked , required this.sets,required this.reps, required this.day}) : super(key: key);
  final String name;
  final String category;
  bool isChecked;
  int sets ;
  int reps;
  final int day;

  @override
  _ExceriseTileState createState() => _ExceriseTileState(name,category ,isChecked , this.sets,this.reps ,day);
}

class _ExceriseTileState extends State<ExceriseTile> {
  final int day;
  bool isChecked ;
  final String category;
  int sets ;
  int reps;
  final String name;

  _ExceriseTileState(this.name, this.category , this.isChecked , this.sets , this.reps, this.day);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          width: size.width * 0.8,
          decoration: BoxDecoration(
            color: backGroundClr,
            border: Border(
              bottom: BorderSide(width: 0.1,color: navBarItemsClr),
            ),
          ),
          child: Column(
            children: [

              Row(
                children: [
                  Spacer(flex: 1,),
                  Container(
                    width: size.width * 0.5,
                    child: Text(name,style: GoogleFonts.assistant(
                      color: Colors.grey[600]!,
                      fontSize: 17,
                    ),textAlign: TextAlign.right,),
                  ),
                  SizedBox(width: 20,),
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith((states) => getColor(states)),
                    onChanged: (bool? value) {
                      if(value!){
                        _addTrainDayState.onAdd(SpecificExcerise(sets, reps, stringCategoryToCategoryModified(category), name),day);
                      }else{
                        _addTrainDayState.onRemove(SpecificExcerise(sets, reps, stringCategoryToCategoryModified(category), name),day);

                      }
                      setState(() {
                        isChecked = value;
                      });
                    },
                    value: isChecked,

                  ),

                ],
              ),
              SizedBox(height: 15,),
              isChecked ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text("סטים" ,style: TextStyle(color: offWhite,fontSize: 11)),
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
                            _addTrainDayState.onAdd(SpecificExcerise(sets, reps, stringCategoryToCategoryModified(category), name),day);


                          },
                              icon: Icon(Icons.arrow_downward_sharp , color:navBarItemsClr,size: 15,)),
                          Text(sets.toString(),style: TextStyle(color: greenClr,fontSize: 13)),
                          IconButton(onPressed: (){
                            setState(() {
                              sets++;
                            });
                            _addTrainDayState.onAdd(SpecificExcerise(sets, reps, stringCategoryToCategoryModified(category), name),day);
                          },
                              icon: Icon(Icons.arrow_upward_sharp , color: navBarItemsClr,size: 15,)),
                        ],
                      ),

                    ],
                  ),
                  Column(
                    children: [
                      Text("חזרות" ,style: TextStyle(color: offWhite,fontSize: 11)),
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
                            _addTrainDayState.onAdd(SpecificExcerise(sets, reps, stringCategoryToCategoryModified(category), name),day);
                          },
                              icon: Icon(Icons.arrow_downward_sharp , color:navBarItemsClr,size: 15,)),
                          Text(reps.toString(),style: TextStyle(color: greenClr,fontSize: 13)),
                          IconButton(onPressed: (){
                            setState(() {
                              reps++;
                            });
                            _addTrainDayState.onAdd(SpecificExcerise(sets, reps, stringCategoryToCategoryModified(category), name),day);
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

class ExcerisesWidget extends StatefulWidget {
  ExcerisesWidget({Key? key,  required this.category, required this.day}) : super(key: key);
  final Category category;
  final int day;


  @override
  _ExcerisesWidgetState createState() => _ExcerisesWidgetState(category,day);
}

class _ExcerisesWidgetState extends State<ExcerisesWidget> {
  final int day;
  final Category category;

  _ExcerisesWidgetState( this.category, this.day );
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(onPressed: (){
                    Navigator.pop(context);
                  }, icon: Icon(Icons.clear,color: Colors.white,)),
                ),
                Spacer(flex: 1,),
              ],
            ),
            Image.asset(GeneralExcerise(category,"").getCategoryPic() , height: 100,width: 100,),
            SizedBox(height: 10,),
            Material(
              color: Colors.transparent,
              child: Text(category.toString().substring(9),style: greenText(20),),
            ),
            SizedBox(height: 20,),
            Column(
                children: DataBaseService.systemExcerises[category]!.map((e) => ExceriseTile(name: e.name, category: category.toString() , isChecked: _addTrainDayState.selectedExcerises[day].any((element) => element.name == e.name),sets:_addTrainDayState.selectedExcerises[day].any((element) => element.name == e.name) ? _addTrainDayState.selectedExcerises[day].where((element) => element.name == e.name).first.sets : 4 , reps:_addTrainDayState.selectedExcerises[day].any((element) => element.name == e.name) ?_addTrainDayState.selectedExcerises[day].where((element) => element.name == e.name).first.reps : 10 ,day: day,)).toList(),
              ),
          ],
        ),
      ),
    );
  }
}

ExceriseListDialouge(context , Size size,widget){

  return showDialog(
    builder: (BuildContext context){
      return
          Center(
            child: Container(
              decoration: BoxDecoration(
                color: backGroundClr,
                borderRadius: BorderRadius.circular(7),
              ),
              width: size.width * 0.85,
              height: size.height * 0.85,
              child: widget,
            ),
      );
    }, context: context
  );

}



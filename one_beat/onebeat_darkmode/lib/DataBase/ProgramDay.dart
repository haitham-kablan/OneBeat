


import 'package:onebeat_darkmode/DataBase/SpecicficExcerise.dart';

class ProgramDay{

  final List<SpecificExcerise> programDay;

  ProgramDay(this.programDay);


  Map<String,dynamic> toMap(){

    Map<String,dynamic> map = Map();
    int counter =1;
    programDay.forEach((element) {
      map["excerise - " + counter.toString()] = element.generalExcerise.category + "-" + element.generalExcerise.name + "-" + element.sets.toString()
              + "-" +element.reps.toString();
      counter++;
    });
    return map;
  }

}
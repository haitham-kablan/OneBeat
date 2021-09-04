

import 'package:onebeat_darkmode/DataBase/Services/DataBaseService.dart';
import 'package:onebeat_darkmode/Users/CurrentUser.dart';

import 'ProgramDay.dart';

class Program{

 List<ProgramDay> program = [];


 Future toMap(int programNum) async{
  Map<String,dynamic> Docmap = Map();
  Docmap["programName"] = programNum.toString();
  await DataBaseService.usersCollection.doc(currentUser!.email)
  .collection(DataBaseService.personalPrograms).doc("PROGRAM " + programNum.toString()).set(Docmap);
  int counter =1;
   program.forEach((element) {
    element.programDay.forEach((element) {
     Map<String,dynamic> map = Map();


     map["excerise"] = element.generalExcerise.category + "-" + element.generalExcerise.name + "-" + element.sets.toString()
         + "-" +element.reps.toString();
     DataBaseService.usersCollection.doc(currentUser!.email)
         .collection(DataBaseService.personalPrograms).doc("PROGRAM " + programNum.toString())
         .collection("DAY " + counter.toString()).doc().set(map);
    });
   counter++;
  });

 }
}

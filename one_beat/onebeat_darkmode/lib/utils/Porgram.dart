



import 'package:onebeat_darkmode/DataBase/Services/DataBaseService.dart';
import 'package:onebeat_darkmode/DataBase/User/GymHeroUser.dart';
import 'package:onebeat_darkmode/utils/ProgramDay.dart';

class Program{

  final String name;
  List<ProgramDay> days;

  Program(this.name , this.days);

  Future toMap() async{

    Map<String,dynamic> Docmap = Map();
    int size = 0;
    for(int i=0 ; i<days.length ; i++){
      for(int j =0; j < days[i].excerises.length ; j++){
        Docmap["exc"+size.toString()] = i.toString() + "-"+days[i].excerises[j].category +"-"+ days[i].excerises[j].name +"-"+days[i].excerises[j].sets.toString() + "-" + days[i].excerises[j].reps;
        size++;
      }
    }
    Docmap["size"] = size;
    Docmap["days"] = days.length;

    await DataBaseService.usersCollection.doc(gymHeroUser.email)
    .collection(DataBaseService.personalPrograms).doc(name).set(Docmap);
  }

}
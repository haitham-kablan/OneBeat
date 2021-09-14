
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:onebeat_darkmode/utils/Porgram.dart';
import 'package:onebeat_darkmode/utils/ProgramDay.dart';

import '../../Constants.dart';




late GymHeroUser gymHeroUser;

class GymHeroUser{

  final String name;
  final String email;
  double age;
  bool gender;
  double height;

  double weight;
  double bodyfat;
  double stomachSize;
  double armSize;
  bool fristTime;

  double goalweight;
  double goalbodyfat;
  double goalstomachSize;
  double goalarmSize;

  List<Program> programs = [];

  GymHeroUser(this.name,this.email, this.age, this.gender , this.height , this.weight,this.bodyfat,this.stomachSize,this.armSize,
      this.goalweight,this.goalbodyfat,this.goalstomachSize,this.goalarmSize , this.fristTime);

  static GymHeroUser mapToUser(DocumentSnapshot documentSnapshot){

    Map<String,dynamic> data = documentSnapshot.data() as Map<String,dynamic>;

    return GymHeroUser(data["name"], data["email"], data["age"], data["gender"],
        data["height"], data["weight"], data["bodyfat"], data["stomachSize"], data["armSize"],
        data["goalweight"], data["goalbodyfat"], data["goalstomachSize"], data["goalarmSize"],data["fristTime"]);
  }

  static GymHeroUser emptyUser(String name , String email){

    GymHeroUser gymHeroUser =  GymHeroUser(name, email,20, true, 170, 25,
        3, 15, 10, 25, 3,
        15, 10,true);

    gymHeroUser.programs.add(Program("A" ,
        List.of({ProgramDay(A)})));

    gymHeroUser.programs.add(Program("AB" ,
        List.of({ProgramDay(ABA1) , ProgramDay(ABB1) , ProgramDay(ABA2),ProgramDay(ABB2)})));

    gymHeroUser.programs.add(Program("ABC" ,
        List.of({ProgramDay(ABCA) , ProgramDay(ABCB) , ProgramDay(ABCC)})));
    return gymHeroUser;
  }

  Map<String,dynamic> toMap(){

    Map<String,dynamic> map = Map();
    map["name"] = this.name;
    map["email"] = this.email;
    map["fristTime"] = this.fristTime;
    map["age"] = this.age;
    map["height"] = this.height;
    map["weight"] = this.weight;
    map["armSize"] = this.armSize;
    map["stomachSize"] = this.stomachSize;
    map["bodyfat"] = this.bodyfat;
    map["gender"] = this.gender;
    map["goalarmSize"] = this.goalarmSize;
    map["goalbodyfat"] = this.goalbodyfat;
    map["goalweight"] = this.goalweight;
    map["goalstomachSize"] = this.goalstomachSize;

    return map;

  }


}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:onebeat_darkmode/utils/MemberShipClass.dart';
import 'package:onebeat_darkmode/utils/Porgram.dart';
import 'package:onebeat_darkmode/utils/ProgramDay.dart';
import 'package:onebeat_darkmode/utils/SpecificMeasure.dart';

import '../../Constants.dart';




late GymHeroUser gymHeroUser;

class GymHeroUser{

  final String name;
  final String email;


  bool trainer;
  double age;
  bool gender;
  String height;

  bool fristTime;

  List<Program> programs = [];
  List<SpecificMeasure> Measures = [];
  List<SpecificMeasure> goalMeasures = [];

  static MemberShipClass userMemberShip = MemberShipClass("-", "-", "-", "-", "-", "-");

  GymHeroUser(this.name,this.email, this.age, this.gender , this.height ,
      this.fristTime , this.trainer);

  static GymHeroUser mapToUser(DocumentSnapshot documentSnapshot){

    Map<String,dynamic> data = documentSnapshot.data() as Map<String,dynamic>;

    return GymHeroUser(data["name"], data["email"], data["age"], data["gender"],
        data["height"],
        data["fristTime"],data["trainer"]);
  }

  static GymHeroUser emptyUser(String name , String email){

    GymHeroUser gymHeroUser =  GymHeroUser(name, email,20, true, "170",true,false);

    gymHeroUser.programs.add(Program("ירידה באחוז שומן" ,
        List.of({ProgramDay(WeightReduce)})));

    gymHeroUser.programs.add(Program("עלייה במסת שריר" ,
        List.of({ProgramDay(gainMuscle)})));


    return gymHeroUser;
  }

  Map<String,dynamic> toMap(){

    Map<String,dynamic> map = Map();
    map["name"] = this.name;
    map["email"] = this.email;
    map["fristTime"] = this.fristTime;
    map["age"] = this.age;
    map["height"] = this.height;
    map["gender"] = this.gender;
    map["trainer"] = this.trainer;

    return map;

  }


}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:onebeat_darkmode/utils/Porgram.dart';




late GymHeroUser gymHeroUser;

class GymHeroUser{

  final String name;
  final String email;
  int age;
  bool gender;
  int height;

  int weight;
  int bodyfat;
  int stomachSize;
  int armSize;
  bool fristTime;

  int goalweight;
  int goalbodyfat;
  int goalstomachSize;
  int goalarmSize;

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
    return GymHeroUser(name, email,20, true, 170, 25,
        3, 15, 10, 25, 3,
        15, 10,true);
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
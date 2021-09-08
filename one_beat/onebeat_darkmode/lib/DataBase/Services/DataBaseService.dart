
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:onebeat_darkmode/DataBase/FaqClass.dart';
import 'package:onebeat_darkmode/DataBase/GenerealExcerise.dart';
import 'package:onebeat_darkmode/Users/TrainerUser.dart';
import 'package:onebeat_darkmode/Users/User.dart';
import 'package:onebeat_darkmode/utils/GeneralExcerises.dart' as utils;

import '../Program.dart';

class DataBaseService{

  static CollectionReference usersCollection = FirebaseFirestore.instance.collection("USERS");
  static CollectionReference faqCollection = FirebaseFirestore.instance.collection("FAQ");
  static CollectionReference exceriseCollection = FirebaseFirestore.instance.collection("EXCERISES");

  static String personalPrograms = "PERSONAL_PROGRAMS";

  static Map<utils.Category , List<utils.GeneralExcerise>> systemExcerises= Map();


  static Future getSystemExcerises()async{

    systemExcerises[utils.Category.CHEST] = [];
    systemExcerises[utils.Category.SHOULDERS] = [];
    systemExcerises[utils.Category.BACK] = [];
    systemExcerises[utils.Category.BICEPS] = [];
    systemExcerises[utils.Category.TRICEPS] = [];
    systemExcerises[utils.Category.ABS] = [];
    systemExcerises[utils.Category.LEGS] = [];

    await exceriseCollection.get().then(
            (value) {
              value.docs.forEach((element) {
                systemExcerises[stringCategoryToCategory(((element.data()!) as Map<String,dynamic>)["category"])]!
                    .add(utils.GeneralExcerise(
                    stringCategoryToCategory(((element.data()!) as Map<String,dynamic>)["category"]),
                    ((element.data()!) as Map<String,dynamic>)["name"]));
              });
            });
  }

  static Future addFaqToDb(Faq faq)async{
    await faqCollection.doc().set(faq.toMap());
  }

  static Future addProgramToDb(Program program , BasicUser basicUser)async{

    int counter = 0;

    await usersCollection.doc(basicUser.email).get().
    then((value) => counter = ((value.data()!) as Map<String,dynamic>)["size"] + 1);
    print(counter);

    Map<String,dynamic> map = Map();
    map["size"] = counter;
    await usersCollection.doc(basicUser.email).update(map);


    await program.toMap(counter);

  }

  static Future addGeneralExceriseToDb(GeneralExcerise generalExcerise)async{
    await exceriseCollection.doc().set(generalExcerise.toMap());
  }

  static Future addTrainerToDb(TrainerUser trainerUser)async{

    await usersCollection.doc(trainerUser.email).set(trainerToMap(trainerUser));

  }

  static Future<TrainerUser> getUser(String email)async{

    DocumentSnapshot documentSnapshot= await usersCollection.doc(email).get();
    return mapToUser(documentSnapshot);

  }

  static Future updateFeild(String email,String fname,dynamic fvalue)async{

    Map<String,dynamic> map = Map();
    map[fname] = fvalue;
    await usersCollection.doc(email).update(map);

  }

  static Future updateCurrentMeasures(double weight,double bf,double stomach,double hand,TrainerUser trainerUser)async{
    Map<String,dynamic> map = Map();
    map["bodyFatPercentage"] = bf;
    map["cmStomachSize"] = stomach;
    map["kgWeight"] = weight;
    map["cmArmSize"] = hand;

    trainerUser.bodyFatPercentage = bf;
    trainerUser.cmStomachSize = stomach;
    trainerUser.kgWeight = weight;
    trainerUser.cmArmSize = hand;

    await usersCollection.doc(trainerUser.email).update(map);
  }

  static Future updateGoalMeasures(double weight,double bf,double stomach,double hand,TrainerUser trainerUser)async{
    Map<String,dynamic> map = Map();
    map["goalbodyFatPercentage"] = bf;
    map["goalcmStomachSize"] = stomach;
    map["goalkgWeight"] = weight;
    map["goalcmArmSize"] = hand;

    trainerUser.goalbodyFatPercentage = bf;
    trainerUser.goalcmStomachSize = stomach;
    trainerUser.goalkgWeight = weight;
    trainerUser.goalcmArmSize = hand;

    await usersCollection.doc(trainerUser.email).update(map);
  }




}

utils.Category stringCategoryToCategory(String category){

  if(category == "רגליים"){
    return utils.Category.LEGS;
  }

  if(category == "בטן"){
    return utils.Category.ABS;
  }
  if(category == "כתפיים"){
    return utils.Category.SHOULDERS;
  }
  if(category == "חזה"){
    return utils.Category.CHEST;
  }
  if(category == "גב"){
    return utils.Category.BACK;
  }
  if(category == "יד קדמית"){
    return utils.Category.BICEPS;
  }
  if(category == "יד אחורית"){
    return utils.Category.TRICEPS;
  }

  return utils.Category.TRICEPS;
}

TrainerUser mapToUser(DocumentSnapshot documentSnapshot){

  Map<String,dynamic> data = documentSnapshot.data() as Map<String,dynamic>;
  //todo late add coach
  return TrainerUser(data["name"], data["email"], stringToPriv(data["privillage"]),
      data["firstFaq"], data["firstMeasure"], data["firstExcerise"], data["kgWeight"], data["cmHeight"],
      data["cmStomachSize"], data["cmArmSize"], data["bodyFatPercentage"], data["goalkgWeight"],
      data["goalcmArmSize"], data["goalcmStomachSize"], data["goalcmHeight"], data["goalbodyFatPercentage"],data["size"]);


}
Map<String,dynamic> trainerToMap(TrainerUser trainerUser){

  Map<String,dynamic> map = Map();
  map["name"] = trainerUser.name;
  map["email"] = trainerUser.email;
  map["privillage"] = trainerUser.privillage.toString();
  map["cmArmSize"] = trainerUser.cmArmSize;
  map["goalbodyFatPercentage"] = trainerUser.goalbodyFatPercentage;
  map["goalcmHeight"] = trainerUser.goalcmHeight;
  map["goalcmStomachSize"] = trainerUser.goalcmStomachSize;
  map["goalcmArmSize"] = trainerUser.goalcmArmSize;
  map["goalkgWeight"] = trainerUser.goalkgWeight;
  map["bodyFatPercentage"] = trainerUser.bodyFatPercentage;
  map["cmStomachSize"] = trainerUser.cmStomachSize;
  map["cmHeight"] = trainerUser.cmHeight;
  map["kgWeight"] = trainerUser.kgWeight;
  map["firstExcerise"] = trainerUser.firstExcerise;
  map["firstMeasure"] = trainerUser.firstMeasure;
  map["firstFaq"] = trainerUser.firstFaq;
  map["size"] = 0;

  return map;
}

Privillage stringToPriv(String priv){

  if (priv == Privillage.TRAINER.toString()){
    return Privillage.TRAINER;
  }else{
    return Privillage.COACH;
  }
}
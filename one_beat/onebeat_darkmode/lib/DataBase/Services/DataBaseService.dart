
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:onebeat_darkmode/DataBase/FaqClass.dart';
import 'package:onebeat_darkmode/DataBase/GenerealExcerise.dart';
import 'package:onebeat_darkmode/Users/TrainerUser.dart';
import 'package:onebeat_darkmode/Users/User.dart';

import '../Program.dart';

class DataBaseService{

  static CollectionReference usersCollection = FirebaseFirestore.instance.collection("USERS");
  static CollectionReference faqCollection = FirebaseFirestore.instance.collection("FAQ");
  static CollectionReference exceriseCollection = FirebaseFirestore.instance.collection("EXCERISES");

  static String personalPrograms = "PERSONAL_PROGRAMS";


  static Future addFaqToDb(Faq faq)async{
    await faqCollection.doc().set(faq.toMap());
  }

  static Future addProgramToDb(Program program , BasicUser basicUser)async{

    int counter = 0;

    await usersCollection.doc(basicUser.email).collection(personalPrograms).doc("SIZE").get().
    then((value) => counter = value.data()!["size"] + 1);
    print(counter);

    Map<String,dynamic> map = Map();
    map["size"] = counter;
    await usersCollection.doc(basicUser.email).collection(personalPrograms).doc("SIZE").set(map);


    await program.toMap(counter);

  }

  static Future addGeneralExceriseToDb(GeneralExcerise generalExcerise)async{
    await exceriseCollection.doc().set(generalExcerise.toMap());
  }

  static Future addTrainerToDb(TrainerUser trainerUser)async{

    Map<String,dynamic> map = Map();
    map["size"] = 0;
    await usersCollection.doc(trainerUser.email).set(trainerToMap(trainerUser));
    await usersCollection.doc(trainerUser.email).collection(personalPrograms)
    .doc("SIZE").set(map);
  }

  static Future<BasicUser> getUser(String email)async{

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

BasicUser mapToUser(DocumentSnapshot documentSnapshot){

  Map<String,dynamic> data = documentSnapshot.data() as Map<String,dynamic>;
  //todo late add coach
  return TrainerUser(data["name"], data["email"], stringToPriv(data["privillage"]),
      data["firstFaq"], data["firstMeasure"], data["firstExcerise"], data["kgWeight"], data["cmHeight"],
      data["cmStomachSize"], data["cmArmSize"], data["bodyFatPercentage"], data["goalkgWeight"],
      data["goalcmArmSize"], data["goalcmStomachSize"], data["goalcmHeight"], data["goalbodyFatPercentage"]);


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

  return map;
}

Privillage stringToPriv(String priv){

  if (priv == Privillage.TRAINER.toString()){
    return Privillage.TRAINER;
  }else{
    return Privillage.COACH;
  }
}
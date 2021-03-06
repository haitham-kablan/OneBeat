
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onebeat_darkmode/ColorsPallete/ColorsPallete.dart';
import 'package:onebeat_darkmode/DataBase/GenerealExcerise.dart';
import 'package:onebeat_darkmode/DataBase/Program.dart';
import 'package:onebeat_darkmode/DataBase/User/GymHeroUser.dart';
import 'package:onebeat_darkmode/Design/TextStyle/TextStyle.dart';
import 'package:onebeat_darkmode/Users/TrainerUser.dart';
import 'package:onebeat_darkmode/Users/User.dart';
import 'package:onebeat_darkmode/utils/ExceriseTile.dart';
import 'package:onebeat_darkmode/utils/GeneralExcerises.dart' as utils;
import 'package:onebeat_darkmode/utils/MemberShip.dart';
import 'package:onebeat_darkmode/utils/Porgram.dart' as utils1;
import 'package:onebeat_darkmode/utils/ProgramDay.dart';
import 'package:onebeat_darkmode/utils/SpecificMeasure.dart';

import '../../Constants.dart';


class DataBaseService{

  static CollectionReference usersCollection = FirebaseFirestore.instance.collection("USERS");
  static CollectionReference faqCollection = FirebaseFirestore.instance.collection("FAQ");
  static CollectionReference exceriseCollection = FirebaseFirestore.instance.collection("EXCERISES");

  static String personalPrograms = "PERSONAL_PROGRAMS";
  static String measures = "MEASURES";
  static String goalMeasures = "GOALMEASURES";
  static String memberShip = "MEMBERSHIP";

  static Map<utils.Category , List<utils.GeneralExcerise>> systemExcerises= Map();
  static final Stream<QuerySnapshot> usersStream = usersCollection.snapshots();
  static final UsersCounter = StreamBuilder<QuerySnapshot>(
          stream: DataBaseService.usersStream,
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("0" , style: assistantStyle(Colors.white, 70),);
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(backgroundColor: navBarClr,color: Colors.white,);
          }

          return Text(snapshot.data!.docs.length.toString() , style: assistantStyle(Colors.white, 70),);
        },
  );

  //
  // static final UsersTable = StreamBuilder<QuerySnapshot>(
  //   stream: DataBaseService.usersStream,
  //   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
  //     if (snapshot.hasError) {
  //       return Container();
  //     }
  //
  //     if (snapshot.connectionState == ConnectionState.waiting) {
  //       return Container();
  //     }
  //     allUsers.clear();
  //     snapshot.data!.docs.forEach((element) { allUsers.add(GymHeroUser.mapToUser(element));});
  //     return Container();
  //   },
  // );

  static List<GymHeroUser> allUsers = [];


  static Future initDb()async{

   //await getSystemUsers();
    await getSystemExcerises();
  }
  static Future getSystemUsers() {

    allUsers.clear();

    return usersCollection.get().then(
            (value) async{
          value.docs.forEach((element) async {
            GymHeroUser gymHeroUser = GymHeroUser.mapToUser(element);

            await usersCollection.doc(gymHeroUser.email).collection(measures).orderBy("time",descending: true)
                .get().then((value) => value.docs.forEach((element) {
              gymHeroUser.Measures.add(SpecificMeasure.mapToSpecificMeasure(
                  element.data()["weight"], element.data()["arm"],
                  element.data()["stomach"], element.data()["bodyfat"],
                  element.data()["dateTime"]));
            }));

            await usersCollection.doc(gymHeroUser.email).collection(goalMeasures).orderBy("time",descending: true)
                .get().then((value) => value.docs.forEach((element) {
              print("xxxxxxxxxxxxxxxxxxx");
              gymHeroUser.goalMeasures.add(SpecificMeasure.mapToSpecificMeasure(
                  element.data()["weight"], element.data()["arm"],
                  element.data()["stomach"], element.data()["bodyfat"],
                  element.data()["dateTime"]));
            }));


            await usersCollection.doc(gymHeroUser.email).collection(personalPrograms)
                .get().then((value) => value.docs.forEach((element) {

              List<ProgramDay> l = [];

              int days = element.data()["days"];

              for(int i =0 ; i < days ; i++){
                l.add(ProgramDay([]));
              }

              int size = element.data()["size"];

              for(int i =0;i<size;i++){
                List<String> x = (element.data()["exc" + i.toString()] as String).split("-");
                print(x);
                int day = int.parse(x[0]);
                int sets = int.parse(x[3]);
                String reps = x[4];
                String name = x[2];
                String category = x[1];
                l[day].excerises.add(ExceriseTile(name: name, sets: sets, reps: reps, machineNumber: "-1", category: category));
              }

              gymHeroUser.programs.add(utils1.Program(element.id , l));
            }

            ));

            gymHeroUser.programs.add(utils1.Program("A" ,
                List.of({ProgramDay(A)})));

            gymHeroUser.programs.add(utils1.Program("AB" ,
                List.of({ProgramDay(ABA1) , ProgramDay(ABB1) , ProgramDay(ABA2),ProgramDay(ABB2)})));

            gymHeroUser.programs.add(utils1.Program("ABC" ,
                List.of({ProgramDay(ABCA) , ProgramDay(ABCB) , ProgramDay(ABCC)})));

            allUsers.add(gymHeroUser);
          });
        });

  }
  static Future makeAdmin(String email)async{
    Map<String,dynamic> map = Map();
    map["trainer"] = true;
    await usersCollection.doc(email).update(map);
  }
  static Future getSystemMeasures()async{
    print(allUsers.length);
    allUsers.forEach((user) async {
      await usersCollection.doc(user.email).collection(measures).orderBy("time",descending: true)
          .get().then((value) => value.docs.forEach((element) {
            user.Measures.add(SpecificMeasure.mapToSpecificMeasure(
                element.data()["weight"], element.data()["arm"],
                element.data()["stomach"], element.data()["bodyfat"],
                element.data()["dateTime"]));
      }));
    });

  }

  static Future getSystemGoalMeasures()async{

    allUsers.forEach((user) async {
      await usersCollection.doc(user.email).collection(goalMeasures).orderBy("time",descending: true)
          .get().then((value) => value.docs.forEach((element) {
            print("xxxxxxxxxxxxxxxxxxx");
        user.goalMeasures.add(SpecificMeasure.mapToSpecificMeasure(
            element.data()["weight"], element.data()["arm"],
            element.data()["stomach"], element.data()["bodyfat"],
            element.data()["dateTime"]));
      }));
    });

  }

  static Future addMemberShipForUser(String email , MemberShip memberShip) async{
    await usersCollection.doc(email).collection(DataBaseService.memberShip).doc().set(memberShip.toMap());
  }

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



  static Future addProgramToDb(utils1.Program program , String email)async{

    await program.toMap(email);

  }

  static Future addMeasureForUser(String email , SpecificMeasure specificMeasure)async{
    await usersCollection.doc(email).collection(measures).doc().set(specificMeasure.toMap());
  }

  static Future addGoalMeasureForUser(String email , SpecificMeasure specificMeasure)async{
    await usersCollection.doc(email).collection(goalMeasures).doc().set(specificMeasure.toMap());
  }
  static Future addGeneralExceriseToDb(GeneralExcerise generalExcerise)async{
    await exceriseCollection.doc().set(generalExcerise.toMap());
  }

  static Future addTrainerToDb(GymHeroUser gymHeroUser)async{

    await usersCollection.doc(gymHeroUser.email).set(gymHeroUser.toMap());

  }

  static Future updateUser(Map<String,dynamic> map) async{

    await usersCollection.doc(gymHeroUser.email).update(map);

  }

  static Future<GymHeroUser> getUser(String email)async{

    DocumentSnapshot documentSnapshot= await usersCollection.doc(email).get();
    GymHeroUser gymHeroUser = GymHeroUser.mapToUser(documentSnapshot);

    await usersCollection.doc(email).collection(measures).orderBy("time",descending: true).get()
    .then((value) => value.docs.forEach((element) {
      gymHeroUser.Measures.add(
          SpecificMeasure.mapToSpecificMeasure(
              element.data()["weight"], element.data()["arm"],
              element.data()["stomach"], element.data()["bodyfat"],
              element.data()["dateTime"]));
    }));

    await usersCollection.doc(email).collection(goalMeasures).orderBy("time",descending: true).get()
        .then((value) => value.docs.forEach((element) {
      gymHeroUser.goalMeasures.add(
          SpecificMeasure.mapToSpecificMeasure(
              element.data()["weight"], element.data()["arm"],
              element.data()["stomach"], element.data()["bodyfat"],
              element.data()["dateTime"]));
    }));


    await usersCollection.doc(email).collection(personalPrograms)
    .get().then((value) => value.docs.forEach((element) {

      List<ProgramDay> l = [];

      int days = element.data()["days"];

      for(int i =0 ; i < days ; i++){
        l.add(ProgramDay([]));
      }

      int size = element.data()["size"];

      for(int i =0;i<size;i++){
        List<String> x = (element.data()["exc" + i.toString()] as String).split("-");
        print(x);
        int day = int.parse(x[0]);
        int sets = int.parse(x[3]);
        String reps = x[4];
        String name = x[2];
        String category = x[1];
        l[day].excerises.add(ExceriseTile(name: name, sets: sets, reps: reps, machineNumber: "-1", category: category));
      }

      gymHeroUser.programs.add(utils1.Program(element.id , l));
    }));

    gymHeroUser.programs.add(utils1.Program("A" ,
        List.of({ProgramDay(A)})));

    gymHeroUser.programs.add(utils1.Program("AB" ,
        List.of({ProgramDay(ABA1) , ProgramDay(ABB1) , ProgramDay(ABA2),ProgramDay(ABB2)})));

    gymHeroUser.programs.add(utils1.Program("ABC" ,
        List.of({ProgramDay(ABCA) , ProgramDay(ABCB) , ProgramDay(ABCC)})));

    return gymHeroUser;

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

utils.Category stringCategoryToCategoryModified(String category){

  if(category == utils.Category.CHEST.toString()){
    return utils.Category.CHEST;
  }
  if(category == utils.Category.BACK.toString()){
    return utils.Category.BACK;
  }
  if(category == utils.Category.LEGS.toString()){
    return utils.Category.LEGS;
  }
  if(category == utils.Category.ABS.toString()){
    return utils.Category.ABS;
  }
  if(category == utils.Category.SHOULDERS.toString()){
    return utils.Category.SHOULDERS;
  }
  if(category == utils.Category.BICEPS.toString()){
    return utils.Category.BICEPS;
  }
  if(category == utils.Category.TRICEPS.toString()){
    return utils.Category.TRICEPS;
  }

  return utils.Category.BICEPS;

}
utils.Category stringCategoryToCategory(String category){

  if(category == "????????????"){
    return utils.Category.LEGS;
  }

  if(category == "??????"){
    return utils.Category.ABS;
  }
  if(category == "????????????"){
    return utils.Category.SHOULDERS;
  }
  if(category == "??????"){
    return utils.Category.CHEST;
  }
  if(category == "????"){
    return utils.Category.BACK;
  }
  if(category == "???? ??????????"){
    return utils.Category.BICEPS;
  }
  if(category == "???? ????????????"){
    return utils.Category.TRICEPS;
  }

  return utils.Category.TRICEPS;
}

String categoryToString(utils.Category category){

  switch(category){

    case utils.Category.CHEST:
      return "??????";

    case utils.Category.SHOULDERS:
      return "????????????";
    case utils.Category.ABS:
      return "??????";
    case utils.Category.BACK:
      return "????";
    case utils.Category.BICEPS:
      return "???? ??????????";
    case utils.Category.TRICEPS:
      return "???? ????????????";
    case utils.Category.LEGS:
      return "????????????";
  }
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
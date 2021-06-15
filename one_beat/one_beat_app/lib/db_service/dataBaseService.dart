


import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:one_beat_app/db_service/classes/Excercise.dart';
import 'package:one_beat_app/users/OB_USER.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'classes/FAQ.dart';


class DataBaseService{

  static final FirebaseFirestore firestore = FirebaseFirestore.instance;
  static final CollectionReference users_collection = firestore.collection('USERS');
  static final CollectionReference excerises_collection = firestore.collection('EXCERISES');
  static final CollectionReference faq_collection = firestore.collection('FAQ');
  static final String profile_path = "/profile/";



  static Future uploadPictureToStorage(PickedFile? image,String dir_path) async{

    if(image == null){
      return;
    }
    String file_name = dir_path + basename(image.path);
    Reference firebaseStorageRef = FirebaseStorage.instance.ref().child(file_name);
    await firebaseStorageRef.putFile(File(image.path));
    return file_name;


  }

  static Future<String> retreivePicture(String path) async{

    Reference firebaseStorageRef = FirebaseStorage.instance.ref().child(path);
    return await firebaseStorageRef.getDownloadURL();


  }

  static Future<String> addUserToDataBase(String email,String name,PickedFile? image) async{

    OB_user ob_user = OB_user(name, email, image == null ? "" : email + profile_path + basename(image.path));
    users_collection.doc(ob_user.email).set(OB_user_to_map(ob_user));
    String path = await uploadPictureToStorage(image,email + profile_path );
    return path;

  }

  static Future addExcersiceToDatabse(Excersice excersice) async{
    return await excerises_collection.doc(excersice.name).set(Excercise_to_map(excersice));
  }

  static Future addFAQToDatabse(FAQ faq) async{
    return await faq_collection.doc(faq.sender + '-' + faq.date.toString()).set(faq_to_map(faq));
  }

  static Future<OB_user> getUserByEmail(String email) async{

    Map<String,dynamic> user_map = Map();
    DocumentReference documentReference = await users_collection.doc(email);
    documentReference.get().then((value) => user_map = value.data() as Map<String,dynamic>);
    return map_to_OB_user(user_map);

  }



}

Map<String,dynamic> OB_user_to_map(OB_user ob_user){

  Map<String,dynamic> map = Map();
  map['name'] = ob_user.name;
  map['profile_image_path'] = ob_user.profile_image_path;
  map['email'] = ob_user.email;
  map['searchKey'] = ob_user.searchKey;
  map['privillage'] = ob_user.privillage.toString();

  return map;
}


OB_user map_to_OB_user(Map<String,dynamic> user_as_map){


  OB_user ob_user = OB_user(user_as_map['name'], user_as_map['email'], user_as_map['profile_image_path']);
  ob_user.privillage = string_to_priv(user_as_map['privillage']);
  ob_user.searchKey = user_as_map['searchKey'];
  return ob_user;
}

// Excersice map_to_Excersice(Map<String,dynamic> excersize_as_map){
//
//   Excersice excersice = Excersice(excersize_as_map['name'], excersize_as_map['category'], excersize_as_map['description'], excersize_as_map['hints'], excersize_as_map['video_url']);
//   return excersice;
// }

Map<String,dynamic> Excercise_to_map(Excersice excersice){

  Map<String,dynamic> map = Map();
  map['name'] = excersice.name;
  map['description'] = excersice.description;
  map['category'] = excersice.category;
  map['video_url'] = excersice.video_url;
  map['hints'] = excersice.hints;
  return map;
}

Map<String,dynamic> faq_to_map(FAQ faq){

  Map<String,dynamic> map = Map();
  map['answer'] = faq.answer;
  map['category'] = faq.category;
  map['question'] = faq.question;
  map['sender'] = faq.sender;
  map['date'] = faq.date.toString();
  return map;
}

Privillage string_to_priv(String priv_as_string){

  if(priv_as_string == Privillage.CLIENT.toString()){
    return Privillage.CLIENT;
  }else{
    return Privillage.TRAINER;
  }
}

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:one_beat_app/users/OB_USER.dart';

import 'dataBaseService.dart';

class Authentication with ChangeNotifier{

  bool _isLoading = false;
  String _errorMessage = "";
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  void set_isLoading(bool is_loading){
    _isLoading = is_loading;
    notifyListeners();
  }

  void set_ErrorMessage(String Message){
    _errorMessage = Message;
    notifyListeners();
  }


  Future Regiester(String email , String pw,String name,PickedFile? image) async{

    set_isLoading(true);
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: pw
      );
      String prof_image_path = await DataBaseService.addUserToDataBase(email, name, image);
      set_isLoading(false);
      set_ErrorMessage("");
      return OB_user(name, email, prof_image_path);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        set_isLoading(false);
        set_ErrorMessage(' הסיסמה חייבת להיות לפחות 6 תווים.');
        print('The password provided is too weak.');
        return null;
      } else if (e.code == 'email-already-in-use') {
        set_isLoading(false);
        set_ErrorMessage('קיים כבר במערכת משתמש עם דואר אלקטרוני זה');
        print('The account already exists for that email.');
        return null;
      }
    } catch (e) {
      set_isLoading(false);
      set_ErrorMessage('אין חיבור לאנטרניט');
      print(e);
      return null;
    }

  }


  Future Login(String email , String pw) async{

    set_isLoading(true);
    try {
      UserCredential auth_res = await firebaseAuth.signInWithEmailAndPassword(email: email, password: pw);
      User? user = auth_res.user;
      set_isLoading(false);
      set_ErrorMessage("");
      return user;
    } on SocketException{
      set_isLoading(false);
      set_ErrorMessage(' אין חיבור לאנטרניט');
      return null;
    } catch(e){
      set_isLoading(false);
      set_ErrorMessage(' הסיסמה והמייל אינם תואמים.');
      return null;
    }


  }


  Future LogOut()async{
    await firebaseAuth.signOut();

  }


  Stream<User?> get user => firebaseAuth.authStateChanges().map((event) => event);

}
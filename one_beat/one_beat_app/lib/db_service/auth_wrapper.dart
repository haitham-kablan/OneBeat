

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:one_beat_app/HomePage/HomePagePortrait.dart';
import 'package:one_beat_app/HomePage/UserHomePageFinal.dart';
import 'package:one_beat_app/LoginPage/FinalLoginPage.dart';
import 'package:one_beat_app/WelcomePage/WelcomePagePortrait.dart';
import 'package:one_beat_app/db_service/Authentication.dart';
import 'package:provider/provider.dart';

class wrapper extends StatelessWidget {

  Stream<User?> get user{
    return FirebaseAuth.instance.authStateChanges();
  }

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    if (user == null){
      return ChangeNotifierProvider(
          create: (context) => Authentication(),
          child: FinalLoginPage()
      );
    } else{
      return UserHomePageFinal();
    }
  }
}

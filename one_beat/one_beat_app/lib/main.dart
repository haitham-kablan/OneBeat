
// @dart=2.9
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:one_beat_app/HomePage/HomePagePortrait.dart';
import 'package:one_beat_app/LoadingPage/LoadingPagePortrait.dart';
import 'package:one_beat_app/LoginPage/LoginPagePortrait.dart';
import 'package:one_beat_app/colors/colors_pallete.dart';
import 'package:one_beat_app/db_service/Authentication.dart';
import 'package:one_beat_app/db_service/auth_wrapper.dart';
import 'package:one_beat_app/db_service/dataBaseService.dart';
import 'package:one_beat_app/responsive/responsive_layout.dart';
import 'package:one_beat_app/users/OB_USER.dart';
import 'package:one_beat_app/users/current_user.dart';
import 'package:provider/provider.dart';
import 'WelcomePage/WelcomePagePortrait.dart';
import 'main_screens/FAQ.dart';





Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

     // return StreamProvider<User>.value(
     //   value: wrapper().user,
     //   initialData: null,
     //   child: MaterialApp(
     //       home: wrapper()
     //   ),
     // );

    return MaterialApp(
      home: LoginPagePortrait(),
    );
  }

}



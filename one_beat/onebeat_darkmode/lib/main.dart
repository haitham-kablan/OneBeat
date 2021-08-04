import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:onebeat_darkmode/DataBase/Authentication/Authentication.dart';
import 'package:onebeat_darkmode/HomePage/HomePage.dart';
import 'package:onebeat_darkmode/LoginPage/LoginPage.dart';
import 'package:onebeat_darkmode/Users/CurrentUser.dart';
import 'package:onebeat_darkmode/Users/User.dart';

import 'LoadingPage/LoadingPage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
          child: FutureBuilder<BasicUser>(
                  future: AuthenticationService.getCurrentUser(),
                  builder: (BuildContext context, AsyncSnapshot<BasicUser> snapshot) {
                    if(snapshot.hasData){
                      if (snapshot.data!.email == "-1"){
                        return LogInPage();
                      }else{
                        currentUser = snapshot.data;
                        return  HomePage();
                      }
                    }else if (snapshot.hasError){
                      return  LogInPage();
                    }else{
                      return LoadingPage();
                    }
                  }
          )
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}




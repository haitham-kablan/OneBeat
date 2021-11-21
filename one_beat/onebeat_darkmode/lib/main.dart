
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onebeat_darkmode/DataBase/Authentication/Authentication.dart';
import 'package:onebeat_darkmode/DataBase/User/GymHeroUser.dart';
import 'package:onebeat_darkmode/Design/ColorsPallete/Pallete.dart';

import 'package:onebeat_darkmode/LoginPage/LoginPage.dart';
import 'package:onebeat_darkmode/WelcomePages/WelcomePage1.dart';

import 'DataBase/Services/DataBaseService.dart';
import 'Home/Home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await DataBaseService.getSystemExcerises();
  await DataBaseService.getSystemUsers();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home:

        FutureBuilder(
          future: AuthenticationService.getCurrentUser(),
          builder: (BuildContext context, AsyncSnapshot<GymHeroUser> snapshot) {
            if (snapshot.hasError) {
              return  LogInPage();
            }

            if (snapshot.connectionState == ConnectionState.done) {
              gymHeroUser = snapshot.data!;

              return (gymHeroUser.email.isEmpty ? LogInPage() : (gymHeroUser.fristTime ? WelcomePage1() : Home()));
            }

            return Scaffold(
              backgroundColor: backGroundClr,
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                        margin: EdgeInsets.only(left: 20),child: Image.asset("assets/welcomePage1.png",width: 200,height: 200,)),
                  ),
                  SizedBox(height: 40,),
                  Center(
                    child: CircularProgressIndicator(
                      backgroundColor: navBarClr,
                      color: greenClr,
                    ),
                  )
                ],
              ),

            );
          },
        )
    );
  }
}




//
// StreamBuilder(
// builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
// if(snapshot.hasError){
// return LogInPage();
// }
// if(snapshot.connectionState == ConnectionState.waiting){
// return Scaffold(
// backgroundColor: backGroundClr,
// body: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// crossAxisAlignment: CrossAxisAlignment.center,
// children: [
// Center(
// child: Container(
// margin: EdgeInsets.only(left: 20),child: Image.asset("assets/welcomePage1.png",width: 200,height: 200,)),
// ),
// SizedBox(height: 40,),
// Center(
// child: CircularProgressIndicator(
// backgroundColor: navBarClr,
// color: greenClr,
// )
// )
// ]
// )
// );
// }
//
// else{
//
// }
//
// },
//
// ),
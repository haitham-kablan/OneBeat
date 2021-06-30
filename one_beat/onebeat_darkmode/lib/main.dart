import 'package:flutter/material.dart';
import 'package:onebeat_darkmode/LoginPage/LoginPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(child: Directionality(textDirection: TextDirection.rtl,
      child: LogInPage())),
      debugShowCheckedModeBanner: false,
    );
  }
}
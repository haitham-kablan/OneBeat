import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onebeat_darkmode/ColorsPallete/ColorsPallete.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundClr,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Center(
                child: Image.asset("assets/logoandonebeat.png"),
              ),
            ),
            SizedBox(height: 20,),
            CircularProgressIndicator(
              backgroundColor: navBarClr,
              color: greenClr,
            )
          ],
        ),
      ),
    );
  }
}

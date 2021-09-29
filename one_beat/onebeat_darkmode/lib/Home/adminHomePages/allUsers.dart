

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onebeat_darkmode/Design/ColorsPallete/Pallete.dart';
import 'package:onebeat_darkmode/Design/TextStyle/TextStyle.dart';

class AllUsers extends StatelessWidget {
  const AllUsers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundClr,
      appBar: AppBar(

        backgroundColor: greyClr,
        elevation: 3,
        centerTitle: true,
        title: Text(
          "משתמשי המערכת" , style: whiteText(20),
        ),
      ),
      

    );
  }
}

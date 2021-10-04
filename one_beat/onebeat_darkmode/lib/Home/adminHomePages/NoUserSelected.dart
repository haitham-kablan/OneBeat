

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onebeat_darkmode/Design/ColorsPallete/Pallete.dart';
import 'package:onebeat_darkmode/Design/TextStyle/TextStyle.dart';

import 'allUsers.dart';

class NoUserSelected extends StatelessWidget {
  final refresh;
  const NoUserSelected({Key? key, this.refresh}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(height:size.height * 0.1),
        Container(width:size.width * 0.8,child: Center(child: Text("נא בחר אחד מהמשתמשים כדי להציג את הנתונים שלו",style: assistantStyle(Colors.grey[500]!, 25),textAlign: TextAlign.center,))),
        SizedBox(height:10),
        Material(
          color: Colors.transparent,
            child: InkWell(
              onTap: (){
                showSearch(context: context, delegate: DataSearch(refresh));
              },
                child: Container(child: Center(child: Text("בחירת משתמש",style: assistantStyle(greenClr, 17),textAlign: TextAlign.center,))))),

      ],
    );
  }
}

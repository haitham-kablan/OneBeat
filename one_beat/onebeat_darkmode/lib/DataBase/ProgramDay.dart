


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onebeat_darkmode/ColorsPallete/ColorsPallete.dart';
import 'package:onebeat_darkmode/DataBase/SpecicficExcerise.dart';
import 'package:onebeat_darkmode/Users/CurrentUser.dart';

import 'Services/DataBaseService.dart';

class ProgramDay{

  final List<SpecificExcerise> programDay;

  ProgramDay(this.programDay);


  Map<String,dynamic> toMap(){

    Map<String,dynamic> map = Map();
    int counter =1;
    programDay.forEach((element) {
      map["excerise - " + counter.toString()] = element.generalExcerise.category + "-" + element.generalExcerise.name + "-" + element.sets.toString()
              + "-" +element.reps.toString();
      counter++;
    });
    return map;
  }

}


class ProgramList extends StatelessWidget {

  final size;
  ProgramList({Key? key, this.size}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: DataBaseService.usersCollection.doc(currentUser!.email)
          .collection(DataBaseService.personalPrograms).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Something went wrong'));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: greenClr,
            ),
          );
        }

        return Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            height: size,
            child: ListView(
              children: snapshot.data.docs.map<Widget>((doc) {
                return Center(
                  child: Container(
                    child: ProgramTile(data: doc.data()),
                  ),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}

class ProgramTile extends StatelessWidget {

  final data;
  const ProgramTile({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        width: size.width * 0.8,
        decoration: BoxDecoration(
          color: backGroundClr,
          border: Border(
            bottom: BorderSide(width: 0.1,color: listTileColor),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text("תוכנית   ",style: TextStyle(color: offWhite,fontSize: 17,fontStyle: FontStyle.italic),textAlign: TextAlign.right,textDirection: TextDirection.rtl,),
                Align(
                    alignment: Alignment.topRight,
                    child: Text(data["programName"],style: TextStyle(color: greenClr,fontSize: 17),textAlign: TextAlign.right,textDirection: TextDirection.rtl,)),
              ],
            ),
            IconButton(
                onPressed: (){

                },
                icon: Icon(
                  Icons.chevron_right , color: greenClr,
                )
            ),

          ],
        ),
      ),
    );
  }
}

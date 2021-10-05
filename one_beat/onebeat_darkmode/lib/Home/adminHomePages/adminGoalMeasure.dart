

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onebeat_darkmode/DataBase/Services/DataBaseService.dart';
import 'package:onebeat_darkmode/Design/Animation/PageTransition.dart';
import 'package:onebeat_darkmode/Design/ColorsPallete/Pallete.dart';
import 'package:onebeat_darkmode/Design/TextStyle/TextStyle.dart';
import 'package:onebeat_darkmode/Home/HomePages/goals.dart';

import '../Home.dart';
import 'AdminMeasure.dart';
import 'allUsers.dart';

class AdminGoalMeasure extends StatefulWidget {
  const AdminGoalMeasure({Key? key}) : super(key: key);

  @override
  _AdminGoalMeasureState createState() => _AdminGoalMeasureState();
}

class _AdminGoalMeasureState extends State<AdminGoalMeasure> {
  @override

  void refresh(){
    setState(() {

    });
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(

          backgroundColor: backGroundClr,
          floatingActionButton: FloatingActionButton.extended(
            icon: Icon(Icons.add , color: Colors.white,),
            onPressed: (){
              Navigator.push(context, CustomPageRoute(child: goals(refresh: refresh,)));
            },
            label: Text("הוסף מדידת יעד",style: assistantStyle(Colors.white, 15),),backgroundColor: greenClr,),
          appBar: AppBar(
            backgroundColor: greyClr,
            elevation: 3,
            centerTitle: true,
            title: Text(
              "יעדים" , style: whiteText(20),
            ),
          ),

          body: SingleChildScrollView(
            child: Column(

              children: [
                SizedBox(height: 40,),
                Padding(
                  padding: const EdgeInsets.only(right: 20,left: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          margin:EdgeInsets.only(top: 10),
                          child: Text(getDate(AllUsers.pickedUser!.goalMeasures[0].dateTime),style: assistantStyle(Colors.grey[500]!, 15),textDirection: TextDirection.rtl,)),
                      Text("יעדים נוכחיים :",style: assistantStyle(greenClr, 25),textDirection: TextDirection.rtl,)
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children:[
                        Text("היקף בטן",style: assistantStyle(Colors.white, 20),),
                        Text("(ס\"ם)",style: assistantStyle(Colors.grey[300]!, 15),),
                        SizedBox(height: 10,),
                        Text(AllUsers.pickedUser!.goalMeasures[0].stomach,style: assistantStyle(Colors.grey[500]!, 17),),
                      ],

                    ),
                    Column(
                      children:[
                        Text("היקף ידיים",style: assistantStyle(Colors.white, 20),),
                        Text("(ס\"מ)",style: assistantStyle(Colors.grey[300]!, 15),),
                        SizedBox(height: 10,),
                        Text(AllUsers.pickedUser!.goalMeasures[0].arm,style: assistantStyle(Colors.grey[500]!, 17),),
                      ],

                    ),
                    Column(
                      children:[
                        Text("אחוז שומן",style: assistantStyle(Colors.white, 20),),
                        Text("(%)",style: assistantStyle(Colors.grey[300]!, 15),),
                        SizedBox(height: 10,),
                        Text(AllUsers.pickedUser!.goalMeasures[0].bodyfat,style: assistantStyle(Colors.grey[500]!, 17),),
                      ],

                    ),
                    Column(
                      children:[
                        Text("משקל",style: assistantStyle(Colors.white, 20),),
                        Text("(ק\"ג)",style: assistantStyle(Colors.grey[300]!, 15),),
                        SizedBox(height: 10,),
                        Text(AllUsers.pickedUser!.goalMeasures[0].weight,style: assistantStyle(Colors.grey[500]!, 17),),
                      ],

                    ),
                  ],
                ),
                SizedBox(height: 40,),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Align(
                      alignment: Alignment.topRight,
                      child: Text("הסטורית מדידות : ",style: assistantStyle(greenClr, 25),textDirection: TextDirection.rtl,)),
                ),
                SizedBox(height: 20,),
                StreamBuilder<QuerySnapshot>(
                  stream: DataBaseService.usersCollection.doc(AllUsers.pickedUser!.email).collection(DataBaseService.goalMeasures)
                      .orderBy("time",descending: true).snapshots(),
                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: CircularProgressIndicator(
                          backgroundColor: navBarClr,
                          color: greenClr,
                        ),
                      );
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(
                          backgroundColor: navBarClr,
                          color: greenClr,
                        ),
                      );
                    }

                    return Container(
                      height: size.height * 0.4,
                      child: ListView(
                        children: snapshot.data!.docs.map((DocumentSnapshot document) {
                          Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                          return CertainMeasure(wegiht: data["weight"], armSize: data["arm"], stomachSize: data["stomach"], bodyFat: data["bodyfat"], date: DateTime.parse(data["dateTime"]));
                        }).toList(),
                      ),
                    );
                  },
                ),


              ],
            ),
          ),
        )
    );
  }
}

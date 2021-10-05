import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onebeat_darkmode/DataBase/Services/DataBaseService.dart';
import 'package:onebeat_darkmode/DataBase/User/GymHeroUser.dart';
import 'package:onebeat_darkmode/Design/Animation/PageTransition.dart';
import 'package:onebeat_darkmode/Design/ColorsPallete/Pallete.dart';
import 'package:onebeat_darkmode/Design/TextStyle/TextStyle.dart';
import 'package:onebeat_darkmode/Home/Home.dart';
import 'package:onebeat_darkmode/Home/HomePages/Mesure.dart';
import 'package:onebeat_darkmode/Home/adminHomePages/allUsers.dart';

class AdminMeasure extends StatefulWidget {



  @override
  _AdminMeasureState createState() => _AdminMeasureState();

}

class _AdminMeasureState extends State<AdminMeasure> {


  void refresh(){
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: backGroundClr,
        floatingActionButton: FloatingActionButton.extended(
          icon: Icon(Icons.add , color: Colors.white,),
          onPressed: (){
            Navigator.push(context, CustomPageRoute(child: Measure(refresh: refresh,)));
          },
          label: Text("הוסף מדידה",style: assistantStyle(Colors.white, 15),),backgroundColor: greenClr,),
        appBar: AppBar(
          backgroundColor: greyClr,
          elevation: 3,
          centerTitle: true,
          title: Text(
            "מדידות" , style: whiteText(20),
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
                        child: Text(getDate(AllUsers.pickedUser!.Measures[0].dateTime),style: assistantStyle(Colors.grey[500]!, 15),textDirection: TextDirection.rtl,)),
                    Text("מדידות נוכחיות :",style: assistantStyle(greenClr, 25),textDirection: TextDirection.rtl,)
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
                      Text(AllUsers.pickedUser!.Measures[0].stomach,style: assistantStyle(Colors.grey[500]!, 17),),
                    ],

                  ),
                  Column(
                    children:[
                      Text("היקף ידיים",style: assistantStyle(Colors.white, 20),),
                      Text("(ס\"מ)",style: assistantStyle(Colors.grey[300]!, 15),),
                      SizedBox(height: 10,),
                      Text(AllUsers.pickedUser!.Measures[0].arm,style: assistantStyle(Colors.grey[500]!, 17),),
                    ],

                  ),
                  Column(
                    children:[
                      Text("אחוז שומן",style: assistantStyle(Colors.white, 20),),
                      Text("(%)",style: assistantStyle(Colors.grey[300]!, 15),),
                      SizedBox(height: 10,),
                      Text(AllUsers.pickedUser!.Measures[0].bodyfat,style: assistantStyle(Colors.grey[500]!, 17),),
                    ],

                  ),
                  Column(
                    children:[
                      Text("משקל",style: assistantStyle(Colors.white, 20),),
                      Text("(ק\"ג)",style: assistantStyle(Colors.grey[300]!, 15),),
                      SizedBox(height: 10,),
                      Text(AllUsers.pickedUser!.Measures[0].weight,style: assistantStyle(Colors.grey[500]!, 17),),
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
                stream: DataBaseService.usersCollection.doc(AllUsers.pickedUser!.email).collection(DataBaseService.measures)
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
      ),
    );
  }
}


class CertainMeasure extends StatefulWidget {
  const CertainMeasure({Key? key,  required this.wegiht, required this.armSize, required this.stomachSize, required this.bodyFat, required this.date}) : super(key: key);
  final String wegiht;
  final String armSize;
  final String stomachSize;
  final String bodyFat;
  final DateTime date;

  @override
  _CertainMeasureState createState() => _CertainMeasureState(this.wegiht,this.armSize,this.stomachSize,this.bodyFat,this.date);
}

class _CertainMeasureState extends State<CertainMeasure> {

  final String wegiht;
  final String armSize;
  final String stomachSize;
  final String bodyFat;
  final DateTime date;
  bool isClicked = false;

  _CertainMeasureState(this.wegiht, this.armSize, this.stomachSize, this.bodyFat,this.date);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 0.3,color: Colors.grey[800]!),
          )
      ),
      child: Column(
        children: [
          SizedBox(height: 10,),
          Row(
            children: [
              SizedBox(width: 25,),
              IconButton(
                  onPressed: (){
                    setState(() {
                      setState(() {
                        isClicked = !isClicked;
                      });
                    });
                  },
                  icon: Icon(
                    isClicked ? Icons.arrow_drop_up : Icons.arrow_drop_down , color: greenClr,
                  )),
              Spacer(flex: 1,),
              Text(getDate(date),style: assistantStyle(Colors.grey[500]!, 17),),
              SizedBox(width: 20,),
            ],
          ),
          isClicked ? SizedBox(height: 15,) : Container(),
          isClicked ?
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children:[
                  Text("היקף בטן",style: assistantStyle(Colors.grey[200]!, 20),),
                  Text("(ס\"ם)",style: assistantStyle(Colors.grey[300]!, 15),),
                  SizedBox(height: 10,),
                  Text(stomachSize,style: assistantStyle(Colors.grey[500]!, 17),),
                ],

              ),
              Column(
                children:[
                  Text("היקף ידיים",style: assistantStyle(Colors.white, 20),),
                  Text("(ס\"מ)",style: assistantStyle(Colors.grey[300]!, 15),),
                  SizedBox(height: 10,),
                  Text(armSize,style: assistantStyle(Colors.grey[500]!, 17),),
                ],

              ),
              Column(
                children:[
                  Text("אחוז שומן",style: assistantStyle(Colors.white, 20),),
                  Text("(%)",style: assistantStyle(Colors.grey[300]!, 15),),
                  SizedBox(height: 10,),
                  Text(bodyFat,style: assistantStyle(Colors.grey[500]!, 17),),
                ],

              ),
              Column(
                children:[
                  Text("משקל",style: assistantStyle(Colors.white, 20),),
                  Text("(ק\"ג)",style: assistantStyle(Colors.grey[300]!, 15),),
                  SizedBox(height: 10,),
                  Text(wegiht,style: assistantStyle(Colors.grey[500]!, 17),),
                ],

              ),
            ],
          )
              :
          Container(),

          SizedBox(height: 15,),
        ],
      ),
    );
  }
}

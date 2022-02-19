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

  final onClick;

  const AdminMeasure({Key? key, required this.onClick}) : super(key: key);

  @override
  _AdminMeasureState createState() => _AdminMeasureState(onClick);

}

class _AdminMeasureState extends State<AdminMeasure> {

  final onClick;

  _AdminMeasureState(this.onClick);
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
            Navigator.push(context, CustomPageRoute(child: Measure(refresh: refresh,onClick: onClick,)));
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
                        child: Text(getDate(AllUsers.pickedUser!.Measures[0].dateTime,flag : false),style: assistantStyle(Colors.grey[500]!, 15),textDirection: TextDirection.rtl,)),
                    Text("מדידות נוכחיות :",style: assistantStyle(greenClr, 25),textDirection: TextDirection.rtl,)
                  ],
                ),
              ),
              SizedBox(height: 20,),
              SingleRow("משקל", "(ק\"ג)", AllUsers.pickedUser!.Measures[0].weight),
              SizedBox(height: 10,),
              SingleRow("אחוז שומן", "(%)", AllUsers.pickedUser!.Measures[0].bodyfat),
              SizedBox(height: 10,),
              SingleRow("היקף ידיים", "(ס\"מ)", AllUsers.pickedUser!.Measures[0].arm),
              SizedBox(height: 10,),
              SingleRow("היקף בטן", "(ס\"מ)", AllUsers.pickedUser!.Measures[0].stomach),
              SizedBox(height: 10,),
              SingleRow("גובה", "(ס\"מ)", AllUsers.pickedUser!.Measures[0].height),
              SizedBox(height: 30,),
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
                        return CertainMeasure(wegiht: data["weight"], armSize: data["arm"], stomachSize: data["stomach"], bodyFat: data["bodyfat"], date: DateTime.parse(data["dateTime"]),height:data["height"]);
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
  const CertainMeasure({Key? key,  required this.wegiht, required this.armSize, required this.stomachSize, required this.bodyFat, required this.date, required this.height}) : super(key: key);
  final String wegiht;
  final String armSize;
  final String stomachSize;
  final String bodyFat;
  final String height;
  final DateTime date;

  @override
  _CertainMeasureState createState() => _CertainMeasureState(this.wegiht,this.armSize,this.stomachSize,this.bodyFat,this.date,this.height);
}

class _CertainMeasureState extends State<CertainMeasure> {

  final String wegiht;
  final String armSize;
  final String stomachSize;
  final String bodyFat;
  final String height;
  final DateTime date;
  bool isClicked = false;

  _CertainMeasureState(this.wegiht, this.armSize, this.stomachSize, this.bodyFat,this.date, this.height);

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
              Text(getDate(date,flag:true),style: assistantStyle(Colors.grey[500]!, 17),),
              SizedBox(width: 20,),
            ],
          ),
          isClicked ? SizedBox(height: 15,) : Container(),
          isClicked ?
              Column(
                children: [
                  SizedBox(height: 20,),
                  SingleRow("משקל", "(ק\"ג)", wegiht),
                  SizedBox(height: 10,),
                  SingleRow("אחוז שומן", "(%)", bodyFat),
                  SizedBox(height: 10,),
                  SingleRow("היקף ידיים", "(ס\"מ)",armSize),
                  SizedBox(height: 10,),
                  SingleRow("היקף בטן", "(ס\"מ)", stomachSize),
                  SizedBox(height: 10,),
                  SingleRow("גובה", "(ס\"מ)", height),
                  SizedBox(height: 30,),
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

Widget SingleRow(String name,String Unit,String val){
  return  Padding(
    padding: const EdgeInsets.only(left: 35.0,right: 35),
    child: Row(
      children: [
        Text(val,style: assistantStyle(Colors.grey[500]!, 17),),
        Spacer(flex: 1,),
        Text(Unit,style: assistantStyle(Colors.grey[300]!, 15),),
        SizedBox(width: 10,),
        Text(name,style: assistantStyle(Colors.white, 20),),
      ],
    ),
  );
}

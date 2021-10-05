

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onebeat_darkmode/DataBase/Services/DataBaseService.dart';
import 'package:onebeat_darkmode/Design/ColorsPallete/Pallete.dart';
import 'package:onebeat_darkmode/Design/TextStyle/TextStyle.dart';
import 'package:onebeat_darkmode/utils/MemberShip.dart';
import '';
import 'AdminMeasure.dart';
import 'addMemberShip.dart';
import 'allUsers.dart';

class MemperShipPage extends StatefulWidget {
  const MemperShipPage({Key? key}) : super(key: key);

  @override
  _MemperShipPageState createState() => _MemperShipPageState();
}

class _MemperShipPageState extends State<MemperShipPage> {



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: backGroundClr,
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.add , color: Colors.white,),
          onPressed: (){
          addMemberShip(context,size,AllUsers.pickedUser!.email);

          },
          label: Text("הוספת מנוי חדש",style: assistantStyle(Colors.white, 15),),backgroundColor: greenClr,),
      appBar: AppBar(
        backgroundColor: greyClr,
        elevation: 3,
        centerTitle: true,
        title: Text(
          "מנוי אישי" , style: whiteText(20),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 40,),
          Center(child: Image.asset("assets/ticket.png",width: 110,height: 110,)),
          SizedBox(height: 10,),
          Text("הסטורית המנויים",style: assistantStyle(greenClr, 17),),
          SizedBox(height: 20,),
          StreamBuilder<QuerySnapshot>(
            stream: DataBaseService.usersCollection.doc(AllUsers.pickedUser!.email).collection(DataBaseService.memberShip)
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
                height: size.height * 0.5,
                width: size.width * 0.9,
                child: ListView(
                  children: snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                    return SingleMemberShip(memperShip: MemberShip.fromMap(data));
                  }).toList(),
                ),
              );
            },
          ),
        ],
      ),

    );
  }
}

class SingleMemberShip extends StatelessWidget {
  const SingleMemberShip({Key? key, required this.memperShip}) : super(key: key);
  final MemberShip memperShip;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey[800]!,width: 0.3),
          )
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 15,bottom: 15),
        child: Row(

          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text("מנוי",style: assistantStyle(Colors.transparent, 16),),
                Text(memperShip.startDay +" / " + memperShip.startMonth + " / " + memperShip.startYear + "  -  " + memperShip.endDay +" / " + memperShip.endMonth + " / " + memperShip.endYear,style: assistantStyle(Colors.grey[600]!, 17),),
              ],
            ),
            // SizedBox(height: 10,),
            Column(
              children: [
                Text("מנוי",style: assistantStyle(Colors.grey[400]!, 16),),
                Text("רגיל",style: assistantStyle(Colors.white, 24),),
              ],
            ),
            // SizedBox(height: 15,),

            //  SizedBox(height: 10,),

          ],
        ),
      ),

    );
  }
}

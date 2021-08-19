

import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onebeat_darkmode/ColorsPallete/ColorsPallete.dart';
import 'package:onebeat_darkmode/DataBase/Services/DataBaseService.dart';

class Faq{

  final String publisherEmail;
  final String publisherName;
  final DateTime date;
  final String question;
  final String answer;
  final List<String> categoreis;

  Faq(this.publisherEmail, this.publisherName, this.date, this.question, this.answer, this.categoreis);

  Map<String,dynamic> toMap(){
    Map<String,dynamic> map = HashMap();
    map["publisherEmail"] =  publisherEmail;
    map["publisherName"] = publisherName;
    map["date"] = date.toString();
    map["question"] = question;
    map["answer"] = answer;
    map["categoreis"] = categoreis;
    return map;
  }

  static Faq fromMap(dynamic map){

    return Faq(map["publisherEmail"], map["publisherName"],
        DateTime.parse(map["date"] as String), map["question"], map["answer"], map["categoreis"]);
  }


}

class FaqList extends StatelessWidget {

  final size;
  FaqList({Key? key, this.size}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: DataBaseService.faqCollection.where("answer" , isNotEqualTo: "").snapshots(),
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
                    child: FaqTile(data: doc.data()),
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

class FaqTile extends StatelessWidget {

  final data;

  const FaqTile({Key? key, required this.data}) : super(key: key);

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
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
                child: Text(data["question"],style: TextStyle(color: greenClr,fontSize: 17),textAlign: TextAlign.right,textDirection: TextDirection.rtl,)),

            SizedBox(height: 10,),
            Align(
              alignment: Alignment.topRight,
                child: Text(data["answer"],style: TextStyle(color: listTileColor,fontSize: 14),textDirection: TextDirection.rtl,)),
            SizedBox(height: 15,),
            SizedBox(height: 15,),
          ],
        ),
      ),
    );
  }
}




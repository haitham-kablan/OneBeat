

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:one_beat_app/colors/colors_pallete.dart';
import 'package:one_beat_app/db_service/classes/Excercise.dart';
import 'package:one_beat_app/db_service/dataBaseService.dart';
import 'package:one_beat_app/stam.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';



class MyPlan extends StatefulWidget {
  @override
  _MyPlanState createState() => _MyPlanState();
}

class _MyPlanState extends State<MyPlan> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffECF0F1 ),
        body: Column(
          children: [
            Container(
              height: 100,
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.only(top: 15,bottom: 15,left: 2),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(120),
                      child: SizedBox(
                        width: 80,
                        height: 80,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xff006400),
                          ),
                          child: Text('ראשון', style: TextStyle(fontSize: 15),),
                          onPressed: () {
                            FirebaseAuth.instance.signOut();
                          },
                        ),
                      ),
                    ),
                    SizedBox(width: 15,),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(120),
                      child: SizedBox(
                        width: 80,
                        height: 80,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xff006400),
                          ),
                          child: Text('שני', style: TextStyle(fontSize: 15),),
                          onPressed: () {},
                        ),
                      ),
                    ),
                    SizedBox(width: 15,),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(120),
                      child: SizedBox(
                        width: 80,
                        height: 80,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary:Color(0xff006400),
                          ),
                          child: Text('שלישי', style: TextStyle(fontSize: 15),),
                          onPressed: () {},
                        ),
                      ),
                    ),
                    SizedBox(width: 15,),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(120),
                      child: SizedBox(
                        width: 80,
                        height: 80,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xff006400),
                          ),
                          child: Text('רביעי', style: TextStyle(fontSize: 15),),
                          onPressed: () {},
                        ),
                      ),
                    ),
                    SizedBox(width: 15,),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(120),
                      child: SizedBox(
                        width: 80,
                        height: 80,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xff006400),
                          ),
                          child: Text('חמישי', style: TextStyle(fontSize: 15),),
                          onPressed: () {},
                        ),
                      ),
                    ),
                    SizedBox(width: 15,),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(120),
                      child: SizedBox(
                        width: 80,
                        height: 80,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary:Color(0xff006400),
                          ),
                          child: Text('שישי', style: TextStyle(fontSize: 15),),
                          onPressed: () {},
                        ),
                      ),
                    ),
                    SizedBox(width: 15,),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(120),
                      child: SizedBox(
                        width: 80,
                        height: 80,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xff006400),
                          ),
                          child: Text('שבת', style: TextStyle(fontSize: 15),),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                child: Container(
                  child: StreamBuilder(
                          stream: DataBaseService.excerises_collection.snapshots(),
                          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                            if (snapshot.hasError) {
                              return Center(child: Text('Something went wrong'));
                            }

                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return Center(
                                child: CircularProgressIndicator(
                                  color: current_color.color.title_heading,
                                ),
                              );
                            }

                            return Directionality(
                              textDirection: TextDirection.rtl,
                              child: ListView(
                                children: snapshot.data.docs.map<Widget>((doc){
                                  return Center(
                                    child: Container(
                                      child: Excerise_tile(data: doc.data()),
                                    ),
                                  );
                                }).toList(),
                              ),
                            );

                          },
                        ),
                ),
            ),
          ],
        ),
    );
  }
}


class Excerise_tile extends StatelessWidget {

  final data;

  const Excerise_tile({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Container(
          margin: EdgeInsets.only(top: 10),

          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          width: size.width * 0.9,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Center(child:Text('לחיצת חזה',style: TextStyle(fontSize: 20,color: Color(0xff006400)),)),
                SizedBox(height: 10,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text("חזרות" , style: TextStyle(fontSize: 15),),
                        Text("14" , style: TextStyle(fontSize: 13),),
                      ],
                    ),
                    SizedBox(width: 40,),
                    Column(
                      children: [
                        Text("סטים" , style: TextStyle(fontSize: 15),),
                        Text("14" , style: TextStyle(fontSize: 13),),
                      ],
                    ),

                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 15,),
                    Text('סרטון הדגמה: ' , textDirection: TextDirection.rtl,style: TextStyle(color: Colors.black,fontSize: 17)),
                    SizedBox(height: 10,),
                    Text('תיאור התרגיל: ' , textDirection: TextDirection.rtl,style: TextStyle(color: Colors.black,fontSize: 17)),
                    Text('chestchestchestchestchestchestchestchestchestchestchestchestchestchestchest' , textDirection: TextDirection.rtl,style: TextStyle(color: Colors.grey[900],fontSize: 15)),
                    SizedBox(height: 10,),
                    SizedBox(height: 10,),
                    Text('הערות לביצוע:' , textDirection: TextDirection.rtl,style: TextStyle(color: Colors.black,fontSize: 17)),
                  ],
                ),
              ],
            ),
          ),
        );
  }
}

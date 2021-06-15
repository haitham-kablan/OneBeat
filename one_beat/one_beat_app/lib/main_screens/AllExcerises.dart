

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:one_beat_app/db_service/dataBaseService.dart';
import 'package:one_beat_app/colors/colors_pallete.dart';

class AllExcerises extends StatefulWidget {
  @override
  _AllExcerisesState createState() => _AllExcerisesState();
}

class _AllExcerisesState extends State<AllExcerises> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffECF0F1 ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: current_color.color.title_heading,
        onPressed: () {

        },
        label: Text("הוסף תרגיל",style: TextStyle(color: Colors.black),),
        icon: Icon(Icons.add , color: Colors.black,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
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
                  InkWell(
                    onTap: (){
                      setState(() {
                        // clients = false;
                        // print(clients);
                        // return;
                      });
                    },
                    child: Material(
                      borderRadius: BorderRadius.circular(10),
                      elevation: 10,
                      child: Container(
                        width: size.width * 0.25,
                        height: size.height * 0.07,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            colors:[
                              Color(0xff414141),
                              Colors.black,
                            ],
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                          ),
                        ),
                        child: Center(
                          child: Text("חזה",style: TextStyle(
                              color: current_color.color.title_heading,
                              fontSize:17
                          ),),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 15,),
                  InkWell(
                    onTap: (){
                      setState(() {
                        // clients = false;
                        // print(clients);
                        // return;
                      });
                    },
                    child: Material(
                      borderRadius: BorderRadius.circular(10),
                      elevation: 10,
                      child: Container(
                        width: size.width * 0.25,
                        height: size.height * 0.07,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            colors:[
                              Color(0xff414141),
                              Colors.black,
                            ],
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                          ),
                        ),
                        child: Center(
                          child: Text("גב",style: TextStyle(
                              color: current_color.color.title_heading,
                              fontSize:17
                          ),),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 15,),
                  InkWell(
                    onTap: (){
                      setState(() {
                        // clients = false;
                        // print(clients);
                        // return;
                      });
                    },
                    child: Material(
                      borderRadius: BorderRadius.circular(10),
                      elevation: 10,
                      child: Container(
                        width: size.width * 0.25,
                        height: size.height * 0.07,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            colors:[
                              Color(0xff414141),
                              Colors.black,
                            ],
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                          ),
                        ),
                        child: Center(
                          child: Text("כתפיים",style: TextStyle(
                              color: current_color.color.title_heading,
                              fontSize:17
                          ),),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 15,),
                  InkWell(
                    onTap: (){
                      setState(() {
                        // clients = false;
                        // print(clients);
                        // return;
                      });
                    },
                    child: Material(
                      borderRadius: BorderRadius.circular(10),
                      elevation: 10,
                      child: Container(
                        width: size.width * 0.25,
                        height: size.height * 0.07,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            colors:[
                              Color(0xff414141),
                              Colors.black,
                            ],
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                          ),
                        ),
                        child: Center(
                          child: Text("רגליים",style: TextStyle(
                              color: current_color.color.title_heading,
                              fontSize:17
                          ),),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 15,),
                  InkWell(
                    onTap: (){
                      setState(() {
                        // clients = false;
                        // print(clients);
                        // return;
                      });
                    },
                    child: Material(
                      borderRadius: BorderRadius.circular(10),
                      elevation: 10,
                      child: Container(
                        width: size.width * 0.25,
                        height: size.height * 0.07,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            colors:[
                              Color(0xff414141),
                              Colors.black,
                            ],
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                          ),
                        ),
                        child: Center(
                          child: Text("ידיים",style: TextStyle(
                              color: current_color.color.title_heading,
                              fontSize:17
                          ),),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 15,),
                  InkWell(
                    onTap: (){
                      setState(() {
                        // clients = false;
                        // print(clients);
                        // return;
                      });
                    },
                    child: Material(
                      borderRadius: BorderRadius.circular(10),
                      elevation: 10,
                      child: Container(
                        width: size.width * 0.25,
                        height: size.height * 0.07,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            colors:[
                              Color(0xff414141),
                              Colors.black,
                            ],
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                          ),
                        ),
                        child: Center(
                          child: Text("אירובי",style: TextStyle(
                              color: current_color.color.title_heading,
                              fontSize:17
                          ),),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 15,),
                  InkWell(
                    onTap: (){
                      setState(() {
                        // clients = false;
                        // print(clients);
                        // return;
                      });
                    },
                    child: Material(
                      borderRadius: BorderRadius.circular(10),
                      elevation: 10,
                      child: Container(
                        width: size.width * 0.25,
                        height: size.height * 0.07,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            colors:[
                              Color(0xff414141),
                              Colors.black,
                            ],
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                          ),
                        ),
                        child: Center(
                          child: Text("כללי",style: TextStyle(
                              color: current_color.color.title_heading,
                              fontSize:17
                          ),),
                        ),
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
                        color: Colors.black,
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
            Align(child: IconButton(
                icon: Icon(Icons.edit , color: current_color.color.title_heading,),
              onPressed: (){},
              ),
              alignment: Alignment.topLeft,),
            Center(child:Text('לחיצת חזה',style: TextStyle(fontSize: 20,color: Colors.black),)),
            SizedBox(height: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 15,),
                Text('סרטון הדגמה: ' , textDirection: TextDirection.rtl,style: TextStyle(color: Colors.black,fontSize: 17)),
                SizedBox(height: 10,),
                Text('תיאור התרגיל: ' , textDirection: TextDirection.rtl,style: TextStyle(color: Colors.black,fontSize: 17)),
                Text('chestchestchestchestchestchestchestchestchestchestchestchestchestchestchest' , textDirection: TextDirection.rtl,style: TextStyle(color: Colors.grey[600],fontSize: 15)),
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

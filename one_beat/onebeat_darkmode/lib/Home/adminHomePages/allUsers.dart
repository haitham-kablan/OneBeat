

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onebeat_darkmode/DataBase/Services/DataBaseService.dart';
import 'package:onebeat_darkmode/DataBase/User/GymHeroUser.dart';
import 'package:onebeat_darkmode/Design/Button.dart';
import 'package:onebeat_darkmode/Design/ColorsPallete/Pallete.dart';
import 'package:onebeat_darkmode/Design/TextStyle/TextStyle.dart';


class AllUsers extends StatefulWidget {

  const AllUsers({Key? key}) : super(key: key);

  static GymHeroUser? pickedUser = null;

  @override
  _AllUsersState createState() => _AllUsersState();
}

class _AllUsersState extends State<AllUsers> {

  void refresh(){
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  SafeArea(
      child: Scaffold(
        backgroundColor: backGroundClr,
        appBar: AppBar(
          actions: [
            IconButton(icon: Icon(Icons.search,color: Colors.white,),onPressed: (){

              showSearch(context: context, delegate: DataSearch(refresh));
            },)
          ],
          backgroundColor: greyClr,
          elevation: 3,
          centerTitle: true,
          title: Text(
            "משתמשי המערכת" , style: whiteText(20),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(

            children: AllUsers.pickedUser == null ?
                [
                  SizedBox(height: size.height * 0.1,),
                  Center(
                    child: Container(
                      width: size.width * 0.8,
                        child: Text(
                          "נא בחר אחד ממשתמשי המערכת כדי להציג את הנתונים שלו",style: assistantStyle(Colors.grey[500]!, 23),textAlign: TextAlign.center,
                        ),
                    ),
                  ),
            SizedBox(height: 10,),
            Center(
              child: Material(
                color:Colors.transparent,
                child: InkWell(
                  onTap:(){
                    showSearch(context: context, delegate: DataSearch(refresh));
                  },
                  child: Container(
                    width: size.width * 0.8,
                    child: Text(
                      "לחץ כאן להצגת המשתמשים",style: assistantStyle(greenClr, 17),textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),

                ]
                :
                [
                  SizedBox(height:20),
                  Center(
              child: Text(AllUsers.pickedUser!.name,style: assistantStyle(greenClr, 60),),
          ),
          SizedBox(height:20),
                Row(
                  children:[
                    SizedBox(width: 40,),
                    Image.asset("assets/fullman.png" , width: 80,height: 80,),
                    Spacer(flex:1),
                    Column(
                      children:[
                        Container(
                          margin:EdgeInsets.only(right:25),
                          child: Align(
                              alignment:Alignment.topRight,
                              child: Text(gymHeroUser.trainer ? "סטטוס:  מאמן":"סטטוס:  מתאמן",textDirection: TextDirection.rtl,style:assistantStyle(Colors.grey[500]!, 20))),

                        ),
                        SizedBox(height:10),
                        Container(
                          margin:EdgeInsets.only(right:25),
                          child: Align(
                              alignment:Alignment.topRight,
                              child: Text( gymHeroUser.gender ? "מין:  זכר" : "מין:  נקבה" ,textDirection: TextDirection.rtl,style:assistantStyle(Colors.grey[500]!, 20))),
                        ),
                        SizedBox(height:10),
                        Container(
                          margin:EdgeInsets.only(right:25),
                          child: Align(
                              alignment:Alignment.topRight,
                              child: Text("גיל:  " + gymHeroUser.age.toString(),textDirection: TextDirection.rtl,style:assistantStyle(Colors.grey[500]!, 20))),
                        ),
                      ],
                    ),
                  ],


                ),



          SizedBox(height:40),
          Container(

                child: Text( "מדידות נוכחיות"  ,textDirection: TextDirection.rtl,style:assistantStyle(Colors.grey[400]!, 35)),
          ),
          SizedBox(height:15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                //  Image.asset("assets/maleFace.png" , width: 65,height: 65,),
                  Text("היקף בטן",style: assistantStyle(Colors.grey[500]!,23),),
                  Text("(ס\"מ)",style: assistantStyle(Colors.grey[500]!,19),),
                  SizedBox(height: 10,),
                  Text(gymHeroUser.stomachSize.toString(),style: assistantStyle(Colors.grey[600]!,19),),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                 // Image.asset("assets/maleFace.png" , width: 65,height: 65,),
                  Text("היקף ידיים",style: assistantStyle(Colors.grey[500]!,23),),
                  Text("(ס\"מ)",style: assistantStyle(Colors.grey[500]!,19),),
                  SizedBox(height: 10,),
                  Text(gymHeroUser.armSize.toString(),style: assistantStyle(Colors.grey[600]!,19),),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  //Image.asset("assets/maleFace.png" , width: 65,height: 65,),
                  Text("אחוז שומון",style: assistantStyle(Colors.grey[500]!,23),),
                  Text("(%)",style: assistantStyle(Colors.grey[500]!,19),),
                  SizedBox(height: 10,),
                  Text(gymHeroUser.bodyfat.toString(),style: assistantStyle(Colors.grey[600]!,19),),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                 // Image.asset("assets/maleFace.png" , width: 65,height: 65,),
                  Text("משקל",style: assistantStyle(Colors.grey[500]!,23),),
                  Text("(ק\"ג)",style: assistantStyle(Colors.grey[500]!,19),),
                  SizedBox(height: 10,),
                  Text(gymHeroUser.weight.toString(),style: assistantStyle(Colors.grey[600]!,19),),
                ],
              ),


            ],
          ),
          SizedBox(height:40),
          Container(

            child: Text( "יעדים"  ,textDirection: TextDirection.rtl,style:assistantStyle(Colors.grey[400]!, 35)),
          ),
          SizedBox(height:15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  //  Image.asset("assets/maleFace.png" , width: 65,height: 65,),
                  Text("היקף בטן",style: assistantStyle(Colors.grey[500]!,23),),
                  Text("(ס\"מ)",style: assistantStyle(Colors.grey[500]!,19),),
                  SizedBox(height: 10,),
                  Text(gymHeroUser.goalstomachSize.toString(),style: assistantStyle(Colors.grey[600]!,19),),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  // Image.asset("assets/maleFace.png" , width: 65,height: 65,),
                  Text("היקף ידיים",style: assistantStyle(Colors.grey[500]!,23),),
                  Text("(ס\"מ)",style: assistantStyle(Colors.grey[500]!,19),),
                  SizedBox(height: 10,),
                  Text(gymHeroUser.goalarmSize.toString(),style: assistantStyle(Colors.grey[600]!,19),),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  //Image.asset("assets/maleFace.png" , width: 65,height: 65,),
                  Text("אחוז שומון",style: assistantStyle(Colors.grey[500]!,23),),
                  Text("(%)",style: assistantStyle(Colors.grey[500]!,19),),
                  SizedBox(height: 10,),
                  Text(gymHeroUser.goalbodyfat.toString(),style: assistantStyle(Colors.grey[600]!,19),),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  // Image.asset("assets/maleFace.png" , width: 65,height: 65,),
                  Text("משקל",style: assistantStyle(Colors.grey[500]!,23),),
                  Text("(ק\"ג)",style: assistantStyle(Colors.grey[500]!,19),),
                  SizedBox(height: 10,),
                  Text(gymHeroUser.goalweight.toString(),style: assistantStyle(Colors.grey[600]!,19),),
                ],
              ),


            ],
          ),
          SizedBox(height:40),
          button(greenClr , "בניית תוכנית אימון" , Colors.white , BorderRadius.circular(30),size.width * 0.8,size.height * 0.06,(){
            // Navigator.push(
            //   context,
            //   CustomPageRoute(child: WelcomePage2()),
            // );
          }),
          SizedBox(height:40),

                ],
          ),
        ),

      ),
    );
  }
}


class DataSearch extends SearchDelegate<String>{

  final refresh;

  DataSearch(this.refresh);

  @override
  List<Widget> buildActions(BuildContext context) {

    return [
      IconButton(onPressed: (){query = "";}, icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {

    return IconButton(onPressed: (){close(context,"");},
        icon: AnimatedIcon(icon : AnimatedIcons.menu_arrow,
          progress: transitionAnimation,));
  }

  @override
  Widget buildResults(BuildContext context) {

    List<GymHeroUser> results = query.isEmpty ? DataBaseService.allUsers :
    DataBaseService.allUsers.where((element) => element.name.startsWith(query) ).toList();

    return Directionality(
        textDirection: TextDirection.rtl,
        child: ListView.builder(
            itemBuilder: (context,index) => ListTile(
              leading: results[index].gender ? Image.asset("assets/maleFace.png" , width: 40,height: 40,) :
              Image.asset("assets/femaleFace.png", width: 40,height: 40,),
              tileColor: backGroundClr,
              onTap: (){
                AllUsers.pickedUser = results[index];
                refresh();
                close(context, "result");
              },
              title: RichText(
                text: TextSpan(
                  text: results[index].name.substring(0,query.length),
                  style: assistantStyle(Colors.white,20),
                  children: [
                    TextSpan(text: results[index].name.substring(query.length),
                        style: assistantStyle(Colors.grey, 20))
                  ],
                ),
              ),
              subtitle: Text(results[index].email , style: assistantStyle(Colors.grey[600]!, 15),),
            ),
            itemCount: results.length));
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    List<GymHeroUser> results = query.isEmpty ? DataBaseService.allUsers :
    DataBaseService.allUsers.where((element) => element.name.startsWith(query) || element.email.startsWith(query) ).toList();

    return Directionality(
        textDirection: TextDirection.rtl,
        child: ListView.builder(
            itemBuilder: (context,index) => ListTile(
              leading: results[index].gender ? Image.asset("assets/maleFace.png" , width: 40,height: 40,) :
              Image.asset("assets/femaleFace.png", width: 40,height: 40,),
              tileColor: backGroundClr,
              onTap: (){
                AllUsers.pickedUser = results[index];
                refresh();
                close(context, "result");
              },
              title: results[index].name.startsWith(query) ? RichText(
                text: TextSpan(
                  text: results[index].name.substring(0,query.length),
                  style: assistantStyle(Colors.white,20),
                  children: [
                    TextSpan(text: results[index].name.substring(query.length),
                        style: assistantStyle(Colors.grey, 20))
                  ],
                ),
              ) : Text(results[index].name , style: assistantStyle(Colors.grey[600]!, 20),),
              subtitle: Text(results[index].email , style: assistantStyle(Colors.grey[600]!, 15),),
            ),
            itemCount: results.length));

    //return DataBaseService.UsersCounter;
    // return StreamBuilder(
    //     stream: DataBaseService.usersStream,
    //     builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    //       if (snapshot.hasError) {
    //         return Center(
    //             child: Text("No Internet Connection , Please Try again Later",
    //               textDirection: TextDirection.ltr,style: assistantStyle(Colors.white, 50),));
    //       }
    //
    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         return Center(child: CircularProgressIndicator(backgroundColor: navBarClr,color: Colors.white,));
    //       }
    //
    //       List<GymHeroUser> allUsers = snapshot.data!.docs.map((e) => GymHeroUser.mapToUser(e)).toList();
    //       List<GymHeroUser> results = query.isEmpty ? allUsers : allUsers.where((element) => element.name.startsWith(query)).toList();
    //       print("length is fking" + results.length.toString());
    //       return Directionality(
    //           textDirection: TextDirection.rtl,
    //           child: ListView.builder(
    //             itemBuilder: (context,index) => ListTile(
    //                 leading: results[index].gender ? Image.asset("assets/maleFace.png" , width: 40,height: 40,) :
    //                 Image.asset("assets/femaleFace.png", width: 40,height: 40,),
    //               tileColor: backGroundClr,
    //               title: RichText(
    //                       text: TextSpan(
    //                         text: results[index].name.substring(0,query.length),
    //                         style: assistantStyle(Colors.white,20),
    //                         children: [
    //                           TextSpan(text: results[index].name.substring(query.length),
    //                           style: assistantStyle(Colors.grey, 20))
    //                         ],
    //                       ),
    //                     ),
    //               subtitle: Text(results[index].email , style: assistantStyle(Colors.grey[600]!, 15),),
    //               ),
    //             itemCount: results.length));
    //     },
    //
    // );
    // return Directionality(
    //   textDirection: TextDirection.rtl,
    //   child: ListView.builder(
    //       itemBuilder: (context,index) => ListTile(
    //         leading: results[index].gender ? Image.asset("assets/maleFace.png" , width: 40,height: 40,) :
    //         Image.asset("assets/femaleFace.png", width: 40,height: 40,),
    //         tileColor: backGroundClr,
    //         title: RichText(
    //           text: TextSpan(
    //             text: results[index].name.substring(0,query.length),
    //             style: assistantStyle(Colors.white,20),
    //             children: [
    //               TextSpan(text: results[index].name.substring(query.length),
    //               style: assistantStyle(Colors.grey, 20))
    //             ],
    //           ),
    //         ),
    //         subtitle: Text(results[index].email , style: assistantStyle(Colors.grey[600]!, 15),),
    //       ),itemCount: results.length,),
    // );


  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
        accentColor: greenClr,
        brightness: Brightness.dark,
        primaryColor: backGroundClr,
        canvasColor: backGroundClr,
    );
  }
}



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onebeat_darkmode/DataBase/Services/DataBaseService.dart';
import 'package:onebeat_darkmode/DataBase/User/GymHeroUser.dart';
import 'package:onebeat_darkmode/Design/ColorsPallete/Pallete.dart';
import 'package:onebeat_darkmode/Design/TextStyle/TextStyle.dart';

class AllUsers extends StatelessWidget {
  const AllUsers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backGroundClr,
        appBar: AppBar(
          actions: [
            IconButton(icon: Icon(Icons.search,color: Colors.white,),onPressed: (){

              showSearch(context: context, delegate: DataSearch());
            },)
          ],
          backgroundColor: greyClr,
          elevation: 3,
          centerTitle: true,
          title: Text(
            "משתמשי המערכת" , style: whiteText(20),
          ),
        ),

      ),
    );
  }
}

class DataSearch extends SearchDelegate<String>{



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

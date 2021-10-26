

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onebeat_darkmode/DataBase/Services/DataBaseService.dart';
import 'package:onebeat_darkmode/DataBase/User/GymHeroUser.dart';
import 'package:onebeat_darkmode/Design/Button.dart';
import 'package:onebeat_darkmode/Design/ColorsPallete/Pallete.dart';
import 'package:onebeat_darkmode/Design/TextStyle/TextStyle.dart';
import 'package:onebeat_darkmode/Home/adminHomePages/NoUserSelected.dart';
import 'package:onebeat_darkmode/Home/adminHomePages/SelectedUser.dart';


class AllUsers extends StatefulWidget {
  final onClick;
  const AllUsers({Key? key, required this.onClick}) : super(key: key);

  static GymHeroUser? pickedUser = null;

  @override
  _AllUsersState createState() => _AllUsersState(onClick);
}

class _AllUsersState extends State<AllUsers> {
  final onClick;

  _AllUsersState(this.onClick);
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
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.chevron_left , color: Colors.white,),
          ),
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
          child: AllUsers.pickedUser == null ? NoUserSelected(refresh: refresh):SelectedUser(onClick: onClick,),
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

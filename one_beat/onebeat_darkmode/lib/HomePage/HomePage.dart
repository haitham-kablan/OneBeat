
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onebeat_darkmode/ColorsPallete/ColorsPallete.dart';
import 'package:onebeat_darkmode/Drawer/LogOut.dart';
import 'package:onebeat_darkmode/HomePage/screens/Excerise/EmptyExcerise.dart';
import 'package:onebeat_darkmode/HomePage/screens/FAQ/EmptyFaq.dart';
import 'package:onebeat_darkmode/HomePage/screens/Mesaure/EmptyMeasure.dart';
import 'package:onebeat_darkmode/HomePage/screens/Mesaure/Measure.dart';
import 'package:onebeat_darkmode/Users/CurrentUser.dart';
import 'package:onebeat_darkmode/Users/TrainerUser.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  List<Widget> screens = [
    EmptyFaq(),Measure(),EmptyExcerise(),

  ];
  int selectedIndex = 2;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>(); // ADD THIS LINE

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey ,
        endDrawer: Drawer(
          child: Container(
            color: backGroundClr,
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(left: 20,top: 30),
                      child: Image.asset("assets/logoandonebeat.png")),
                ),
                SizedBox(height: 20,),
                Expanded(
                  flex: 2,
                  child: ListView(children: [
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: ListTile(
                        title: Text("מחירון",style: TextStyle(color: Color(0xffAFAFAF)),),
                        leading: Icon(Icons.money,color: Color(0xffAFAFAF),),
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: ListTile(
                        title: Text("חוגים",style: TextStyle(color: Color(0xffAFAFAF)),),
                        leading: Icon(Icons.group,color: Color(0xffAFAFAF),),
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: ListTile(
                        title: Text("אזור אישי",style: TextStyle(color: Color(0xffAFAFAF)),),
                        leading: Icon(Icons.account_circle,color: Color(0xffAFAFAF),),
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: ListTile(
                        title: Text("יציאה",style: TextStyle(color: Color(0xffAFAFAF)),),
                        leading: Icon(Icons.exit_to_app,color: Color(0xffAFAFAF),),
                        onTap: () {
                          exitDialogue(size.height,size.width,context);
                        },
                      ),
                    ),
                  ]),
                )
              ],
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: backGroundClr,
        body: screens[selectedIndex],
        bottomNavigationBar: CurvedNavigationBar(
          height: 50,
          color: navBarClr,
          backgroundColor: backGroundClr,
          buttonBackgroundColor: backGroundClr,
          items: [
            Icon(Icons.info_outline,size:20,color: selectedIndex == 0 ? greenClr : navBarItemsClr,),
            Icon(Icons.accessibility,size:20,color: selectedIndex == 1 ? greenClr : navBarItemsClr,),
            Icon(Icons.dashboard,size:20,color: selectedIndex == 2 ? greenClr : navBarItemsClr,),
          ],
          index: 2,
          animationDuration: Duration(
            milliseconds: 400
          ),
          onTap: (index){
            setState(() {
              selectedIndex = index;
            });
            print(index);
          },
        ),
      ),
    );
  }
}

// Material(
// elevation: 20,
// child: Container(
// decoration: BoxDecoration(
// border: Border(top: BorderSide(color: navBarItemsClr, width: 0.8)),
// ),
// child: BottomAppBar(
// color: backGroundClr,
// child: IconTheme(
// data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: <Widget>[
// IconButton(
// tooltip: 'Open navigation menu',
// icon:  Icon(Icons.info_outline,color: selectedIndex == 0 ? greenClr : navBarItemsClr,),
// onPressed: () {
// setState(() {
// selectedIndex = 0;
// });
// },
// ),
// IconButton(
// tooltip: 'Search',
// icon:  Icon(Icons.accessibility,color: selectedIndex == 1 ? greenClr : navBarItemsClr,),
// onPressed: () {
// setState(() {
// selectedIndex = 1;
// });
// },
// ),
// IconButton(
// tooltip: 'Favorite',
// icon:  Icon(Icons.dashboard,color: selectedIndex == 2 ? greenClr : navBarItemsClr,),
// onPressed: () {
// setState(() {
// selectedIndex = 2;
// });
// },
// ),
// ],
// ),
// ),
// ),
// ),
// ) ,
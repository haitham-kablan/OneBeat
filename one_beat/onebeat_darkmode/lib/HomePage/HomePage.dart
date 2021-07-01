
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onebeat_darkmode/ColorsPallete/ColorsPallete.dart';
import 'package:onebeat_darkmode/HomePage/screens/Excerise/EmptyExcerise.dart';
import 'package:onebeat_darkmode/HomePage/screens/FAQ/EmptyFaq.dart';
import 'package:onebeat_darkmode/HomePage/screens/Mesaure/EmptyMeasure.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Widget> screens = [
    EmptyFaq(),EmptyMeasure(),EmptyExcerise()

  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
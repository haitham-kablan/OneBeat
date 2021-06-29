import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:one_beat_app/Excerise/EmptyExcerisePage.dart';
import 'package:one_beat_app/Measurments/Mesurments.dart';
import 'package:one_beat_app/colors/colors.dart';

class UserHomePageFinal extends StatefulWidget {
  @override
  _UserHomePageFinal createState() => _UserHomePageFinal();
}

class _UserHomePageFinal extends State<UserHomePageFinal> {
  int _selectedIndex = 0;
  List<Color> colors = [Colors.white,Colors.white,Colors.white];
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static  List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Mesurments(),
    EmptyExcerisePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _widgetOptions[_selectedIndex],
        backgroundColor: backGround,
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.white,
          backgroundColor: greyButtonBg,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.info_outline),
              label: "FAQ",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.accessibility),
              label: 'מדידות',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: 'תוכנית אימון',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Color(0xff7BF38C),
          unselectedLabelStyle: TextStyle(color: Colors.white),
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

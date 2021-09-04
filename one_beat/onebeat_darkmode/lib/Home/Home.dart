

import 'package:flutter/material.dart';
import 'package:onebeat_darkmode/Design/Button/HomeButton.dart';
import 'package:onebeat_darkmode/Design/ColorsPallete/Pallete.dart';
import 'package:onebeat_darkmode/Design/TextStyle/TextStyle.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: backGroundClr,
        body: Column(
              children: [
                Container(
                  width: size.width,
                  height: size.height * 0.2,
                  color: greenClr,
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          SizedBox(height: size.height * 0.03,),
                          Padding(
                            padding: const EdgeInsets.only(right: 30),
                            child: Align(
                                alignment: Alignment.bottomRight,
                                child: Text("שלום הייתם",style: whiteText(40),)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 30),
                            child: Align(
                                alignment: Alignment.bottomRight,
                                child: Text("בן 20",style: whiteText(20),)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 30),
                            child: Align(
                                alignment: Alignment.bottomRight,
                                child: Text("יום ראשון 1\\2\\3",style: whiteText(20),)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.02,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    HomeButton(size, "imagePath", "text"),
                    HomeButton(size, "imagePath", "text"),
                    HomeButton(size, "imagePath", "text"),
                  ],
                ),
                SizedBox(height: size.height * 0.02,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    HomeButton(size, "imagePath", "text"),
                    HomeButton(size, "imagePath", "text"),
                    HomeButton(size, "imagePath", "text"),
                  ],
                ),
                SizedBox(height: size.height * 0.02,),
                Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    HomeButton(size, "imagePath", "text"),
                    HomeButton(size, "imagePath", "text"),
                    Container(
                      color: Colors.transparent,
                      width: size.width * 0.27,
                      height:  size.height * 0.18,
                    ),
                  ],
                ),

          ],
        ),
      ),
    );
  }
}

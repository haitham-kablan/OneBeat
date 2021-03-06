

import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onebeat_darkmode/Design/Animation/PageTransition.dart';
import 'package:onebeat_darkmode/Design/ColorsPallete/Pallete.dart';
import 'package:onebeat_darkmode/Design/TextStyle/TextStyle.dart';
import 'package:onebeat_darkmode/Home/HomePages/SpecificPlan.dart';

import 'allUsers.dart';

class AdminPlans extends StatefulWidget {
  const AdminPlans({Key? key}) : super(key: key);

  @override
  _AdminPlansState createState() => _AdminPlansState();
}

class _AdminPlansState extends State<AdminPlans> {

  int currentIndex = 0;
  CarouselController carouselController = CarouselController();



  void onChange(int newIndex ,CarouselPageChangedReason reason){
    setState(() {
      currentIndex = newIndex;
    });
  }

  void refresh(){
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          backgroundColor: backGroundClr,
          // floatingActionButton: FloatingActionButton.extended(
          //   elevation: 10,
          //     onPressed: (){
          //       Navigator.push(
          //         context,
          //         CustomPageRoute( child: BuildPlan(refresh: refresh,),),
          //       );
          //     },
          //     label: Text("בניית תוכנית אימון" , style: whiteText(16),),
          //   icon: Icon(Icons.add , color: Colors.white , size: 16,),
          //   backgroundColor: greenClr,
          // ),

          appBar: AppBar(

            elevation: 3,
            backgroundColor: greyClr,
            title: Text(
              "תוכניות אימון" , style: whiteText(20),
            ),
            centerTitle: true,
            leading:  IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(Icons.chevron_left , color: Colors.white, size: 35,)),
          ),
          body: Stack(
            children: [
              Column(
                children: [
                  SizedBox(height: size.height * 0.08,),
                  Container(
                    width: size.width * 0.8,
                    child: Center(
                      child: Text(
                        "כאן אתה יכול לצפות בתוכניות האימון של המתאמן",
                        textDirection: TextDirection.rtl,
                        style: assistantStyle(Colors.grey[600]!,20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.1,),
                  CarouselSlider(
                    carouselController: carouselController,
                    options:  CarouselOptions(
                      height: 250,
                      //aspectRatio: 16/9,
                      viewportFraction: 0.5,
                      initialPage: 0,
                      enableInfiniteScroll: false,
                      reverse: false,
                      onPageChanged: onChange,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                    ),
                    items: AllUsers.pickedUser!.programs.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Material(
                            color: greyClr,
                            borderRadius: BorderRadius.circular(10),
                            child: InkWell(
                              onTap: (){
                                setState(() {
                                  int index = AllUsers.pickedUser!.programs.indexWhere((element) => element.name == i.name);
                                  print(index);
                                  print(currentIndex);
                                  if(index > currentIndex){
                                    carouselController.nextPage(duration: Duration(milliseconds: 300));
                                  }else if(index == currentIndex){
                                    Navigator.push(
                                      context,
                                      CustomPageRoute( child: SpecificPlan(name: AllUsers.pickedUser!.programs[currentIndex].name,
                                        program: AllUsers.pickedUser!.programs[currentIndex],),),
                                    );
                                  }else{
                                    carouselController.previousPage(duration: Duration(milliseconds: 300));
                                  }
                                });
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(
                                    border: Border.all(color:Colors.grey[800]! , width: 0.25),
                                    color: greyClr,
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("תוכנית", style: explaintion(17),),
                                    Container(
                                      child: Text(i.name, style: greenText(25),textAlign: TextAlign.center,),
                                      width: size.width * 0.4,
                                    ),
                                    SizedBox(height: 20,),
                                    Text("מספר ימים בשבוע", style: assistantStyle(Colors.grey[600]!, 17),),
                                    Text(i.days.length.toString(), style: assistantStyle(Colors.grey[600]!, 17),),
                                    SizedBox(height: 10,),

                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 14,),
                  InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        CustomPageRoute( child: SpecificPlan(name: AllUsers.pickedUser!.programs[currentIndex].name, program: AllUsers.pickedUser!.programs[currentIndex],),),
                      );
                    },
                    child: Row(
                      children: [
                        Spacer(flex:1),
                        Container(
                            margin: EdgeInsets.only(top: 2),
                            child: Icon(Icons.arrow_left , color: Color(0xff707070),size: 20,)),
                        Text("צפייה בתוכנית", style: explaintion(17),textAlign: TextAlign.center,),

                        Spacer(flex:1),
                      ],
                    ),
                  ),
                ],
              ),
              Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Image.asset("assets/plansBg.png" , width: 80,height: 80,)))
            ],
          )
      ),
    );
  }
}



import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onebeat_darkmode/Design/ColorsPallete/Pallete.dart';
import 'package:onebeat_darkmode/Design/TextStyle/TextStyle.dart';

class Plans extends StatefulWidget {
  const Plans({Key? key}) : super(key: key);

  @override
  _PlansState createState() => _PlansState();
}

class _PlansState extends State<Plans> {

  List<String> plans = ["A","AB","PUSH AND PULL"];
  int currentIndex = 0;
  CarouselController carouselController = CarouselController();

  void onChange(int newIndex ,CarouselPageChangedReason reason){
    setState(() {
      currentIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton.extended(
            onPressed: (){},
            label: Text("בניית תוכנית אימון" , style: whiteText(16),),
          icon: Icon(Icons.add , color: Colors.white , size: 16,),
          backgroundColor: greenClr,
        ),

        appBar: AppBar(
          elevation: 10,
          backgroundColor: greenClr,
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
                      "כאן אתה יכול לצפות בתוכניות המומלצות של המאמנין , או ליצור תוכנית חדשה בעצמך",
                      textDirection: TextDirection.rtl,
                      style: explaintion(20),
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
                  items: plans.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Material(
                          color: Color(0xfff0f0f0),
                          borderRadius: BorderRadius.circular(10),
                          child: InkWell(
                            onTap: (){
                              setState(() {
                                int index = plans.indexWhere((element) => element == i);
                                if(index > currentIndex){
                                  carouselController.nextPage(duration: Duration(milliseconds: 300));
                                }else if(index == currentIndex){
                                  return;
                                }else{
                                  carouselController.previousPage(duration: Duration(milliseconds: 300));
                                }
                              });
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                  color: Color(0xfff0f0f0),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("תוכנית", style: explaintion(17),),
                                  Container(
                                      child: Text(i, style: greenText(25),textAlign: TextAlign.center,),
                                    width: size.width * 0.4,
                                  ),
                                  SizedBox(height: 20,),
                                  Text("מספר ימים בשבוע", style: explaintion(17),),
                                  Text("4", style: explaintion(17),),
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
                Row(
                  children: [
                    Spacer(flex:1),
                    Container(
                      margin: EdgeInsets.only(top: 2),
                        child: Icon(Icons.arrow_left , color: Color(0xff707070),size: 20,)),
                    Text("צפייה בתוכנית", style: explaintion(17),textAlign: TextAlign.center,),

                    Spacer(flex:1),
                  ],
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomLeft,
                child: Container(
                  margin: EdgeInsets.only(bottom: 20),
                    child: Image.asset("assets/plansBg.png" , width: 150,height: 150,)))
          ],
        )
      ),
    );
  }
}

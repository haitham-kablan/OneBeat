

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onebeat_darkmode/DataBase/Services/DataBaseService.dart';
import 'package:onebeat_darkmode/Design/Accesories/HorizontalList.dart';
import 'package:onebeat_darkmode/Design/ColorsPallete/Pallete.dart';
import 'package:onebeat_darkmode/Design/TextStyle/TextStyle.dart';
import 'package:onebeat_darkmode/utils/GeneralExcerises.dart';

class AllExcerises extends StatefulWidget {
  const AllExcerises({Key? key}) : super(key: key);

  @override
  _AllExcerisesState createState() => _AllExcerisesState();
}

class _AllExcerisesState extends State<AllExcerises> {

  List<String> muscles = ["חזה","גב","יד קדמית","יד אחורית","כתפיים","בטן","רגליים"];
  Category current = Category.CHEST;
  CarouselController carouselController = CarouselController();

  void changeIndex(int index, CarouselPageChangedReason reason){

    setState(() {
      current = stringCategoryToCategory(muscles[index]);
    });

  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: backGroundClr,
        appBar: AppBar(
          elevation: 10,
          backgroundColor: greenClr,
          title: Text(
            "תרגילים" , style: whiteText(20),
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
                SizedBox(height: 40,),
                 CarouselSlider(
                   carouselController: carouselController,
                  options:  CarouselOptions(
                    height: 200,
                    aspectRatio: 16/9,
                    viewportFraction: 0.5,
                    initialPage: 0,
                    enableInfiniteScroll: false,
                    reverse: false,
                    enlargeCenterPage: true,
                    onPageChanged: changeIndex,
                    scrollDirection: Axis.horizontal,
                  ),
                  items: muscles.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Material(
                          color: Color(0xff272727),
                          borderRadius: BorderRadius.circular(10),
                          child: InkWell(
                            onTap: (){
                              setState(() {
                                int index = muscles.indexWhere((element) => element == i);
                                int currentIndex = muscles.indexWhere((element) => stringCategoryToCategory(element) == current);
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
                                  color: Color(0xff272727),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(GeneralExcerise(stringCategoryToCategory(i),"").getCategoryPic() , width: 100,height: 90,),
                                  Text(i , style: greenText(25),),
                                  Text( DataBaseService.systemExcerises[stringCategoryToCategory(i)]!.length.toString() + "  תרגיל" , style: explaintion(13),textDirection: TextDirection.rtl,),

                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
                SizedBox(height: 30,),
                Material(
                  borderRadius: BorderRadius.circular(15),
                  color: backGroundClr,
                  child: Container(
                    height: size.height * 0.47,
                    decoration: BoxDecoration(
                      color: backGroundClr,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 20,),
                        Text(current.toString().substring(9) , style: greenText(30)),
                        Text(DataBaseService.systemExcerises[current]!.length.toString() , style: explaintion(15)),
                        Padding(
                          padding: const EdgeInsets.only(top: 20 , right: 30,left: 30 , bottom: 10),
                          child: Container(
                            height: size.height * 0.3,
                            child: ListView(
                              children: DataBaseService.systemExcerises[current]!.map((e) => e.getTile()).toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Center(child: Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  margin: EdgeInsets.only(bottom: 20,left: 20),
                    child: Image.asset("assets/homeBg.png",width: 100,height: 100,)))),
          ],
        ),
      ),
    );
  }
}

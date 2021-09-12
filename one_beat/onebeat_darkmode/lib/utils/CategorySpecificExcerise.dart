


import 'package:flutter/material.dart';
import 'package:onebeat_darkmode/Design/ColorsPallete/Pallete.dart';
import 'package:onebeat_darkmode/HomePage/screens/Excerise/addTrainDay.dart';

getCategorySpecificExcerises(context , Size size , int day , onDone){
  return showDialog(
      context: context,
      builder: (BuildContext context) =>
          Center(
              child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Material(
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: backGroundClr,
                        ),
                        height: size.height * 0.8,
                        width: size.width * 0.85,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: IconButton(onPressed: (){
                                      Navigator.pop(context);
                                    }, icon: Icon(Icons.clear,color: greyClr,)),
                                  ),
                                ),
                                Spacer(flex: 1,),
                                Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: RichText(
                                      text: TextSpan(
                                        children:  <TextSpan>[
                                          TextSpan(text: 'יום ', style: TextStyle(color: offWhite,fontSize: 35,fontStyle: FontStyle.italic)),
                                          TextSpan(text: day.toString(),style: TextStyle(color: greenClr,fontSize: 35,fontStyle: FontStyle.italic),),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10,),

                              ],
                            ),
                            SizedBox(height: 10,),
                            CategoriesExceriseList(onDone: onDone,),


                          ],
                        ),
                      )
                  )
              )
          )
    // mainAxisAlignment: MainAxisAlignment.cent
  );
}
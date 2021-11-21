
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onebeat_darkmode/DataBase/Services/DataBaseService.dart';
import 'package:onebeat_darkmode/Design/ColorsPallete/Pallete.dart';
import 'package:onebeat_darkmode/Design/TextStyle/TextStyle.dart';
import 'package:onebeat_darkmode/utils/GeneralExcerises.dart';

class ExceriseTile extends StatelessWidget {

  final String name;
  final String category;
  final int sets;
  final String reps;
  final String machineNumber;





  ExceriseTile({Key? key,  required this.name,  required this.sets,  required this.reps,  required this.machineNumber, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? link = null;

    if (! DataBaseService.systemExcerises.containsKey(stringCategoryToCategory(category))){
      link = null;
    }else{
      if (DataBaseService.systemExcerises[stringCategoryToCategory(category)]!.isEmpty){
        link = null;
      }else{
        link = DataBaseService.systemExcerises[stringCategoryToCategory(category)]!.where((element) => element.name == name).isEmpty ? null :
        DataBaseService.systemExcerises[stringCategoryToCategory(category)]!.where((element) => element.name == name).first.link;
      }
    }


    return Container(
    //  margin: EdgeInsets.only(left: 10,right: 10),
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: greyClr,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color:Colors.grey[800]! , width: 0.25),
        ),
      child: Column(
        children: [
          SizedBox(height: 15,),
          Row(
            children: [
              SizedBox(width: 25,),
              Image.asset(GeneralExcerise(stringCategoryToCategory(category),name,null).getCategoryPic(),height: 60,width: 60,),

              Spacer(flex: 1,),

              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(height: 7,),
                  Text(
                      category , style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)
                  ),
                  Container(
                    width: 200,
                    child: Text(
                        name , style: TextStyle(color: Colors.grey[600]!,fontSize: 20),textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 25,),



            ],
          ),
          SizedBox(height: 20,),
          sets == -1 ?  Row(
            children: [
              Spacer(flex: 1,),
              Text("זמן: " + reps + " דקות",style: GoogleFonts.assistant(
                color: Colors.grey[600]!,
                fontSize: 17,
              ),textDirection: TextDirection.rtl,),
              SizedBox(width: 30,),
            ],
          ) :
              Column(
                children: [
                  Row(
                    children: [
                      Spacer(flex: 1,),
                      Text("סטים: " + sets.toString(),style: GoogleFonts.assistant(
                        color: Colors.grey[600]!,
                        fontSize: 17,
                      ),textDirection: TextDirection.rtl,),
                      SizedBox(width: 30,),
                    ],
                  ),
                  SizedBox(height: 5,),
                  Row(

                    children: [
                      SizedBox(width: 30,),

                      machineNumber == "-1" ? Container() : Text("מכונה מספר: " + machineNumber,style: GoogleFonts.assistant(
                        color: Colors.grey[600]!,
                        fontSize: 17,
                      ), textDirection: TextDirection.rtl,),
                      Spacer(flex: 1,),
                      Text("חזרות: " + reps.toString(),style: GoogleFonts.assistant(
                        color: Colors.grey[600]!,
                        fontSize: 17,
                      ),textDirection: TextDirection.rtl,),

                      SizedBox(width: 30,),
                    ],
                  ),
                  machineNumber != -1 ? SizedBox(height: 10,):Container() ,
                  Row(
                    children: [
                      machineNumber != -1 ? SizedBox(width: 30,):SizedBox(width: 25,) ,
                      link == null ? Container() :
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: (){
                            showDialog(context: context,
                                builder: (c){
                              return Center(
                                child: Stack(
                                  children: [
                                    Center(
                                      child: Container(
                                        color: Colors.transparent, child: CircularProgressIndicator(
                                        color: greenClr,),
                                      ),
                                    ),
                                    Center(child: Image.network(link!,width: 275,height: 275,)),
                                  ],
                                ),
                              );});
                          },
                          child: Text("צפייה בתרגיל",style: assistantStyle(greenClr, 14),),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

          SizedBox(height: 20,),
        ],
      ),
    );
  }
}

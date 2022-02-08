



import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onebeat_darkmode/DataBase/GenerealExcerise.dart' as db;
import 'package:onebeat_darkmode/DataBase/Services/DataBaseService.dart';
import 'package:onebeat_darkmode/DataBase/User/GymHeroUser.dart';
import 'package:onebeat_darkmode/Design/Button.dart';
import 'package:onebeat_darkmode/Design/ColorsPallete/Pallete.dart';
import 'package:onebeat_darkmode/Design/InputFeild.dart';
import 'package:onebeat_darkmode/Design/ShowError.dart';
import 'package:onebeat_darkmode/Design/TextStyle/TextStyle.dart';
import 'package:onebeat_darkmode/Home/adminHomePages/allUsers.dart';
import 'package:onebeat_darkmode/utils/GeneralExcerises.dart' as utl;
import 'package:onebeat_darkmode/utils/MemberShip.dart';
import 'package:onebeat_darkmode/utils/MemberShipClass.dart';
import 'package:onebeat_darkmode/utils/chipPicker.dart';


addNewExcerise(context,Size size){



  DateTime dateToday = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);


  return showDialog(context: context,
      builder: (buildContext){
        return Center(
          child: Material(
              color: Colors.transparent,
              child: InnerAddNewExcerise(size: size,)
          ),
        );
      });
}


class InnerAddNewExcerise extends StatefulWidget {
  InnerAddNewExcerise({Key? key, required this.size}) : super(key: key);
  final Size size;


  @override
  _InnerAddNewExceriseState createState() => _InnerAddNewExceriseState(size);
}

class _InnerAddNewExceriseState extends State<InnerAddNewExcerise> {
  final Size size;
  String selected = "";
  TextEditingController name = TextEditingController();
 
  updateSelected(String ns){
    selected = ns;
    print(selected);
  }
  bool isLoading = false;

  _InnerAddNewExceriseState(this.size);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: greyClr,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey[700]!,width: 0.3),
      ),
      width: size.width * 0.8,
      height: size.height *0.7,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.clear , color: Colors.white,)),
                Spacer(flex: 1,)
              ],
            ),
          ),
          Text("הוספת תרגיל חדש",style: assistantStyle(greenClr, 20),textAlign: TextAlign.center,),
          SizedBox(height: 5,),
          Center(
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Material(
                  color: Colors.transparent,
                  elevation: 1,
                  child: TextFormField(
                    obscureText: false,
                    controller: name,
                    style: TextStyle(color: Colors.grey[600]!),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: backGroundClr,

                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: greenClr,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: Colors.grey[800]!,width: 0.34,
                        ),
                      ),
                      labelText: "שם תרגיל",
                      labelStyle: TextStyle(color: Colors.grey[600]!),
                      //prefixIcon: icon,
                    ),
                  ),
                ),
              ),
            )
          ),
          SizedBox(height: 15,),
          Text("קטגוריה",style: assistantStyle(greenClr, 20),textAlign: TextAlign.center,),
          SizedBox(height: 15,),
          Expanded(child: ChoiceChipDisplay(onSelected: updateSelected,)),
          SizedBox(height: 25,),
          isLoading ? CircularProgressIndicator(
            backgroundColor: navBarClr,
            color: greenClr,
          ) :
          button(greenClr , "הוספה" , Colors.white , BorderRadius.circular(10),size.width * 0.45,size.height * 0.04,() async {

            if (name.text.isEmpty){
              ShowError(context, "נא תן שם לתרגיל");
              return;
            }
            if (selected == ""){
              ShowError(context, "נא בחר קטגוריה");
              return;
            }

            setState(() {
              isLoading = true;
            });

            await DataBaseService.addGeneralExceriseToDb(db.GeneralExcerise(name.text ,selected));
            DataBaseService.systemExcerises[stringCategoryToCategory(selected)]!.add(utl.GeneralExcerise(
              stringCategoryToCategory(selected),name.text,null
            ));

            setState(() {
              isLoading = false;
            });

            Navigator.pop(context);
          }),
          SizedBox(height: size.height * 0.1,),
        ],
      ),

    );
  }
}


bool goodDay(String str , int max){


  if(str.isEmpty){
    return false;
  }
  try{
    int x = int.parse(str);
    if(x == 0){
      return false;
    }
    if(x > max){
      return false;
    }
    return true;
  }catch(e){
    return false;
  }

}




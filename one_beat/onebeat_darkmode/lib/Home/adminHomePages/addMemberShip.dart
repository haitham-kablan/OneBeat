



import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onebeat_darkmode/DataBase/Services/DataBaseService.dart';
import 'package:onebeat_darkmode/Design/Button.dart';
import 'package:onebeat_darkmode/Design/ColorsPallete/Pallete.dart';
import 'package:onebeat_darkmode/Design/ShowError.dart';
import 'package:onebeat_darkmode/Design/TextStyle/TextStyle.dart';
import 'package:onebeat_darkmode/Home/adminHomePages/allUsers.dart';
import 'package:onebeat_darkmode/utils/MemberShip.dart';


addMemberShip(context,Size size,String email){



  DateTime dateToday = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);


  return showDialog(context: context,
      builder: (buildContext){
      return Center(
        child: Material(
          color: Colors.transparent,
          child: InnerAddMemberShip(size: size,)
        ),
      );
      });
}


class InnerAddMemberShip extends StatefulWidget {
  const InnerAddMemberShip({Key? key, required this.size}) : super(key: key);
  final Size size;

  @override
  _InnerAddMemberShipState createState() => _InnerAddMemberShipState(size);
}

class _InnerAddMemberShipState extends State<InnerAddMemberShip> {
  final Size size;

  TextEditingController startDay = TextEditingController();
  TextEditingController startMonth= TextEditingController();
  TextEditingController startYear= TextEditingController();

  TextEditingController endDay= TextEditingController();
  TextEditingController endMonth= TextEditingController();
  TextEditingController endYear= TextEditingController();

  bool isLoading = false;

  _InnerAddMemberShipState(this.size);
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
          Text("הוספת מנוי עבור",style: assistantStyle(greenClr, 20),textAlign: TextAlign.center,),
          SizedBox(height: 5,),
          Text(AllUsers.pickedUser!.name,style: assistantStyle(Colors.white, 25),textAlign: TextAlign.center,),
          SizedBox(height: 25,),
          Row(
            children: [
              Spacer(flex: 1,),
              Padding(
                padding: const EdgeInsets.only(right:15),
                child: Align(
                    alignment: Alignment.topRight,
                    child: Text("תאריך התחלה :",style: assistantStyle(Colors.grey[400]!, 20),textAlign: TextAlign.center,textDirection: TextDirection.rtl,)),
              ),
            ],
          ),
          SizedBox(height: 25,),
          Row(

            children: [
              Spacer(flex: 1,),
              Container(
                width: 35,
                child: TextField(
                  controller: startDay,
                  style: whiteText(20),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintText: "20",
                    hintStyle:  GoogleFonts.assistant(
                      color: emptyDotClr,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Text("/",style: assistantStyle(Colors.white,17),),
              SizedBox(width: 16,),
              Container(
                width: 35,
                child: TextField(
                  controller: startMonth,
                  style: whiteText(20),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintText: "20",
                    hintStyle:  GoogleFonts.assistant(
                      color: emptyDotClr,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Text("/",style: assistantStyle(Colors.white,17),),
              SizedBox(width: 16,),
              Container(
                width: 45,
                child: TextField(
                  controller: startYear,
                  style: whiteText(20),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintText: "20",
                    hintStyle:  GoogleFonts.assistant(
                      color: emptyDotClr,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),

              Spacer(flex: 1,),
            ],
          ),
          SizedBox(height: 25,),

          Row(
            children: [
              Spacer(flex: 1,),
              Padding(
                padding: const EdgeInsets.only(right:15),
                child: Align(
                    alignment: Alignment.topRight,
                    child: Text("תאריך סיום :",style: assistantStyle(Colors.grey[400]!, 20),textAlign: TextAlign.center,textDirection: TextDirection.rtl,)),
              ),
            ],
          ),
          SizedBox(height: 25,),
          Row(

            children: [
              Spacer(flex: 1,),
              Container(
                width: 35,
                child: TextField(
                  controller: endDay,
                  style: whiteText(20),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintText: "20",
                    hintStyle:  GoogleFonts.assistant(
                      color: emptyDotClr,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Text("/",style: assistantStyle(Colors.white,17),),
              SizedBox(width: 16,),
              Container(
                width: 35,
                child: TextField(
                  controller: endMonth,
                  style: whiteText(20),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintText: "20",
                    hintStyle:  GoogleFonts.assistant(
                      color: emptyDotClr,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Text("/",style: assistantStyle(Colors.white,17),),
              SizedBox(width: 16,),
              Container(
                width: 45,
                child: TextField(
                  controller: endYear,
                  style: whiteText(20),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintText: "20",
                    hintStyle:  GoogleFonts.assistant(
                      color: emptyDotClr,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),

              Spacer(flex: 1,),
            ],
          ),
          Spacer(flex: 1,),
          isLoading ? CircularProgressIndicator(
            backgroundColor: navBarClr,
            color: greenClr,
          ) :
            button(greenClr , "הוספה" , Colors.white , BorderRadius.circular(10),size.width * 0.45,size.height * 0.04,() async {

              if(!goodDay(startDay.text, 31)){
                ShowError(context, "יום התחלה לא נכון");
                return;
              }

              if(!goodDay(startMonth.text, 12)){
                ShowError(context, "חודש התחלה לא נכון");
                return;
              }

              if(!goodDay(startYear.text, 3000)){
                ShowError(context, "שנת התחלה לא נכון");
                return;
              }


              if(!goodDay(endDay.text, 31)){
                ShowError(context, "יום סיום לא נכון");
                return;
              }

              if(!goodDay(endMonth.text, 12)){
                ShowError(context, "חודש סיום לא נכון");
                return;
              }

              if(!goodDay(endYear.text, 3000)){
                ShowError(context, "שנת סיום לא נכון");
                return;
              }




              setState(() {
                isLoading = true;
              });

              await DataBaseService.addMemberShipForUser(
                  AllUsers.pickedUser!.email,
                  MemberShip(startDay.text,
                      startMonth.text,startYear.text,
                      endDay.text,endMonth.text,endYear.text,
                      DateTime.now().millisecondsSinceEpoch));

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




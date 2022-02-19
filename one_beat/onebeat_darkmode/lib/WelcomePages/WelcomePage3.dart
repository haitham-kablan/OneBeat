

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onebeat_darkmode/DataBase/Services/DataBaseService.dart';
import 'package:onebeat_darkmode/DataBase/User/GymHeroUser.dart';
import 'package:onebeat_darkmode/Design/Accesories/Dots.dart';
import 'package:onebeat_darkmode/Design/Button/ButtonStyle.dart';
import 'package:onebeat_darkmode/Design/ColorsPallete/Pallete.dart';
import 'package:onebeat_darkmode/Design/ShowError.dart';
import 'package:onebeat_darkmode/Design/TextStyle/TextStyle.dart';
import 'package:onebeat_darkmode/Home/Home.dart';
import 'package:onebeat_darkmode/utils/SpecificMeasure.dart';

class WelcomePage3 extends StatefulWidget {
  const WelcomePage3({Key? key}) : super(key: key);

  @override
  _WelcomePage3State createState() => _WelcomePage3State();
}

class _WelcomePage3State extends State<WelcomePage3> {

  bool male = true;
  bool isLoading = false;
  bool accepted = false;
  TextEditingController age = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController height = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Material(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: backGroundClr,
          body: Column(
            children: [
              SizedBox(height: size.height * 0.05,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.chevron_left,color: Colors.white,),
                  ),
                  Text("שלב 3 מתוך 3" , style: pageHeader(20),),
                  IconButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.chevron_left,color: Colors.transparent,),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.02,),
              Text("נתונים אישיים" , style: pageSecondHeader(20),),
              SizedBox(height: size.height * 0.03,),
              Center(
                  child: Container(
                      width: size.width * 0.8,
                      child: Text("עדכן את הנתונים האישיים שלך כדי שתוכל לעקוב אחריהם ולהשיג את התוצאות שחלמת עליהן", style: GoogleFonts.assistant(
                        color: emptyDotClr,
                        fontSize: 20,
                      ) , textAlign: TextAlign.center,))),
              SizedBox(height: size.height * 0.05,),
              Padding(
                padding: const EdgeInsets.only(left: 40,right: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 40,
                      child: TextField(
                        controller: height,
                        style: greenText(17),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: "160",
                          hintStyle: GoogleFonts.assistant(
                            color: emptyDotClr,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                    Text("גובה  (ס\"מ)" , style: pageSecondHeader(17),textDirection: TextDirection.rtl,),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.02,),
              Padding(
                padding: const EdgeInsets.only(left: 30 , right: 30),
                child: Container(
                  height: 1,
                  color: emptyDotClr,
                ),
              ),
              SizedBox(height: size.height * 0.02,),
              Padding(
                padding: const EdgeInsets.only(left: 40,right: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 40,
                      child: TextField(
                        controller: weight,
                        style: greenText(17),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: "70",
                          hintStyle:  GoogleFonts.assistant(
                            color: emptyDotClr,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                    Text("משקל  (ק\"ג)" , style: pageSecondHeader(17),textDirection: TextDirection.rtl,),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.02,),
              Padding(
                padding: const EdgeInsets.only(left: 30 , right: 30),
                child: Container(
                  height: 1,
                  color: emptyDotClr,
                ),
              ),
              SizedBox(height: size.height * 0.02,),
              Padding(
                padding: const EdgeInsets.only(left: 40,right: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 40,
                      child: TextField(
                        controller: age,
                        style: greenText(17),
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
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                    Text("גיל" , style: pageSecondHeader(17),),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.03,),
              Padding(
                padding: const EdgeInsets.only(left: 30 , right: 30),
                child: Container(
                  height: 1,
                  color: emptyDotClr,
                ),
              ),
              SizedBox(height: size.height * 0.03,),
              Padding(
                padding: const EdgeInsets.only(left: 35,right: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: (){
                            setState(() {
                              male = true;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                bottomLeft: Radius.circular(5),
                              ),
                              color: male ? greenClr : Colors.transparent,
                              border: Border.all(
                                color: greenClr,
                                width: 2,
                              ),
                            ),
                            width: 60,
                            height: 27,

                            child: Center(
                              child: Text("זכר" , style: male ? whiteText(15) : greenText(15)),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            setState(() {
                              male = false;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(5),
                                bottomRight: Radius.circular(5),
                              ),
                              color: !male ? greenClr : Colors.transparent,
                              border: Border.all(
                                color: greenClr,
                                width: 2,
                              ),
                            ),
                            width: 60,
                            height: 27,

                            child: Center(
                              child: Text("נקבה" , style: !male ? whiteText(15) : greenText(15)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text("מין" , style: pageSecondHeader(17),),
                  ],
                ),
              ),
              Spacer(flex: 1,),
              isLoading ? CircularProgressIndicator(
                backgroundColor: navBarClr,
                color: greenClr,
              )
                  :button(greenClr , "התחל" , Colors.white , BorderRadius.circular(30),size.width * 0.8,size.height * 0.06,() async {

                if(age.text.isEmpty || weight.text.isEmpty || height.text.isEmpty){
                  ShowError(context, "נא מלא את כל השדות");
                  return;
                }


                  try{

                    double weightAsDouble = double.parse(weight.text);
                    if(weightAsDouble < 25 || weightAsDouble > 170){
                      ShowError(context, "משקל לא מתאים");
                      return;
                    }
                  }catch(e){
                    ShowError(context, "משקל לא מתאים");
                    return;
                  }


                  try{
                    gymHeroUser.height = height.text;
                    double heightAsDouble = double.parse(gymHeroUser.height);
                    if(heightAsDouble < 50 || heightAsDouble > 250){
                      ShowError(context, "גובה לא מתאים");
                      return;
                    }
                  }catch(e){
                    ShowError(context, "גובה לא מתאים");
                    return;
                  }

                  try{
                    gymHeroUser.age = double.parse(age.text);
                    if(gymHeroUser.age < 5 || gymHeroUser.age > 100){
                      ShowError(context, "גיל לא מתאים");
                      return;
                    }
                  }catch(e){
                    ShowError(context, "גיל לא מתאים");
                    return;
                  }

                showDialog(context: context,
                    builder: (context){
                  return acceptDialouge(size: size,weight: weight.text,male: male,height: height.text,);
                    });




              }),
              SizedBox(height: size.height * 0.05,),
              Dots(2),
              SizedBox(height: size.height * 0.05,),

            ],
          ),
        ),
      ),
    );
  }


}



class acceptDialouge extends StatefulWidget {
  final Size size;
  final bool male;
  final String weight;
  final String height;
  const acceptDialouge({Key? key, required this.size, required this.male, required this.weight, required this.height}) : super(key: key);

  @override
  _acceptDialougeState createState() => _acceptDialougeState(size,male,weight,height);
}

class _acceptDialougeState extends State<acceptDialouge> {
  final Size size;
  final bool male;
  final String weight;
  final String height;

  _acceptDialougeState(this.size, this.male, this.weight, this.height);
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return greenClr;
    }
    return greenClr;
  }
  bool accepted = false;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Center(
        child:Material(
          color: Colors.transparent,
          child: Container(
            width: size.width * 0.8,
            height: size.height * 0.8,
            decoration: BoxDecoration(
                color: backGroundClr,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 0.25,color: Colors.white)
            ),
            child: Scrollbar(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 20,),
                    Center(
                      child: Material(
                          color:Colors.transparent,
                          child: Container(
                              width: size.width * 0.7,
                              child: Text("טופס קבלת מתאמן חדש",style: assistantStyle(greenClr, 23),textAlign: TextAlign.center,))),
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          child: Text("1.  הסבר על שעות הפעילות ועל זמני החוגים",style: assistantStyle(greenClr, 15),textAlign: TextAlign.start,textDirection: TextDirection.rtl,),
                          width: size.width * 0.65,),
                        SizedBox(width: 20,),

                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          child: Text("2.  הסבר על הוראות התנהגות בתוך המועדון:",style: assistantStyle(greenClr, 15),textAlign: TextAlign.start,textDirection: TextDirection.rtl,),
                          width: size.width * 0.65,),
                        SizedBox(width: 20,),

                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          child: Text("-  יש לשמור על שקט",style: assistantStyle(Colors.white, 15),textAlign: TextAlign.start,textDirection: TextDirection.rtl,),
                          width: size.width * 0.65,),
                        SizedBox(width: 30,),

                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          child: Text("-  חובה להשתמש במגבת",style: assistantStyle(Colors.white, 15),textAlign: TextAlign.start,textDirection: TextDirection.rtl,),
                          width: size.width * 0.65,),
                        SizedBox(width: 30,),

                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          child: Text("-  אין להיכנס לשטח הקבלה ומאחורי הדלפק",style: assistantStyle(Colors.white, 15),textAlign: TextAlign.start,textDirection: TextDirection.rtl,),
                          width: size.width * 0.65,),
                        SizedBox(width: 30,),

                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          child: Text("חניה:",style: assistantStyle(Colors.white, 15),textAlign: TextAlign.start,textDirection: TextDirection.rtl,),
                          width: size.width * 0.65,),
                        SizedBox(width: 30,),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          child: Text("-  אין לחנות בכניסה למאפייה",style: assistantStyle(Colors.white, 15),textAlign: TextAlign.start,textDirection: TextDirection.rtl,),
                          width: size.width * 0.65,),
                        SizedBox(width: 30,),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          child: Text("-  אין חנייה בבניין רפיק חמזה",style: assistantStyle(Colors.white, 15),textAlign: TextAlign.start,textDirection: TextDirection.rtl,),
                          width: size.width * 0.65,),
                        SizedBox(width: 30,),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          child: Text("-  כל בעיית חנייה יש לפנות למדריך/ה שבמשמרת",style: assistantStyle(Colors.white, 15),textAlign: TextAlign.start,textDirection: TextDirection.rtl,),
                          width: size.width * 0.65,),
                        SizedBox(width: 30,),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          child: Text("3.  הקפאות:",style: assistantStyle(greenClr, 15),textAlign: TextAlign.start,textDirection: TextDirection.rtl,),
                          width: size.width * 0.65,),
                        SizedBox(width: 20,),

                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          child: Text("-  מנוי שנתי עד חודש הקפאה",style: assistantStyle(Colors.white, 15),textAlign: TextAlign.start,textDirection: TextDirection.rtl,),
                          width: size.width * 0.65,),
                        SizedBox(width: 30,),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          child: Text("-  מנוי חצי שנתי עד שבועיים הקפאה",style: assistantStyle(Colors.white, 15),textAlign: TextAlign.start,textDirection: TextDirection.rtl,),
                          width: size.width * 0.65,),
                        SizedBox(width: 30,),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          child: Text("-  מנוי 3 חודשים עד שבוע הקפאה",style: assistantStyle(Colors.white, 15),textAlign: TextAlign.start,textDirection: TextDirection.rtl,),
                          width: size.width * 0.65,),
                        SizedBox(width: 30,),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          child: Text("-  מנוי חודשי וכרטיסיות לא ניתן להקפיא",style: assistantStyle(Colors.white, 15),textAlign: TextAlign.start,textDirection: TextDirection.rtl,),
                          width: size.width * 0.65,),
                        SizedBox(width: 30,),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          child: Text("* דגשים להקפאת המנוי:",style: assistantStyle(Colors.white, 15),textAlign: TextAlign.start,textDirection: TextDirection.rtl,),
                          width: size.width * 0.65,),
                        SizedBox(width: 30,),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          child: Text("-  ההקפאה היא לתקופת המנוי ולא לכסף",style: assistantStyle(Colors.white, 15),textAlign: TextAlign.start,textDirection: TextDirection.rtl,),
                          width: size.width * 0.65,),
                        SizedBox(width: 30,),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          child: Text("-  ניתן להקפיא רק עקב מחלה , מילואים, היריון, חופשה בת יותר משבוע",style: assistantStyle(Colors.white, 15),textAlign: TextAlign.start,textDirection: TextDirection.rtl,),
                          width: size.width * 0.65,),
                        SizedBox(width: 30,),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          child: Text("3.  ביטול מנוי:",style: assistantStyle(greenClr, 15),textAlign: TextAlign.start,textDirection: TextDirection.rtl,),
                          width: size.width * 0.65,),
                        SizedBox(width: 20,),

                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          child: Text("-  מנוי שנתי, הודעה חודש מראש, חיוב 10% מסה\"כ היתרה עד סוף תקופת המנוי",style: assistantStyle(Colors.white, 15),textAlign: TextAlign.start,textDirection: TextDirection.rtl,),
                          width: size.width * 0.65,),
                        SizedBox(width: 30,),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          child: Text("-  מנוי חצי שנתי הודעה שבועיים מראש, חיוב 10% מסה\"כ היתרה עד סוף תקופת המנוי",style: assistantStyle(Colors.white, 15),textAlign: TextAlign.start,textDirection: TextDirection.rtl,),
                          width: size.width * 0.65,),
                        SizedBox(width: 30,),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          child: Text("-  מנוי 3 חודשים לא ניתן לבטל",style: assistantStyle(Colors.white, 15),textAlign: TextAlign.start,textDirection: TextDirection.rtl,),
                          width: size.width * 0.65,),
                        SizedBox(width: 30,),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          child: Text("-  מנוי חודשי לא ניתן לבטל",style: assistantStyle(Colors.white, 15),textAlign: TextAlign.start,textDirection: TextDirection.rtl,),
                          width: size.width * 0.65,),
                        SizedBox(width: 30,),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          child: Text("-  כרטיסיות לא ניתן לבטל",style: assistantStyle(Colors.white, 15),textAlign: TextAlign.start,textDirection: TextDirection.rtl,),
                          width: size.width * 0.65,),
                        SizedBox(width: 30,),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          child: Text("5.  תוספי תזונה",style: assistantStyle(greenClr, 15),textAlign: TextAlign.start,textDirection: TextDirection.rtl,),
                          width: size.width * 0.65,),
                        SizedBox(width: 20,),

                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          child: Text("6.  החתמת תצהיר בריאות",style: assistantStyle(greenClr, 15),textAlign: TextAlign.start,textDirection: TextDirection.rtl,),
                          width: size.width * 0.65,),
                        SizedBox(width: 20,),

                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          child: Text("7.  הזנת נתונים אישיים,טבלת מדידות",style: assistantStyle(greenClr, 15),textAlign: TextAlign.start,textDirection: TextDirection.rtl,),
                          width: size.width * 0.65,),
                        SizedBox(width: 20,),

                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          child: Text("8.  מתן תוכנית כללית",style: assistantStyle(greenClr, 15),textAlign: TextAlign.start,textDirection: TextDirection.rtl,),
                          width: size.width * 0.65,),
                        SizedBox(width: 20,),

                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          child: Text("אני מצהיר/ה בזאת כי קיבלתי הסבר מפורט על כל הנזכר לעיל וכי כל הסעיפים מקובלים עלי",style: assistantStyle(Colors.white, 15),textAlign: TextAlign.start,textDirection: TextDirection.rtl,),
                          width: size.width * 0.58,),
                        Checkbox(
                          checkColor: Colors.white,
                          fillColor: MaterialStateProperty.resolveWith(getColor),
                          value: accepted,
                          onChanged: (bool? value) {
                            setState(() {
                              accepted = value!;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 40,),
                    isLoading ? CircularProgressIndicator(
                      backgroundColor: navBarClr,
                      color: greenClr,
                    )
                        :button(greenClr , "התחל" , Colors.white , BorderRadius.circular(30),size.width * 0.37,size.height * 0.037,() async {

                          if(accepted == false){
                            ShowError(context, "אתה חייב לאשר את תנאי השימוש באפליקציה");
                            return;
                          }



                          gymHeroUser.fristTime = false;

                          Map<String,dynamic> map =  Map();

                          gymHeroUser.Measures.insert(0,SpecificMeasure(weight, "-", "-", "-", DateTime.now(),height));
                          gymHeroUser.goalMeasures.insert(0,SpecificMeasure("-", "-", "-", "-", DateTime.now(),"-"));

                          map["age"] = gymHeroUser.age;
//map["weight"] = gymHeroUser.weight;
                      map["height"] = gymHeroUser.height;
                      map["gender"] = male;
                      map["fristTime"] = gymHeroUser.fristTime;
                      gymHeroUser.gender = male;

                      setState(() {
                        isLoading = true;
                      });

                      await DataBaseService.updateUser(map);
                      await DataBaseService.addMeasureForUser(gymHeroUser.email, SpecificMeasure(weight, "-", "-", "-", DateTime.now(),height));
                      await DataBaseService.addGoalMeasureForUser(gymHeroUser.email, SpecificMeasure("-", "-", "-", "-", DateTime.now(),"-"));

                      setState(() {
                        isLoading = false;
                      });
                      await DataBaseService.getUserMemberShip(gymHeroUser.email);
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => Home(),
                        ),
                            (route) => false,
                      );
                    }),
                    SizedBox(height: 40,),

                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
}


import 'package:flutter/material.dart';
import 'package:onebeat_darkmode/Design/ColorsPallete/Pallete.dart';
import 'package:onebeat_darkmode/Design/TextStyle/TextStyle.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: backGroundClr,
        appBar: AppBar(
          title: Text("מי אנחנו",style: assistantStyle(Colors.white, 22),),
          backgroundColor: backGroundClr,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: size.width,
                height: size.height * 0.35,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/adham.jpeg"),fit: BoxFit.fill
                  )
                ),
              ),
              SizedBox(height: 25,),
              Text("מעדון הספורט",style: assistantStyle(Colors.white, 15),),
              Text("GYM HERO",style: assistantStyle(greenClr, 40),),
              SizedBox(height: 25,),
              Container(
                width: size.width * 0.8,
                child:
                Text("מועדון ספורט חדש בבית ג\"אן , מדריכים\\ות מקצוענים ןאנרגטיים, הציוד המתקדם בתחום,מגוון ענגק של חוגים ,ספא ועוד.. במחיר מנוי משתלם במיוחד",style: assistantStyle(Colors.white, 20),textDirection: TextDirection.rtl,textAlign: TextAlign.center,),
              ),
              SizedBox(height: 25,),
              Text("מה תקבלו אצלנו",style: assistantStyle(greenClr, 30),),
              SizedBox(height: 25,),
              Container(
                width: size.width * 0.8,
                child:
                Text("תזונה - דיאטנים קליניים לגברים ונשים.\nתוכניות אימון מותאמות אישית.\nחדר כושר ברמה של 5 כוכבים.\nשייקים טעימים עם פירות.\nמכונת שיזוף.\nוהכי חשוב יחס חם ואווירה משפחתית.",style: assistantStyle(Colors.white, 20),textDirection: TextDirection.rtl,textAlign: TextAlign.center,),
              ),
              SizedBox(height: 25,),
              Container(
                width: size.width,
                height: size.height * 0.7,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/aiham.jpeg"),fit: BoxFit.fill
                    )
                ),
              ),
              SizedBox(height: 35,),
              Text("חווית האימון ב GYM HERO",style: assistantStyle(greenClr, 30),textDirection: TextDirection.rtl,),
              SizedBox(height: 35,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset("assets/workoutPlan.png",width: 50,height: 50,),
                  Image.asset("assets/cafe.png",width: 50,height: 50,),
                  Image.asset("assets/shake.png",width: 50,height: 50,),
                ],
              ),
              SizedBox(height: 35,),
              Container(
                width: size.width * 0.8,
                child:
                Text("GYM HERO הוא לא עוד סתם חדר כושר אלא הוא משפחה.\nאצלנו מתחילים את האימון עם כוס קפה על חשבון הבית,יושבים עם המתאמן לא מעט זמן, מבינים מהי המטרה שלו ולאן הוא רוצה להגיע , מה הן החולשות שלו.\n מתכננים ביחד תוכנית אימון עבורו שמותאמת ליעדים שלו ולפי הזמן האישי שלו.\nהמתאמן אצלנו מקבל מעקב שבועי ומתעדכן כל הזמן באפליקציה שלנו כדי להפיק את התוצאות המקסימליות עבורו. ",style: assistantStyle(Colors.white, 20),textDirection: TextDirection.rtl,textAlign: TextAlign.center,),
              ),
              SizedBox(height: 50,),
              Image.asset("assets/logo.png",width: 100,height: 100,),
              SizedBox(height: 50,),

            ],
          ),
        ),
      ),
    );
  }
}

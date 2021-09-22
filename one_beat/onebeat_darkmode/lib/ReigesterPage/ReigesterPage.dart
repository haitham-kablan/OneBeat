
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:onebeat_darkmode/DataBase/Authentication/Authentication.dart';
import 'package:onebeat_darkmode/DataBase/Services/DataBaseService.dart';
import 'package:onebeat_darkmode/DataBase/User/GymHeroUser.dart';
import 'package:onebeat_darkmode/Design/Animation/PageTransition.dart';
import 'package:onebeat_darkmode/Design/Button.dart';
import 'package:onebeat_darkmode/Design/ColorsPallete/Pallete.dart';
import 'package:onebeat_darkmode/Design/InputFeild.dart';
import 'package:onebeat_darkmode/Design/ShowError.dart';
import 'package:onebeat_darkmode/Design/TextStyle/TextStyle.dart';
import 'package:onebeat_darkmode/Home/Home.dart';
import 'package:onebeat_darkmode/HomePage/HomePage.dart';
import 'package:onebeat_darkmode/Users/CurrentUser.dart';
import 'package:onebeat_darkmode/Users/TrainerUser.dart';
import 'package:onebeat_darkmode/Users/User.dart';
import 'package:onebeat_darkmode/WelcomePages/WelcomePage1.dart';

class ReigesterPage extends StatefulWidget {
  @override
  _ReigesterPageState createState() => _ReigesterPageState();
}

class _ReigesterPageState extends State<ReigesterPage> {

  TextEditingController emailControler = TextEditingController();
  TextEditingController passwordControler = TextEditingController();
  TextEditingController userNameControler = TextEditingController();
  TextEditingController verifeidPassControler = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: backGroundClr,
        body: SingleChildScrollView(
          child: Container(
            height: size.height,
            child: Column(
              children: [
                SizedBox(height: 50,),
                Center(
                  child: Text("הרשמה" , style: assistantStyle(Colors.white, 40),),

                ),
                SizedBox(height: 50,),
                Center(
                  child: InpuTextFeild(
                      "דואל",
                      Icon(Icons.email,color: Colors.grey[600]!,),
                      greyClr,
                      Colors.grey,
                      Colors.white,
                      Colors.white,EdgeInsets.only(left: 50,right: 50),emailControler),
                ),
                SizedBox(height: 20,),
                Center(
                  child: InpuTextFeild(
                      "שם משתמש",
                      Icon(Icons.account_box,color: Colors.grey[600]!,),
                      greyClr,
                      Colors.grey,
                      Colors.white,
                      Colors.white,EdgeInsets.only(left: 50,right: 50),userNameControler),
                ),
                SizedBox(height: 20,),
                Center(
                  child: InpuTextFeild(
                      "סיסמה",
                      Icon(Icons.vpn_key,color: Colors.grey[600]!,),
                      greyClr,
                      Colors.grey,
                      Colors.white,
                      Colors.white,EdgeInsets.only(left: 50,right: 50),passwordControler,obsecure: true),
                ),
                SizedBox(height: 20,),
                Center(
                  child: InpuTextFeild(
                      "אימות סיסמה",
                      Icon(Icons.vpn_key,color: Colors.grey[600]!,),
                      greyClr,
                      Colors.grey,
                      Colors.white,
                      Colors.white,EdgeInsets.only(left: 50,right: 50),verifeidPassControler,obsecure: true),
                ),
                //Spacer(flex: 1,),
                //Image.asset("assets/measureBg.png",width: 70,height: 80,),
                SizedBox(height: 150,),
                isLoading ? CircularProgressIndicator(
                  backgroundColor: navBarClr,
                  color: greenClr,
                ):
            Container(
              width: size.width * 0.4,
              height: size.height * 0.05,
              child: Material(
                elevation: 5,
                borderRadius:  BorderRadius.circular(10),
                color: backGroundClr,
                child: Center(
                  child: InkWell(
                    onTap: () async{

                      setState(() {
                        isLoading = true;
                      });

                      String email=emailControler.text;
                      String password = passwordControler.text;
                      String userName = userNameControler.text;
                      String verifiedPassword = verifeidPassControler.text;

                      if(email.isEmpty || password.isEmpty || userName.isEmpty || verifiedPassword.isEmpty){
                        setState(()  {
                          isLoading = false;
                        });
                        await ShowError(context, "אחד או יותר מהשדות שלך הם ריקים , נא מלא אותם");

                        return;
                      }

                      if(!isEmail(email)){
                        setState(()  {
                          isLoading = false;
                        });
                        await ShowError(context, "הדואל שלך אינו חוקי");
                        return;
                      }

                      String? ans = await AuthenticationService.Reigester(email, password,userName);

                      if(ans != null){
                        setState(()  {
                          isLoading = false;
                        });
                        await ShowError(context, ans);
                        return;
                      }

                      gymHeroUser = GymHeroUser.emptyUser(userName, email);

                      await AuthenticationService.Login(email, password);

                      if(gymHeroUser.fristTime){
                        Navigator.of(context).pushAndRemoveUntil(
                            CustomPageRoute(child:WelcomePage1()),
                                (Route<dynamic> route) => false);
                      }else{
                        Navigator.of(context).pushAndRemoveUntil(
                            CustomPageRoute(child:Home()),
                                (Route<dynamic> route) => false);
                      }


                      await DataBaseService.addTrainerToDb(gymHeroUser);

                      setState(()  {
                        isLoading = false;
                      });

                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:  BorderRadius.circular(10),
                        color: greenClr,
                      ),
                      width: size.width * 0.4,
                      height: size.height * 0.05,
                      child: Center(
                        child: Text("הרשמה",style: TextStyle(color: Colors.white,fontSize: 18,)),
                      ),
                    ),
                  ),
                ),
              ),
            ),
                SizedBox(height: 50,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
//
// Future SignIn(String email,String password,String userName,String verifiedPassword,context) async{
//
//   if(email.isEmpty || password.isEmpty || userName.isEmpty || verifiedPassword.isEmpty){
//     await ShowError(context, "אחד או יותר מהשדות שלך הם ריקים , נא מלא אותם");
//         return;
//   }
//
//   if(!isEmail(email)){
//     await ShowError(context, "הדואל שלך אינו חוקי");
//     return;
//   }
//
//   String? ans = await AuthenticationService.Reigester(email, password,userName);
//   if(ans != null){
//     await ShowError(context, ans);
//     return;
//   }
//
//   await AuthenticationService.Login(email, password);
//
//  await DataBaseService.addTrainerToDb(TrainerUser(userName, email, false, false, false, 20, 100, 25, 10, 3, 20, 10, 25, 100, 3));
//
//   Navigator.of(context).pushAndRemoveUntil(
//       MaterialPageRoute(builder: (context) => HomePage()),
//           (Route<dynamic> route) => false);
//
// }

bool isEmail(String string) {
  // Null or empty string is invalid
  if (string == null || string.isEmpty) {
    return false;
  }

  const pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
  final regExp = RegExp(pattern);

  if (!regExp.hasMatch(string)) {
    return false;
  }
  return true;
}
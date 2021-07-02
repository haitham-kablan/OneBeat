
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onebeat_darkmode/ColorsPallete/ColorsPallete.dart';
import 'package:onebeat_darkmode/DataBase/Authentication/Authentication.dart';
import 'package:onebeat_darkmode/Design/Button.dart';
import 'package:onebeat_darkmode/Design/InputFeild.dart';
import 'package:onebeat_darkmode/Design/ShowError.dart';
import 'package:onebeat_darkmode/HomePage/HomePage.dart';

class ReigesterPage extends StatefulWidget {
  @override
  _ReigesterPageState createState() => _ReigesterPageState();
}

class _ReigesterPageState extends State<ReigesterPage> {

  TextEditingController emailControler = TextEditingController();
  TextEditingController passwordControler = TextEditingController();
  TextEditingController userNameControler = TextEditingController();
  TextEditingController verifeidPassControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: backGroundClr,
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset('assets/topLeftLogo.png'),
              ],
            ),
            SizedBox(height: 50,),
            Center(
              child: InpuTextFeild(
                  "דואל",
                  Icon(Icons.email,color: greenClr,),
                  backGroundClr,
                  Colors.grey,
                  Colors.white,
                  Colors.white,EdgeInsets.only(left: 50,right: 50),emailControler),
            ),
            SizedBox(height: 20,),
            Center(
              child: InpuTextFeild(
                  "שם משתמש",
                  Icon(Icons.account_box,color: greenClr,),
                  backGroundClr,
                  Colors.grey,
                  Colors.white,
                  Colors.white,EdgeInsets.only(left: 50,right: 50),userNameControler),
            ),
            SizedBox(height: 20,),
            Center(
              child: InpuTextFeild(
                  "סיסמה",
                  Icon(Icons.vpn_key,color: greenClr,),
                  backGroundClr,
                  Colors.grey,
                  Colors.white,
                  Colors.white,EdgeInsets.only(left: 50,right: 50),passwordControler,obsecure: true),
            ),
            SizedBox(height: 20,),
            Center(
              child: InpuTextFeild(
                  "אימות סיסמה",
                  Icon(Icons.vpn_key,color: greenClr,),
                  backGroundClr,
                  Colors.grey,
                  Colors.white,
                  Colors.white,EdgeInsets.only(left: 50,right: 50),verifeidPassControler,obsecure: true),
            ),
            SizedBox(height: 80,),
            button(greenClr, "הרשמה", Colors.white, BorderRadius.circular(10), size.width * 0.4, size.height * 0.05,
              ()=>{
                SignIn(emailControler.text,
                    passwordControler.text,
                    userNameControler.text,
                    verifeidPassControler.text,
                    context)
              },),
          ],
        ),
      ),
    );
  }
}

Future SignIn(String email,String password,String userName,String verifiedPassword,context) async{

  if(email.isEmpty || password.isEmpty || userName.isEmpty || verifiedPassword.isEmpty){
    await ShowError(context, "אחד או יותר מהשדות שלך הם ריקים , נא מלא אותם");
        return;
  }

  if(!isEmail(email)){
    await ShowError(context, "הדואל שלך אינו חוקי");
    return;
  }

  String? ans = await AuthenticationService.Reigester(email, password,userName);
  if(ans != null){
    await ShowError(context, ans);
    return;
  }

  await AuthenticationService.Login(email, password);

  //add user to db

  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => HomePage()),
          (Route<dynamic> route) => false);

}

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
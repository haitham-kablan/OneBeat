

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:onebeat_darkmode/ColorsPallete/ColorsPallete.dart';
import 'package:onebeat_darkmode/DataBase/Authentication/Authentication.dart';
import 'package:onebeat_darkmode/Design/Button.dart';
import 'package:onebeat_darkmode/Design/InputFeild.dart';
import 'package:onebeat_darkmode/Design/ShowError.dart';
import 'package:onebeat_darkmode/HomePage/HomePage.dart';
import 'package:onebeat_darkmode/ReigesterPage/ReigesterPage.dart';
import 'package:onebeat_darkmode/Users/CurrentUser.dart';

class LogInPage extends StatefulWidget {
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  TextEditingController emailControler = TextEditingController();
  TextEditingController passwordControler = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        color: backGroundClr,
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              SizedBox(height: 50,),
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Center(
                  child: Image.asset("assets/logoandonebeat.png"),
                ),
              ),
              SizedBox(height: 70,),
              Center(
                child: InpuTextFeild(
                    "דואל",
                    Icon(Icons.mail,color: greenClr,),
                    Colors.white,
                    mainHintClr,
                    Colors.black,
                    Colors.white,EdgeInsets.only(left: 50,right: 50),emailControler),
              ),
              SizedBox(height: 20,),
              Center(
                child: InpuTextFeild(
                    "סיסמה",
                    Icon(Icons.vpn_key,color: greenClr,),
                    Colors.white,
                    mainHintClr,
                    Colors.black,
                    Colors.white,EdgeInsets.only(left: 50,right: 50),passwordControler,obsecure: true),
              ),
              SizedBox(height: 40,),
              isLoading ? CircularProgressIndicator(
                backgroundColor: navBarClr,
                color: greenClr,
              ) :
              Container(
                width: size.width * 0.4,
                height: size.height * 0.05,
                child: Material(
                  elevation: 10,
                  borderRadius:  BorderRadius.circular(10),
                  color: backGroundClr,
                  child: Center(
                    child: InkWell(
                      onTap: () async{

                        setState(() {
                          isLoading = true;
                        });

                        if (emailControler.text.isEmpty || passwordControler.text.isEmpty){
                          setState(()  {
                            isLoading = false;
                          });
                          await ShowError(context, "אחד או יותר מהשדות שלך הם ריקים , נא מלא אותם");
                          return;
                        }

                        if (!isEmail(emailControler.text)){
                          setState(()  {
                            isLoading = false;
                          });
                          await ShowError(context, "הדואל שלך אינו חוקי");
                          return;
                        }

                        String? res = await AuthenticationService.Login(emailControler.text, passwordControler.text);

                        if(res != null){
                          setState(()  {
                            isLoading = false;
                          });
                          await ShowError(context, res);
                          return;
                        }

                        await AuthenticationService.Login(emailControler.text, passwordControler.text);
                        currentUser = await AuthenticationService.getCurrentUser();
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomePage()), (Route<dynamic> route) => false);

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
                          child: Text("כניסה",style: TextStyle(color: Colors.white,fontSize: 18,)),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              RichText(
                text: TextSpan(
                  children:  <TextSpan>[
                    TextSpan(text: 'עדיין אין לך משתמש? ', style: TextStyle(color: offWhite)),
                    TextSpan(text: "לחץ כאן להרשמה",style: TextStyle(color: greenClr),
                    recognizer: TapGestureRecognizer()..onTap = () => {
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ReigesterPage()),
                      )}
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }
}

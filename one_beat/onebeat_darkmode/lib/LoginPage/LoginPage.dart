




import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:onebeat_darkmode/DataBase/Authentication/Authentication.dart';
import 'package:onebeat_darkmode/DataBase/User/GymHeroUser.dart';
import 'package:onebeat_darkmode/Design/Animation/PageTransition.dart';
import 'package:onebeat_darkmode/Design/ColorsPallete/Pallete.dart';
import 'package:onebeat_darkmode/Design/InputFeild.dart';
import 'package:onebeat_darkmode/Design/ShowError.dart';
import 'package:onebeat_darkmode/Home/Home.dart';
import 'package:onebeat_darkmode/ReigesterPage/ReigesterPage.dart';
import 'package:onebeat_darkmode/Users/CurrentUser.dart';
import 'package:onebeat_darkmode/WelcomePages/WelcomePage1.dart';

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
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: backGroundClr,
        body: SingleChildScrollView(
          child: Container(
            height: size.height,
            child: Column(
              children: [
                SizedBox(height: size.height * 0.07,),
                Center(child: Container(
                    margin: EdgeInsets.only(left: 20),child: Image.asset("assets/welcomePage1.png",width: 200,height: 200,))),
                SizedBox(height: 35,),
                Center(
                  child: InpuTextFeild(
                      "דואל",
                      Icon(Icons.mail,color: Colors.grey[600]!,),
                      greyClr,
                      emptyDotClr,
                      Colors.white,
                      Colors.white,EdgeInsets.only(left: 50,right: 50),emailControler),
                ),
                SizedBox(height: 20,),
                Center(
                  child: InpuTextFeild(
                      "סיסמה",
                      Icon(Icons.vpn_key,color: Colors.grey[600]!,),
                      greyClr,
                      emptyDotClr,
                      Colors.white,
                      Colors.white,EdgeInsets.only(left: 50,right: 50),passwordControler,obsecure: true),
                ),
                //Spacer(flex: 1,),
                SizedBox(height: 170,),
                isLoading ? CircularProgressIndicator(
                  backgroundColor: navBarClr,
                  color: greenClr,
                ) :
                Container(
                  width: size.width * 0.8,
                  height: size.height * 0.05,
                  child: Material(
                    elevation: 10,
                    borderRadius:  BorderRadius.circular(15),
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

                          gymHeroUser = await AuthenticationService.getCurrentUser();

                          if(gymHeroUser.fristTime){
                            Navigator.of(context).pushAndRemoveUntil(CustomPageRoute(
                                child: WelcomePage1()
                            ), (Route<dynamic> route) => false);
                          }else{
                            Navigator.of(context).pushAndRemoveUntil(CustomPageRoute( child:Home()), (Route<dynamic> route) => false);
                          }

                          setState(()  {
                            isLoading = false;
                          });

                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:  BorderRadius.circular(15),
                            color: greenClr,
                            border: Border.all(color: Colors.grey[800]! , width: 0.6),
                          ),
                          width: size.width * 0.56,
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
                              CustomPageRoute(child: ReigesterPage()),
                            )}
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.08,)

              ],
            ),
          ),
        ),

      ),
    );
  }
}

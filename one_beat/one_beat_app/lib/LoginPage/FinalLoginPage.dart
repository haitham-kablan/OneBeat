
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:one_beat_app/colors/colors.dart';
import 'package:one_beat_app/db_service/Authentication.dart';
import 'package:one_beat_app/reigester/FinalReigesterPage.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';

class FinalLoginPage extends StatefulWidget {
  @override
  _FinalLoginPageState createState() => _FinalLoginPageState();
}

class _FinalLoginPageState extends State<FinalLoginPage> {

  TextEditingController emial_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final LoginProvider = Provider.of<Authentication>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child:  Container(
                color: backGround,
                child: Stack(
                  children: [
                    Container(
                      width: size.width,
                      height: size.height * 0.3,
                      color: greyButtonBg,
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 5,),
                          Center(child: MainLogo()),
                          SizedBox(height: 20,),
                          Center(child: LoginProvider.errorMessage.isEmpty ? SizedBox(height: 0,): ErrorMsg(provider: LoginProvider,),),
                          Center(child: Email(email_Controler: emial_controller,)),
                          SizedBox(height: 20,),
                          Center(child: Password(controller: password_controller,)),
                          SizedBox(height: 30,),
                          Center(
                              child: LoginProvider.isLoading ?  SpinKitCircle(color: darkGreen) :
                              InkWell(
                                onTap: (){
                                  if(_formkey.currentState!.validate()){
                                    LoginProvider.Login(emial_controller.text,password_controller.text);
                                  }

                                },
                                child: Material(
                                  elevation: 10.0,
                                  borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: greyButtonBg,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.transparent,
                                    ),
                                    width: size.width * 0.8,
                                    height: size.height * 0.06,
                                    child:  Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text('כניסה' ,textDirection: TextDirection.rtl,
                                          style: TextStyle(color: greyButtonBg,fontSize: 20,fontWeight: FontWeight.bold),),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                          ),
                          SizedBox(height: 20,),
                          Center(child: ReigesterButton()),
                        ],
                      ),
                    ),
                  ],
                ),
            ),
        ),
      ),
    );
  }
}


class MainLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/MainLogo.png');
  }
}


class Heading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("ONE BEAT",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold , fontStyle: FontStyle.italic,fontSize: 45),),
        Text("מעדון הכושר בקצב שלך!",
          textDirection: TextDirection.rtl,
          style: TextStyle(color: secondHeading ,fontSize: 17, fontStyle: FontStyle.italic),),
      ],
    );
  }
}


class LogInButton extends StatefulWidget {

  final proivder;
  final email;
  final pw;
  final formkey;

  const LogInButton({Key? key, this.proivder, this.email, this.pw, this.formkey}) : super(key: key);
  @override
  _LogInButtonState createState() => _LogInButtonState(proivder,email,pw,formkey);
}

class _LogInButtonState extends State<LogInButton> {

  final provider;
  final email;
  final pw;
  final formkey;

  _LogInButtonState(this.provider, this.email, this.pw, this.formkey);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: (){
        if(formkey.currentState!.validate()){
          provider.login(email,pw);
        }

      },
      child: Material(
        elevation: 10.0,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: greyButtonBg,
            ),
            borderRadius: BorderRadius.circular(10),
            color: Colors.transparent,
          ),
          width: size.width * 0.8,
          height: size.height * 0.06,
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('כניסה' ,textDirection: TextDirection.rtl,
                   style: TextStyle(color: greyButtonBg,fontSize: 20,fontWeight: FontWeight.bold),),
            ],
          ),
        ),
      ),
    );
  }
}

class ReigesterButton extends StatefulWidget {
  @override
  _ReigesterButtonState createState() => _ReigesterButtonState();
}

class _ReigesterButtonState extends State<ReigesterButton> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>
              ChangeNotifierProvider(
                  create: (context) => Authentication(),
                  child: FinalReigesterPage()
              )
          ),
        );
      },
      child: Material(
        elevation: 10.0,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: greyButtonBg,
            ),
            borderRadius: BorderRadius.circular(10),
            color: greyButtonBg,
          ),
          width: size.width * 0.8,
          height: size.height * 0.06,
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('הרשמה' ,textDirection: TextDirection.rtl,
                style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
            ],
          ),
        ),
      ),
    );
  }
}


class ErrorMsg extends StatelessWidget {
  final provider;

  const ErrorMsg({Key? key, this.provider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        children: [
          SizedBox(height: 15,),
          Container(
            decoration: BoxDecoration(
              color: greyButtonBg,
              borderRadius: BorderRadius.circular(10),
            ),
            width: size.width * 0.85,
            child: Row(
              children: [
                IconButton(onPressed: (){
                  provider.set_ErrorMessage("");
                }, icon: Icon(Icons.close) , color: Colors.white,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(width: size.width * 0.6,child: Text(provider.errorMessage , style: TextStyle(color: Colors.white),textDirection: TextDirection.rtl,)),
                ),
              ],
            ),
          ),
          SizedBox(height: 15,),
        ],
      ),
    );
  }
}


import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:one_beat_app/HomePage/HomePagePortrait.dart';
import 'package:one_beat_app/LoginPage/FinalLoginPage.dart';
import 'package:one_beat_app/colors/colors.dart';
import 'package:one_beat_app/db_service/Authentication.dart';
import 'package:one_beat_app/tools/text_feild.dart';
import 'package:one_beat_app/users/current_user.dart';
import 'package:provider/provider.dart';

class FinalReigesterPage extends StatefulWidget {
  @override
  _FinalReigesterPageState createState() => _FinalReigesterPageState();
}

class _FinalReigesterPageState extends State<FinalReigesterPage> {
  final TextEditingController email_Controler = TextEditingController();
  final TextEditingController name_Controler = TextEditingController();
  final TextEditingController pw_Controler = TextEditingController();
  final TextEditingController pw_confirm_Controler = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  PickedFile? _image = null;

  _imgFromGallery() async {
    PickedFile? image = await ImagePicker.platform
        .pickImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _image = image;
    });
  }

  _imgFromCamera() async {
    PickedFile? image = await ImagePicker.platform
        .pickImage(source: ImageSource.camera, imageQuality: 50);

    setState(() {
      _image = image;
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: new ListTile(
                        leading: new Icon(Icons.photo_library),
                        title: new Text('גלרית תמונות'),
                        onTap: () {
                          _imgFromGallery();
                          Navigator.of(context).pop();
                        }),
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: new ListTile(
                      leading: new Icon(Icons.photo_camera),
                      title: new Text('מצלמה'),
                      onTap: () {
                        _imgFromCamera();
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final ReigesterProvider = Provider.of<Authentication>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backGround,
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 60,),
              Center(
                child: GestureDetector(
                  onTap: () {
                    _showPicker(context);
                  },
                  child: CircleAvatar(
                    radius: 55,
                    backgroundColor: greyButtonBg,
                    child: _image != null
                        ? Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Container(
                              width: 200,
                              height: 200,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: FileImage(File(_image!.path)),
                                ),
                              ),
                            ),
                          )
                        : Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    lightGreen,darkGreen
                                  ]
                                ),
                                borderRadius: BorderRadius.circular(50)),
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                            ),
                          ),
                  ),
                ),
              ),
              SizedBox(height: 35,),
              Center(child: ReigesterProvider.errorMessage.isEmpty ? SizedBox(height: 0,): ErrorMsg(provider: ReigesterProvider,),),
              SizedBox(height: 5,),
              Name(name_Controler: name_Controler,),
              SizedBox(height: 20,),
              Email(email_Controler: email_Controler),
              SizedBox(height: 20,),
              Password(controller: pw_Controler),
              SizedBox(height: 20,),
              ConfirmPassword(controller: pw_confirm_Controler, origPw: pw_Controler.text,),
              SizedBox(height: 50,),
              Center(
                child: ReigesterProvider.isLoading ? SpinKitCircle(color: darkGreen) :
                InkWell(
                  onTap: () async{
                    if(_formkey.currentState!.validate()){
                      current_user = await ReigesterProvider.Regiester(email_Controler.text, pw_Controler.text,name_Controler.text,_image);
                      if(current_user != null){
                        User? user = await ReigesterProvider.Login(email_Controler.text, pw_Controler.text);
                        Navigator.pushAndRemoveUntil<dynamic>(
                          context,
                          MaterialPageRoute<dynamic>(
                            builder: (BuildContext context) => AdminHomePagePortrait(),
                          ),
                              (route) => false,//if you want to disable back feature set to false
                        );
                      }
                    }
                  },
                  child: Material(
                    elevation: 10.0,
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: greyButtonBg,
                        ),
                        borderRadius: BorderRadius.circular(5),
                        color: greyButtonBg,
                      ),
                      width: size.width * 0.85,
                      height: size.height * 0.07,
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('הרשמה' ,textDirection: TextDirection.rtl,
                            style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Name extends StatelessWidget {
  final TextEditingController name_Controler;

  const Name({Key? key, required this.name_Controler}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text_Feild(name_Controler,(val) => val.isNotEmpty ? null : "נא הזן את השם שלך",Icon(Icons.account_circle_outlined,color: greyButtonBg,),"שם",false);
  }
}

class Email extends StatelessWidget {

  final TextEditingController email_Controler;

  const Email({Key? key, required this.email_Controler}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text_Feild(email_Controler,(val) => isEmail(val) ? null : "נא הזן כתובת מייל חוקית",Icon(Icons.email,color: greyButtonBg,),"דואר אלקטרוני",false);
  }
}

class Password extends StatelessWidget {
  final TextEditingController controller;

  const Password({Key? key, required this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Text_Feild(controller,(val) => val.isNotEmpty ? null : "נא הזן את הסיסמה שלך",Icon(Icons.vpn_key,color:greyButtonBg,),"סיסמה",true);
  }
}

class ConfirmPassword extends StatelessWidget {

  final TextEditingController controller;
  final String origPw;

  const ConfirmPassword({Key? key, required this.controller,required this.origPw}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Text_Feild(controller,(val) => (val as String) == origPw ? null : "סיסמה לא תואמת",Icon(Icons.vpn_key,color:greyButtonBg,),"אימות סיסמה",true);
  }
}
//
// class SignUp extends StatefulWidget {
//   @override
//   _SignUpState createState() => _SignUpState();
// }
//
// class _SignUpState extends State<SignUp> {
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return InkWell(
//       onTap: (){
//         if(_formkey.currentState!.validate()){
//           current_user = await ReigesterProvider.Regiester(email_Controler.text, pw_Controler.text,name_Controler.text,_image);
//           if(current_user != null){
//             User? user = await ReigesterProvider.Login(email_Controler.text, pw_Controler.text);
//             //todo : add user to data base
//             //current_user = await DataBaseService.getUserByEmail(email_Controler.text);
//           }
//         }
//       },
//       child: Material(
//         elevation: 10.0,
//         borderRadius: BorderRadius.circular(5),
//         child: Container(
//           decoration: BoxDecoration(
//             border: Border.all(
//               color: greyButtonBg,
//             ),
//             borderRadius: BorderRadius.circular(5),
//             color: greyButtonBg,
//           ),
//           width: size.width * 0.85,
//           height: size.height * 0.07,
//           child:  Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text('הרשמה' ,textDirection: TextDirection.rtl,
//                 style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
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
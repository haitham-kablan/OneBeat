
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:one_beat_app/HomePage/HomePagePortrait.dart';
import 'package:one_beat_app/WelcomePage/WelcomePagePortrait.dart';
import 'package:image_picker/image_picker.dart';
import 'package:one_beat_app/colors/colors_pallete.dart';
import 'package:one_beat_app/db_service/Authentication.dart';
import 'package:one_beat_app/db_service/dataBaseService.dart';
import 'package:one_beat_app/tools/text_feild.dart';
import 'package:one_beat_app/users/OB_USER.dart';
import 'package:one_beat_app/users/current_user.dart';
import 'package:provider/provider.dart';


class ReigesterPagePortrait2 extends StatefulWidget {
  @override
  _ReigesterPagePortraitState2 createState() => _ReigesterPagePortraitState2();
}

class _ReigesterPagePortraitState2 extends State<ReigesterPagePortrait2> {


  final TextEditingController email_Controler = TextEditingController();
  final TextEditingController name_Controler = TextEditingController();
  final TextEditingController pw_Controler = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  PickedFile? _image = null;

  _imgFromGallery() async {
    PickedFile? image = await  ImagePicker.platform.pickImage(
        source: ImageSource.gallery, imageQuality: 50
    );

    setState(() {
      _image = image;
    });
  }

  _imgFromCamera() async {
    PickedFile? image = await  ImagePicker.platform.pickImage(
        source: ImageSource.camera, imageQuality: 50
    );

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
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    final ReigesterProvider = Provider.of<Authentication>(context);
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/Reigester_Page_Portrait.png'),
          fit: BoxFit.fill,
        )
      ),
      child: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 60,),
              Image.asset('assets/logo_without_pic.png',width: 250,height: 100,),
              SizedBox(height: 10,),
              Center(
                child: GestureDetector(
                  onTap: (){
                    _showPicker(context);
                  },
                  child: CircleAvatar(
                    radius: 55,
                    backgroundColor: current_color.color.title_heading,
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
                            image: FileImage(
                              File(_image!.path)
                            ),
                          ),
                        ),
                      ),
                    )
                        : Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(50)),
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Material(
                color: Colors.transparent,
                child: ReigesterProvider.errorMessage.isEmpty ? SizedBox(height: 30,) :
                Center(
                  child: Column(
                    children: [
                      SizedBox(height: 15,),
                      Container(
                        decoration: BoxDecoration(
                          color: current_color.color.title_heading,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: size.width * 0.8,
                        child: Row(
                          children: [
                            IconButton(onPressed: (){
                              ReigesterProvider.set_ErrorMessage("");
                            }, icon: Icon(Icons.close) , color: Colors.black,),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(width: size.width * 0.6,child: Text(ReigesterProvider.errorMessage , style: TextStyle(color: Colors.black),textDirection: TextDirection.rtl,)),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15,),
                    ],
                  ),
                ),
              ),
              Text_Feild(email_Controler,(val) => isEmail(val) ? null : "נא הזן כתובת מייל חוקית",Icon(Icons.email,color: current_color.color.title_heading,),"דואר אלקטרוני",false),
              SizedBox(height: 20,),
              Text_Feild(name_Controler,(val) => val.isNotEmpty ? null : "נא הזן את השם שלך",Icon(Icons.account_circle_outlined,color: current_color.color.title_heading,),"שם",false),
              SizedBox(height: 20,),
              Text_Feild(pw_Controler,(val) => val.isNotEmpty ? null : "נא הזן את הסיסמה שלך",Icon(Icons.vpn_key,color: current_color.color.title_heading,),"סיסמה",true),
              SizedBox(height: 50,),
              Center(
                child: ReigesterProvider.isLoading ? SpinKitCircle(color: current_color.color.title_heading,): Material(
                    elevation: 10.0,
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      onTap: () async {
                        if(_formkey.currentState!.validate()){
                          current_user = await ReigesterProvider.Regiester(email_Controler.text, pw_Controler.text,name_Controler.text,_image);
                          if(current_user != null){
                            User? user = await ReigesterProvider.Login(email_Controler.text, pw_Controler.text);
                            current_user = await DataBaseService.getUserByEmail(email_Controler.text);
                          }
                        }
                      },
                      child: Container(
                        //color: current_color.color.text,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: current_color.color.title_heading,
                        ),
                        width: size.width * 0.6,
                        height: size.height * 0.06,
                        child: Center(child: Text('הרשמה' , style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.bold),),),
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
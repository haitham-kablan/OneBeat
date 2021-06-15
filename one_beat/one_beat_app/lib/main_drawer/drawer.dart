
import 'package:one_beat_app/colors/colors_pallete.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:one_beat_app/db_service/dataBaseService.dart';
import 'package:one_beat_app/users/current_user.dart';

class MainDrawer extends StatelessWidget {

  final Size size;
  final String path = current_user.profile_image_path;

  MainDrawer({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(0xffECF0F1 ),
        child: Column(
          children: [
             Container(
                width: double.infinity,
                height: size.height * 0.3,
               decoration: BoxDecoration(
                 image: DecorationImage(
                   image: AssetImage("assets/app_bar_bg.png"),
                   fit: BoxFit.fill,
                 ),
               ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    path.isEmpty ? CircleAvatar(
                      radius: 40,
                      backgroundColor: current_color.color.title_heading,
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(50)),
                        child: Icon(Icons.account_circle_outlined,color: Colors.grey,size: 35,),
                      ),)
                    :
                    FutureBuilder<String>(
                        future: DataBaseService.retreivePicture(path),
                        builder: (BuildContext context, AsyncSnapshot<String> snapshot){

                          if(snapshot.hasData){
                            return CircleAvatar(
                                radius: 40,
                                backgroundColor: current_color.color.title_heading,
                                child: Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Container(
                                    width: 80,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(snapshot.data!),
                                      ),
                                    ),
                                  ),
                                )
                            );
                          }else if (snapshot.hasError){
                            return CircleAvatar(
                              radius: 40,
                              backgroundColor: current_color.color.title_heading,
                              child: Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(50)),
                                child: Icon(Icons.account_circle_outlined,color: Colors.grey,size: 35,),
                              ),);
                          }else{
                            return CircleAvatar(
                              radius: 40,
                              backgroundColor: current_color.color.title_heading,
                              child: Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(50)),
                                child: SpinKitCircle(size: 35,color: Colors.grey,),
                              ),);
                          }

                        }
                    ),
                    SizedBox(height: 10,),
                    Text(current_user.name , style: TextStyle(color: Colors.white, fontSize: 20),),
                    Text(current_user.email , style: TextStyle(color: Colors.white, fontSize: 15),),
                    Text(current_user.email),
                  ],
                ),
              ),
            SizedBox(height: 20,),
            Directionality(
              textDirection: TextDirection.rtl,
              child: ListTile(
                leading: Icon(Icons.account_box),
                title: Text("אזור אישי"),
              ),
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text("יציאה"),
              ),
            ),
            SizedBox(height: 50,),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Image(
                  image: AssetImage("assets/adham_lgo.png"),
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}

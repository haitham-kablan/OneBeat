

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:one_beat_app/colors/colors_pallete.dart';
import 'package:one_beat_app/db_service/dataBaseService.dart';
import 'package:one_beat_app/users/OB_USER.dart';



class UsersScreen extends StatefulWidget {
  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {

  bool clients = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffECF0F1 ),
      body: Column(
        children: [
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: (){
                  setState(() {
                    clients = false;
                    print(clients);
                    return;
                  });
                },
                child: Material(
                  borderRadius: BorderRadius.circular(10),
                  elevation: 10,
                  child: Container(
                    width: size.width * 0.4,
                    height: size.height * 0.07,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        colors:[
                          Color(0xff414141),
                          Colors.black,
                        ],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                      ),
                    ),
                    child: Center(
                      child: Text("מאמנים",style: TextStyle(
                          color: clients == false ? current_color.color.title_heading : Colors.white,
                          fontSize:17
                      ),),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  setState(() {
                    clients = true;
                    print(clients);
                    return;
                  });
                },
                child: Material(
                  borderRadius: BorderRadius.circular(10),
                  elevation: 10,
                  child: Container(
                    width: size.width * 0.4,
                    height: size.height * 0.07,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        colors:[
                          Color(0xff414141),
                          Colors.black,
                        ],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                      ),
                    ),
                    child: Center(
                      child: Text("מתאמנים",style: TextStyle(
                          color: clients == true ? current_color.color.title_heading : Colors.white,
                          fontSize:17
                      ),),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20,),
          Users_list(clients: clients),

        ],
      ),
    );
  }
}



class Users_list extends StatelessWidget {

  final bool clients;

  const Users_list({Key? key, required this.clients}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final req_stream = clients == true
        ? DataBaseService.users_collection.where("privillage" , isEqualTo: Privillage.CLIENT.toString()).snapshots()
        : DataBaseService.users_collection.where("privillage" , isEqualTo: Privillage.TRAINER.toString()).snapshots();
    return Expanded(
      child: Container(
        child: StreamBuilder(
          stream: req_stream,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text('Something went wrong'));
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: current_color.color.title_heading,
                ),
              );
            }

            return Directionality(
              textDirection: TextDirection.rtl,
              child: ListView(
                children: snapshot.data.docs.map<Widget>((doc){
                  return Center(
                    child: Container(
                      child: users_tile(data: doc.data()),
                    ),
                  );
                }).toList(),
              ),
            );

          },
        ),
      ),
    );
  }
}



class users_tile extends StatelessWidget {

  final data;
  const users_tile({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(data['profile_image_path']);
    Size size = MediaQuery.of(context).size;
    return  Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      width: size.width * 0.9,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            UserImage(path:data['profile_image_path'] ),
            SizedBox(width: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(data["name"],style: TextStyle(color: Colors.black),),
                Text(data["email"],style: TextStyle(color: Colors.grey[600]),),
              ],
            ),
            Spacer(flex: 1,),
            InkWell(
              onTap: (){
                //go to new page
                print("sd");
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.keyboard_arrow_left,color: current_color.color.title_heading,),
                  Text("בקר בפרופיל",style: TextStyle(color: Colors.black,fontSize: 12),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class UserImage extends StatelessWidget {
  final String path;

  const UserImage({Key? key, required this.path}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return path.isEmpty ? CircleAvatar(
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
        :FutureBuilder<String>(
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
    );
  }
}




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onebeat_darkmode/ColorsPallete/ColorsPallete.dart';
import 'package:onebeat_darkmode/DataBase/GenerealExcerise.dart';

import 'Services/DataBaseService.dart';

class SpecificExcerise{

  final GeneralExcerise generalExcerise;
   int sets;
   int reps;

  SpecificExcerise(this.generalExcerise, this.sets, this.reps);

  Map<String,dynamic> toMap(){

    Map<String,dynamic> map = generalExcerise.toMap();
    map["sets"] = this.sets;
    map["reps"] = this.reps;

    return map;
  }

  static SpecificExcerise exceriseFromString(String string){
    String category;
    String name;
    int sets;
    int reps;

    List<String> splited = string.split("-");
    category = splited[3];
    name = splited[2];
    sets = int.parse(splited[0]);
    reps = int.parse(splited[1]);

    return SpecificExcerise(GeneralExcerise(name, category), sets, reps);
  }
}



class SpecificExceriseList extends StatelessWidget {


  final List<String> selected;
  final onPress;
  final remove;
  SpecificExceriseList({Key? key, required this.selected, required this.onPress, required this.remove}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return StreamBuilder(
      stream: DataBaseService.exceriseCollection.where("category" , whereIn: selected).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Something went wrong'));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: greenClr,
            ),
          );
        }

        return Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            height: size.height * 0.38,
            child: ListView(
              children: snapshot.data.docs.map<Widget>((doc) {
                return Center(
                  child: Container(
                    child: ExceriseSpecificTile(data: doc.data() , onPress: onPress,remove: remove,),
                  ),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}




class ExceriseSpecificTile extends StatefulWidget {

  final data;
  final onPress;
  final remove;


  const ExceriseSpecificTile({Key? key, this.data, this.onPress, this.remove}) : super(key: key);

  @override
  _ExceriseSpecificTileState createState() => _ExceriseSpecificTileState(data,onPress,remove);
}

class _ExceriseSpecificTileState extends State<ExceriseSpecificTile> with AutomaticKeepAliveClientMixin{

  final data;
  final onPress;
  final remove;
  int sets = 4;
  int reps = 10;
  bool? isChecked = false;

  _ExceriseSpecificTileState(this.data, this.onPress, this.remove);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        width: size.width * 0.8,
        decoration: BoxDecoration(
          color: backGroundClr,
          border: Border(
            bottom: BorderSide(width: 0.1,color: navBarItemsClr),
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  fillColor: MaterialStateProperty.resolveWith((states) => getColor(states)),
                  onChanged: (bool? value) {
                    if(value!){
                      onPress(SpecificExcerise(GeneralExcerise(data["name"], data["category"]), sets, reps));
                    }else{
                      remove(SpecificExcerise(GeneralExcerise(data["name"], data["category"]), sets, reps));

                    }
                    setState(() {
                      isChecked = value;
                    });
                  },
                  value: isChecked,

                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Container(
                    width: size.width * 0.6,
                    child: Align(
                      alignment: Alignment.topRight,
                      child: RichText(
                        text: TextSpan(
                          children:  <TextSpan>[
                            TextSpan(text: data["category"],style: TextStyle(color: greenClr,fontSize: 14)),
                            TextSpan(text:"  -  " + data["name"],style: TextStyle(color: offWhite,fontSize: 13))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15,),
            isChecked! ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text("????????" ,style: TextStyle(color: offWhite,fontSize: 11)),
                    Row(
                      children: [
                        IconButton(onPressed: (){
                          setState(() {
                            if(sets -1 < 0){
                              sets = 0;
                            }else{
                              sets--;
                            }
                          });
                          onPress(SpecificExcerise(GeneralExcerise(data["name"], data["category"]), sets, reps));


                        },
                            icon: Icon(Icons.arrow_downward_sharp , color:navBarItemsClr,size: 15,)),
                        Text(sets.toString(),style: TextStyle(color: greenClr,fontSize: 13)),
                        IconButton(onPressed: (){
                          setState(() {
                            sets++;
                          });
                          onPress(SpecificExcerise(GeneralExcerise(data["name"], data["category"]), sets, reps));
                        },
                            icon: Icon(Icons.arrow_upward_sharp , color: navBarItemsClr,size: 15,)),
                      ],
                    ),

                  ],
                ),
                Column(
                  children: [
                    Text("??????????" ,style: TextStyle(color: offWhite,fontSize: 11)),
                    Row(
                      children: [
                        IconButton(onPressed: (){
                          setState(() {
                            if(reps -1 < 0){
                              reps = 0;
                            }else{
                              reps--;
                            }
                          });
                          onPress(SpecificExcerise(GeneralExcerise(data["name"], data["category"]), sets, reps));
                        },
                            icon: Icon(Icons.arrow_downward_sharp , color:navBarItemsClr,size: 15,)),
                        Text(reps.toString(),style: TextStyle(color: greenClr,fontSize: 13)),
                        IconButton(onPressed: (){
                          setState(() {
                            reps++;
                          });
                          onPress(SpecificExcerise(GeneralExcerise(data["name"], data["category"]), sets, reps));
                        },
                            icon: Icon(Icons.arrow_upward_sharp , color: navBarItemsClr,size: 15,)),
                      ],
                    ),
                  ],
                ),
              ],
            ) : Container(),
            SizedBox(height: isChecked! ? 15 : 0,),


          ],
        ),
      ),
    );
  }

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return greenClr;
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}






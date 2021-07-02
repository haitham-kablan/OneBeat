
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onebeat_darkmode/ColorsPallete/ColorsPallete.dart';


Future ShowError(context,String err) async{
  Size size = MediaQuery.of(context).size;
  return showModalBottomSheet(
      context: context,
      builder: (context){
        return Container(
            height: 65,
            color: navBarClr,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // IconButton(onPressed: (){
                  //   Navigator.pop(context);
                  // }, icon: Icon(Icons.refresh,color: Colors.grey,)),
                  Container(
                    width: size.width * 0.85,
                    child:SingleChildScrollView(child: Text(err,style: TextStyle(color: Colors.grey),textDirection: TextDirection.rtl,)),),
                  SizedBox(width: 10,),
                  Icon(Icons.warning , color: greenClr,),
                ],
              ),
            ),
          );
      }
      );
}


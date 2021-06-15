import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpHereText extends StatelessWidget {

  Color text_color;
  Widget go_to;
  late TextStyle defaultStyle;
  late TextStyle linkStyle;

  SignUpHereText(this.text_color,this.go_to){
    defaultStyle = TextStyle(color: text_color, fontSize: 15 );
    linkStyle = TextStyle(color: text_color , fontSize: 15 , fontWeight: FontWeight.bold , decoration: TextDecoration.underline);

  }


  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(text: 'אין לך עדיין משתמש?',
            style: defaultStyle,),
          TextSpan(
              text: 'לחץ כאן להירשם',
              style: linkStyle,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => go_to),
                  );
                }),
        ],
      ),
    );
  }


}

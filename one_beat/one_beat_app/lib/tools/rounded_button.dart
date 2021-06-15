
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class rounded_button extends StatelessWidget {

  final String text;
  final Widget go_to;
  final Color bg_clr;

  rounded_button(this.text,this.go_to,this.bg_clr){}

  @override
  Widget build(BuildContext context) {
    return TextButton(
        child: Padding(
          padding: const EdgeInsets.only(left: 10 , right: 10),
          child: Text(
              text,
              style: TextStyle(fontSize: 14 , color: Colors.white)
          ),
        ),
        style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
            backgroundColor: MaterialStateProperty.all<Color>(bg_clr),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                )
            )
        ),
        onPressed: () => null
    );
  }
}

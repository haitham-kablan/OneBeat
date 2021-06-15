import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:one_beat_app/colors/colors_pallete.dart';

class Text_Feild extends StatelessWidget {

  final TextEditingController Controler;
  final validator;
  final Icon icon;
  final String hint_text;
  final bool obsecure;

  Text_Feild(this.Controler,this.validator,this.icon,this.hint_text,this.obsecure) {}


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Opacity(
        opacity: 1,
        child: Material(
          elevation: 10.0,
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10.0),
          child: TextFormField(
            obscureText: obsecure,
            style: TextStyle(color: Colors.white),
            controller: Controler,
            validator: validator,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: current_color.color.title_heading, width: 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1.0),
                ),
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(vertical: 20 , horizontal: 10),
                hintText: hint_text,
                hintStyle: TextStyle(color: Colors.grey),
                hintTextDirection: TextDirection.rtl,
                suffixIcon: icon

            ),
          ),
        ),
      ),
    );
  }
}

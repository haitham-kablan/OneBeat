
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class current_color{
  static main_theme color = light_theme();
}
abstract class main_theme{

  Color background_color = Colors.black;
  Color title_heading = Colors.black;
  Color text = Colors.black;
  Color assets = Colors.black;


}

class dark_theme extends main_theme{

  dark_theme(){
    background_color = Color(0xff000000);
    title_heading = Color(0xffa7d129);
    text = Color(0xffffffff);
  }


}


class light_theme extends main_theme{

  light_theme(){
    background_color = Color(0xff474b4f);
    title_heading = Color(0xffefcc00);
    text = Color(0xff4D6268);
    assets = Color(0xffF4F4F4);

  }


}
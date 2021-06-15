
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:one_beat_app/colors/colors_pallete.dart';

class LoadingPagePortrait extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Loading_Page_Portrait.png'),
            fit: BoxFit.fill,
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/LOADING_PAGE_LOGO_PROTRAIT.png' , height: 250 ,width: 250,),
            SpinKitWave(
        color: current_color.color.title_heading,
        size: 40.0,
      ),
          ],
        ),

      );

  }
}

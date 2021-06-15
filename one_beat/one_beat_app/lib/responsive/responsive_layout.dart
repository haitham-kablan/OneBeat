//
//
// import 'package:flutter/cupertino.dart';
// import 'package:one_beat_app/responsive/breakpoints.dart';
//
// class ResponsiveLayout extends StatelessWidget {
//
//   final Widget mobilePortrait;
//   final Widget mobileLandscape;
//   final Widget desktop;
//
//   const ResponsiveLayout({Key? key, required this.mobilePortrait, required this.mobileLandscape, required this.desktop}) : super(key: key);
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//
//     Orientation orientation = MediaQuery.of(context).orientation;
//     //TODO : fix this
//     return LayoutBuilder(builder: (context , constrains){
//       if (constrains.maxWidth < kDesktopBreakPoint){
//         return orientation == Orientation.portrait ? mobilePortrait : mobileLandscape;
//       }else{
//         return desktop;
//       }
//
//     });
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircleProgress extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    Paint cricle = Paint()
        ..strokeWidth = 5
        ..color = Colors.red
        ..style = PaintingStyle.stroke;

    Offset center = Offset(size.width/2 , size.height/2);
    double raduis = 150;
    canvas.drawCircle(center, raduis, cricle);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LSCustomPainter extends CustomPainter{
  @override
  void paint(Canvas canvas,Size size){
    Paint paint=Paint()..color=Colors.greenAccent..style=PaintingStyle.fill;
    Path path=Path()..moveTo(0, 20);
    path.quadraticBezierTo(size.width*0.20, 0, size.width*0.35, 0);
    path.quadraticBezierTo(size.width*0.40, 0, size.width*0.40, 20);
    path.arcToPoint(Offset(size.width*0.60,20),radius: Radius.circular(10.0)
        ,clockwise: false);
    path.quadraticBezierTo(size.width*0.60, 0, size.width*0.65, 0);
    path.quadraticBezierTo(size.width*0.80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawShadow(path, Colors.yellow,5, true);
    canvas.drawPath(path, paint);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate){
    return false;
  }
}
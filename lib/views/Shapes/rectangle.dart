import 'package:flutter/material.dart';

class RectanglePainter extends CustomPainter {
  // variable for the start and the sides of the rectangles
  final offSetX;
  final offSetY;
  final breadth;
  final length;

  RectanglePainter(this.offSetX, this.offSetY, this.breadth, this.length);
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;
    //a rectangle
    canvas.drawRect(Offset(offSetX, offSetY) & Size(breadth, length), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
import 'package:flutter/material.dart';

class CirclePainter extends CustomPainter {
  // variable for the start and the radius of the circle
  final offSetx;
  final offSety;
  final radius;

  CirclePainter(this.offSetx, this.offSety, this.radius);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.white
    ..strokeWidth = 3
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round;
    //a circle
    canvas.drawCircle(Offset(offSetx, offSety), radius, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
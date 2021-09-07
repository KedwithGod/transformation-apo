import 'package:flutter/material.dart';

class TriangleShape extends CustomPainter {
  // create variable to hold the points for x and y axis
  final pointAx;
  final pointAy;
  final pointBx;
  final pointBy;
  final pointCx;
  final pointCy;
  final OffSetx;
  final OffSety;


  TriangleShape(this.OffSetx, this.OffSety, this.pointAx, this.pointAy,
      this.pointBx, this.pointBy, this.pointCx, this.pointCy);

  @override
  void paint(Canvas canvas, Size size) {
  
    Paint paint_0 = new Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    Path path_0 = Path();
    path_0.moveTo(OffSetx, OffSety);
    path_0.moveTo(pointBx,-pointBy);
    path_0.lineTo(pointCx, -pointCy);
    path_0.lineTo(pointAx,-pointAy);
    path_0.lineTo(pointBx,-pointBy);
    path_0.lineTo(pointBx,-pointBy);
    path_0.close();
    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

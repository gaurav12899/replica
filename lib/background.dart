import 'package:flutter/material.dart';

class Background extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var height = size.height;
    var width = size.width;
    var paint = Paint();
    Path mainBackground = Path();
    mainBackground.addRect(Rect.fromLTRB(0, 0, width, height));
    paint.color = Colors.white;
    canvas.drawPath(mainBackground, paint);

    Path oval = Path();
    oval.moveTo(0, 0);
    oval.lineTo(0, height * .15);
    // oval.lineTo(width, height * .1);

    oval.quadraticBezierTo(width * .5, height * .25, width, height * .15);
    oval.lineTo(width, 0);

    oval.close();
    paint.color = Colors.blue.shade100;
    canvas.drawPath(oval, paint);

    Path secondOval = Path();
    secondOval.moveTo(0, height);
    secondOval.lineTo(0, height * .75);
    secondOval.quadraticBezierTo(width * .5, height * .6, width, height * .75);
    secondOval.lineTo(width, height);

    secondOval.close();
    paint.color = Colors.blue.shade100;
    canvas.drawPath(secondOval, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}

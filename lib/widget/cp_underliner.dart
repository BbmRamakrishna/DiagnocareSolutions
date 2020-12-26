import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CPUnderliner extends CustomPainter {
  Color lineColor;
  CPUnderliner({@optionalTypeArgs this.lineColor = Colors.black});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = this.lineColor;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 1.0;

    var path = Path()
      ..moveTo(0, size.height)
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

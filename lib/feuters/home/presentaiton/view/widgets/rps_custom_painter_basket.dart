import 'package:flutter/material.dart';

class RPSCustomPainterBasket extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Layer 1

    Paint paint_stroke_0 = Paint()
      ..color = const Color.fromARGB(255, 186, 186, 186)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.0500000, size.height * 0.9400000);
    path_0.quadraticBezierTo(size.width * 0.0166667, size.height * 0.9348667,
        size.width * 0.0166667, size.height * 0.8000000);
    path_0.lineTo(size.width * 0.0166667, size.height * 0.6656000);
    path_0.quadraticBezierTo(size.width * 0.0414333, size.height * 0.6350000,
        size.width * 0.0421833, size.height * 0.5017333);
    path_0.quadraticBezierTo(size.width * 0.0414333, size.height * 0.3654000,
        size.width * 0.0162333, size.height * 0.3393333);
    path_0.lineTo(size.width * 0.0150000, size.height * 0.2000000);
    path_0.quadraticBezierTo(size.width * 0.0178667, size.height * 0.0648667,
        size.width * 0.0500000, size.height * 0.0666667);
    path_0.cubicTo(
        size.width * 0.2750000,
        size.height * 0.0666667,
        size.width * 0.7250000,
        size.height * 0.0666667,
        size.width * 0.9500000,
        size.height * 0.0666667);
    path_0.quadraticBezierTo(size.width * 0.9844000, size.height * 0.0677333,
        size.width * 0.9833333, size.height * 0.2000000);
    path_0.lineTo(size.width * 0.9824667, size.height * 0.3306667);
    path_0.quadraticBezierTo(size.width * 0.9594667, size.height * 0.3640000,
        size.width * 0.9604333, size.height * 0.5004000);
    path_0.quadraticBezierTo(size.width * 0.9604167, size.height * 0.6283333,
        size.width * 0.9822167, size.height * 0.6584667);
    path_0.lineTo(size.width * 0.9833333, size.height * 0.8000000);
    path_0.quadraticBezierTo(size.width * 0.9833500, size.height * 0.9314667,
        size.width * 0.9500000, size.height * 0.9400000);
    path_0.cubicTo(
        size.width * 0.7250000,
        size.height * 0.9400000,
        size.width * 0.7250000,
        size.height * 0.9400000,
        size.width * 0.0500000,
        size.height * 0.9400000);
    path_0.close();

    canvas.drawPath(path_0, paint_stroke_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

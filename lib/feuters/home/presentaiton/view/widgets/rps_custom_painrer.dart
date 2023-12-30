import 'package:flutter/material.dart';

class RPSCustomPainter extends CustomPainter {
  RPSCustomPainter({required this.color});
  final Color color;
  @override
  void paint(Canvas canvas, Size size) {
    // Layer 1

    Paint paint_fill_0 = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_0 = Path();
    path_0.moveTo(0, size.height);
    path_0.lineTo(0, size.height * 0.6000000);
    path_0.quadraticBezierTo(size.width * 0.0006167, size.height * 0.4019000,
        size.width * 0.0327000, size.height * 0.3948000);
    path_0.quadraticBezierTo(size.width * 0.1286917, size.height * 0.3961000,
        size.width * 0.4166667, size.height * 0.4000000);
    path_0.quadraticBezierTo(size.width * 0.4336500, size.height * -0.0014000,
        size.width * 0.5000667, size.height * -0.0021000);
    path_0.quadraticBezierTo(size.width * 0.5646833, size.height * 0.0005000,
        size.width * 0.5833333, size.height * 0.4000000);
    path_0.quadraticBezierTo(size.width * 0.8709833, size.height * 0.4000000,
        size.width * 0.9668667, size.height * 0.4000000);
    path_0.quadraticBezierTo(size.width * 1.0011333, size.height * 0.3950000,
        size.width, size.height * 0.6000000);
    path_0.lineTo(size.width, size.height);
    path_0.lineTo(0, size.height);
    path_0.close();

    canvas.drawPath(path_0, paint_fill_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

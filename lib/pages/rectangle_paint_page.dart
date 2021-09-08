import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class RectanglePaintPage extends StatelessWidget {
  const RectanglePaintPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        painter: RectanglePainter(),
        size: MediaQuery.of(context).size,
      ),
    );
  }
}

class RectanglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // two points for opposite primary angles
    Offset _pointA = Offset(size.width * 1 / 6, size.height * 1 / 4);
    Offset _pointB = Offset(size.width * 5 / 6, size.height * 1 / 1.5);

    Paint _rectanglePainter = Paint()
      ..color = Colors.purple
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8
      ..strokeCap = StrokeCap.round
      ..shader =
          ui.Gradient.linear(_pointA, _pointB, [Colors.blue, Colors.red]);

    final _rect = Rect.fromPoints(_pointA, _pointB);

    canvas.drawRect(_rect, _rectanglePainter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

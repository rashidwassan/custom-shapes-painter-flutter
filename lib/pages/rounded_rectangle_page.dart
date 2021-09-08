import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class RoundedRectanglePaintPage extends StatelessWidget {
  const RoundedRectanglePaintPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        painter: RoundedRectanglePainter(),
        size: MediaQuery.of(context).size,
      ),
    );
  }
}

class RoundedRectanglePainter extends CustomPainter {
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
          ui.Gradient.linear(_pointA, _pointB, [Colors.pink, Colors.purple]);

    final _rect = Rect.fromPoints(_pointA, _pointB);
    final _rRect = RRect.fromRectAndRadius(_rect, const Radius.circular(12));

    canvas.drawRRect(_rRect, _rectanglePainter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

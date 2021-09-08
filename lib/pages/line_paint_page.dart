import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class LinePaintPage extends StatelessWidget {
  const LinePaintPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        painter: LinePainter(),
        size: MediaQuery.of(context).size,
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // two points for horizontal line
    Offset _pointA = Offset(size.width * 1 / 6, size.height * 1 / 2);
    Offset _pointB = Offset(size.width * 5 / 6, size.height * 1 / 2);

    // two points for vertical line
    Offset _pointC = Offset(size.width * 1 / 2, size.height * 1 / 6);
    Offset _pointD = Offset(size.width * 1 / 2, size.height * 5 / 6);

    Paint _linePainter = Paint()
      ..color = Colors.purple
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8
      ..strokeCap = StrokeCap.round
      ..shader =
          ui.Gradient.linear(_pointA, _pointB, [Colors.blue, Colors.red]);

    canvas.drawLine(_pointA, _pointB, _linePainter);
    canvas.drawLine(_pointC, _pointD, _linePainter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

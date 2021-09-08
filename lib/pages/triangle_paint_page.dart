import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class TrianglePaintPage extends StatelessWidget {
  const TrianglePaintPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        painter: TrianglePainter(),
        size: MediaQuery.of(context).size,
      ),
    );
  }
}

class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint _triangePainter = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8
      ..shader = ui.Gradient.linear(
          const Offset(0, 0),
          Offset(size.width / 2, size.height),
          [Colors.purple.shade300, Colors.green]);

    final Path _path = Path();

    // moving path to start position
    _path.moveTo(size.width / 2, size.height / 4);

    _path.lineTo(size.width * 1 / 6, size.height * 3 / 4);
    _path.lineTo(size.width * 1 / 6, size.height * 3 / 4);
    _path.lineTo(size.width * 5 / 6, size.height * 3 / 4);
    _path.close();

    canvas.drawPath(_path, _triangePainter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

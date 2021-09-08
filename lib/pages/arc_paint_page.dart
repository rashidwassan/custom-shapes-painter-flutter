import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class ArcPaintPage extends StatelessWidget {
  const ArcPaintPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        painter: ArchPainter(),
        size: MediaQuery.of(context).size,
      ),
    );
  }
}

class ArchPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // two points for opposite primary angles
    Offset _pointA = Offset(size.width * 1 / 4, size.height * 1 / 4);
    Offset _pointB = Offset(size.width * 5 / 6, size.height * 1 / 1.5);

    final Paint _archPainter = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8
      ..strokeCap = StrokeCap.round
      ..shader =
          ui.Gradient.linear(_pointA, _pointB, [Colors.orange, Colors.yellow]);

    final Path _arch1 = Path();

    _arch1.moveTo(size.width * 0.2, size.height * 0.2);

    _arch1.arcToPoint(Offset(size.width * 0.8, size.height * 0.2),
        radius: const Radius.elliptical(50, 50), clockwise: false);

    canvas.drawPath(_arch1, _archPainter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

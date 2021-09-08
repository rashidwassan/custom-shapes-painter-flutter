import 'package:flutter/material.dart';

class CirclePaintPage extends StatelessWidget {
  const CirclePaintPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
          painter: CirclePainter(), size: MediaQuery.of(context).size),
    );
  }
}

class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    //center point for circle
    Offset _center = Offset(size.width / 2, size.height / 2);

    Paint _circlePainter = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8;

    canvas.drawCircle(_center, 120, _circlePainter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ImagePaintPage extends StatefulWidget {
  const ImagePaintPage({Key? key}) : super(key: key);

  @override
  State<ImagePaintPage> createState() => _ImagePaintPageState();
}

class _ImagePaintPageState extends State<ImagePaintPage> {
  ui.Image? image;

  @override
  void initState() {
    super.initState();
    loadImage('assets/img.jpg');
  }

  loadImage(String imagePath) async {
    // loading raw image from assets
    final data = await rootBundle.load(imagePath);
    final bytes = data.buffer.asUint8List();
    final image = await decodeImageFromList(bytes);

    setState(() => this.image = image);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: image == null
          ? const CircularProgressIndicator()
          : FittedBox(
              child: SizedBox(
                width: image!.width.toDouble(),
                height: image!.height.toDouble(),
                child: CustomPaint(
                  painter: ImagePainter(image!),
                  //size: MediaQuery.of(context).size,
                ),
              ),
            ),
    );
  }
}

class ImagePainter extends CustomPainter {
  const ImagePainter(this.image);
  final ui.Image image;

  @override
  void paint(ui.Canvas canvas, ui.Size size) {
    final _imagePaint = Paint();

    canvas.drawImage(image, Offset.zero, _imagePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

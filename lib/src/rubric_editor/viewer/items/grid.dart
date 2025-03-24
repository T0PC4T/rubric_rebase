import 'package:flutter/material.dart';

class GridPainter extends CustomPainter {
  final double pixelsPerLine;
  final Color canvasColor;
  final Color gridColor;
  final Offset offset;

  GridPainter({
    required this.canvasColor,
    required this.gridColor,
    required this.offset,
    this.pixelsPerLine = 0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (pixelsPerLine == 0) {
      return;
    }

    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..color = canvasColor,
    );
    Paint paint = Paint()
      ..color = gridColor
      ..strokeWidth = 2;

    canvas.drawLine(
        Offset(offset.dx, 0), Offset(offset.dx, size.height), paint);
    canvas.drawLine(Offset(0, offset.dy), Offset(size.width, offset.dy), paint);

    canvas.drawLine(Offset(size.width - offset.dx, 0),
        Offset(size.width - offset.dx, size.height), paint);
    canvas.drawLine(Offset(0, size.height - offset.dy),
        Offset(size.width, size.height - offset.dy), paint);

    paint = Paint()
      ..color = gridColor.withAlpha(50)
      ..strokeWidth = 2;

    for (double i = offset.dx;
        i <= size.width - offset.dx;
        i += pixelsPerLine) {
      canvas.drawLine(
          Offset(i, offset.dy), Offset(i, size.height - offset.dy), paint);
    }
    for (double i = offset.dy;
        i <= size.height - offset.dy;
        i += pixelsPerLine) {
      canvas.drawLine(
          Offset(offset.dx, i), Offset(size.width - offset.dx, i), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

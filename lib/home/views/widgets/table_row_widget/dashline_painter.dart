import 'dart:ui';

import 'package:flutter/material.dart';

class DashLinePainter extends CustomPainter {
  final double progress;
  final Color color;

  DashLinePainter({
    required this.progress,
    this.color = Colors.black,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke
      ..strokeJoin = StrokeJoin.round;

    var path = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width * progress, size.height);

    Path dashPath = Path();

    double dashWidth = 5.0;
    double dashSpace = 5.0;
    double distance = 0.0;

    for (PathMetric pathMetric in path.computeMetrics()) {
      while (distance < pathMetric.length) {
        dashPath.addPath(
          pathMetric.extractPath(distance, distance + dashWidth),
          Offset.zero,
        );
        distance += dashWidth;
        distance += dashSpace;
      }
    }
    canvas.drawPath(dashPath, paint);
  }

  @override
  bool shouldRepaint(DashLinePainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}

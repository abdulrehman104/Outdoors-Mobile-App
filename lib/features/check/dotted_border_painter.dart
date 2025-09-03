import 'package:flutter/material.dart';
import 'dart:ui';

class DottedBorderPainter extends CustomPainter {
  final bool small;

  DottedBorderPainter({this.small = false});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF466B00)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    const dashWidth = 6.0;
    const dashSpace = 4.0;
    const cornerRadius = 20.0;

    final adjustedWidth = small ? size.width : size.width;
    final adjustedHeight = small ? size.height : 120.0;

    final path = Path()
      ..moveTo(0, cornerRadius)
      ..lineTo(0, adjustedHeight - cornerRadius)
      ..arcToPoint(
        Offset(cornerRadius, adjustedHeight),
        radius: const Radius.circular(cornerRadius),
        clockwise: false,
      )
      ..lineTo(adjustedWidth - cornerRadius, adjustedHeight)
      ..arcToPoint(
        Offset(adjustedWidth, adjustedHeight - cornerRadius),
        radius: const Radius.circular(cornerRadius),
        clockwise: false,
      )
      ..lineTo(adjustedWidth, cornerRadius)
      ..arcToPoint(
        Offset(adjustedWidth - cornerRadius, 0),
        radius: const Radius.circular(cornerRadius),
        clockwise: false,
      )
      ..lineTo(cornerRadius, 0)
      ..arcToPoint(
        Offset(0, cornerRadius),
        radius: const Radius.circular(cornerRadius),
        clockwise: false,
      );

    final dashPath = Path();
    for (PathMetric metric in path.computeMetrics()) {
      double distance = 0.0;
      while (distance < metric.length) {
        dashPath.addPath(
          metric.extractPath(distance, distance + dashWidth),
          Offset.zero,
        );
        distance += dashWidth + dashSpace;
      }
    }

    canvas.drawPath(dashPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
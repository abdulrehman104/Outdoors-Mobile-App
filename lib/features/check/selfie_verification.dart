import 'package:flutter/material.dart';
import 'dart:ui';

class SelfieVerificationScreen extends StatelessWidget {
  const SelfieVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Text(
              "Check In Process",
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Progress",
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
                Text(
                  "Step 2 of 3",
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Container(
              height: 4,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 4,
                  width: MediaQuery.of(context).size.width * 0.66,
                  decoration: BoxDecoration(
                    color: const Color(0xFF61181D),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              "Oakwood Apartments",
              style: TextStyle(
                  color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Row(
              children: const [
                Icon(Icons.location_on, color: Colors.white54, size: 16),
                SizedBox(width: 4),
                Text(
                  "123 Oak Street, Unit 4B",
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Center(
              child: Column(
                children: [
                  Icon(Icons.camera_alt, color: Colors.green, size: 48),
                  SizedBox(height: 12),
                  Text(
                    "Selfie Verification",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "Take a Selfie to Verify Check-In at This Location",
                    style: TextStyle(color: Colors.white54, fontSize: 13),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.60,
                height: 120,
                child: CustomPaint(
                  painter: DottedBorderPainter(),
                  child: Container(
                    color: Colors.transparent,
                    child: const Center(
                      child: Icon(Icons.camera, size: 42, color: Colors.green),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 60),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFF466B00),
                    width: 3,
                  ),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.info_outline, color: Colors.white, size: 18),
                    SizedBox(width: 4),
                    Flexible(
                      child: Text(
                        "Position your face within the circle frame and tap capture.",
                        style: TextStyle(
                            color: Color(0xFF466B00),
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(width: 4),
                    Icon(Icons.check_circle, color: Color(0xFF466B00), size: 18),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: "Distance From Property: ",
                      style: TextStyle(
                        color: Color(0xFF888888),
                        fontSize: 11,
                      ),
                    ),
                    WidgetSpan(
                      child: SizedBox(width: 140),
                    ),
                    TextSpan(
                      text: "8km away",
                      style: TextStyle(
                        color: Color(0xFF466B00),
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 100),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF61181D),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "Capture & Confirm",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

// Custom Painter for Dotted Border with Rounded Corners
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
import 'package:flutter/material.dart';
import 'dart:ui';

class LocationVerificationScreen extends StatelessWidget {
  const LocationVerificationScreen({super.key});

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
          "Check In Process",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Text(
              "Step 1 of 3",
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
            // Progress Bar
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
                  width: MediaQuery.of(context).size.width * 0.33,
                  decoration: BoxDecoration(
                    color: const Color(0xFF61181D),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Property Details
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
            // Location Verification
            const Center(
              child: Column(
                children: [
                  Icon(Icons.location_pin, color: Colors.green, size: 48),
                  SizedBox(height: 12),
                  Text(
                    "Location Verification",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "We Need To Verify You’re At The Correct Property Location.",
                    style: TextStyle(color: Colors.white54, fontSize: 13),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),
            // Map Preview Box with Custom Dotted Border
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.60,
                height: 120,
                child: CustomPaint(
                  painter: DottedBorderPainter(),
                  child: Container(
                    color: Colors.transparent,
                    child: const Center(
                      child: Icon(Icons.navigation, size: 42, color: Colors.green),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Geofence Status + Distance From Property
            Center(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 70),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFF466B00),
                        width: 3, // Increased border width
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.info_outline, color: Colors.white, size: 18),
                        SizedBox(width: 4),
                        Text(
                          "Within Geofence",
                          style: TextStyle(
                              color: Color(0xFF466B00),
                              fontSize: 14, // keep original size
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(width: 4),
                        Icon(Icons.check_circle,
                            color: Color(0xFF466B00), size: 18),
                      ],
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    "Distance From Property: 8km away",
                    style: TextStyle(
                      color: Color(0xFF888888),
                      fontSize: 11, // smaller only here
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            // Continue Button
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
                onPressed: () {
                  // Navigate to Selfie Screen
                },
                child: const Text(
                  "Continue to Selfie",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
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

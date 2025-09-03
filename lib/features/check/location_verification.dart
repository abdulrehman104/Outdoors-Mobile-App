import 'package:flutter/material.dart';
import 'dotted_border_painter.dart';

class LocationVerificationScreen extends StatelessWidget {
  final VoidCallback onContinue;

  const LocationVerificationScreen({super.key, required this.onContinue});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                "Step 1 of 3",
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
                width: MediaQuery.of(context).size.width * 0.33,
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
          Center(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 70),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xFF466B00),
                      width: 3,
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
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(width: 4),
                      Icon(Icons.check_circle,
                          color: Color(0xFF466B00), size: 18),
                    ],
                  ),
                ),
                const SizedBox(height: 6),
                RichText(
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
                        child: SizedBox(width: 100),
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
              ],
            ),
          ),
          const SizedBox(height: 90),
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
              onPressed: onContinue,
              child: const Text(
                "Continue to Selfie",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
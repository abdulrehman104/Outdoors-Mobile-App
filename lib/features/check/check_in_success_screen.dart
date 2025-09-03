import 'package:flutter/material.dart';
import 'start_task.dart'; // Import the StartTaskScreen

class CheckInSuccessScreen extends StatelessWidget {
  final VoidCallback onContinue;

  const CheckInSuccessScreen({super.key, required this.onContinue});

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
                "Step 3 of 3",
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
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: const Color(0xFFC22E2E),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            "Oakwood Apartments",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
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
          const SizedBox(height: 40),
          Center(
            child: Column(
              children: const [
                Icon(Icons.check_circle_outline,
                    color: Color(0xFF466B00), size: 56),
                SizedBox(height: 16),
                Text(
                  "Check-In Successful!",
                  style: TextStyle(
                    color: Color(0xFF466B00),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "You're Now Ready To Start Your Tasks At Oakwood Apartments.",
                  style: TextStyle(color: Colors.white60, fontSize: 13),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 60),
              ],
            ),
          ),
          Column(
            children: const [
              Row(
                children: [
                  Icon(Icons.check_circle_outline,
                      color: Color(0xFF466B00), size: 18),
                  SizedBox(width: 8),
                  Text(
                    "Location Verified",
                    style: TextStyle(color: Color(0xFF466B00), fontSize: 14),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Icon(Icons.check_circle_outline,
                      color: Color(0xFF466B00), size: 18),
                  SizedBox(width: 8),
                  Text(
                    "Identity Confirmed",
                    style: TextStyle(color: Color(0xFF466B00), fontSize: 14),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Icon(Icons.access_time, color: Colors.white, size: 18),
                  SizedBox(width: 8),
                  Text(
                    "Check-In Time: 18:00:28",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
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
                // Call the provided onContinue callback
                onContinue();
                // Navigate to StartTaskScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const StartTaskScreen()),
                );
              },
              child: const Text(
                "Start Tasks",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
          const SizedBox(height: 80),
        ],
      ),
    );
  }
}
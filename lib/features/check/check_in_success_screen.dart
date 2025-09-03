import 'package:flutter/material.dart';

class CheckInSuccessScreen extends StatelessWidget {
  const CheckInSuccessScreen({super.key});

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
        title: const Text(""),
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
            /// Progress header
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

            /// Progress bar
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
                    color: const Color(0xFFC22E2E), // Red for progress
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),

            /// Location title
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

            /// Success section
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

            /// Status list
            Column(
              children: const [
                /// Completed step
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

                /// Completed step
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

                /// Pending step
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

            /// Button
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
                  // TODO: Navigate to task screen
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
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: CheckInSuccessScreen(),
  ));
}

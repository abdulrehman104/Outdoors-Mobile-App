import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  const Icon(Icons.emoji_events, color: Color(0xFF76B500), size: 40),
                  const SizedBox(height: 8),
                  const Text(
                    "Great Job!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "Your Visit Has Been Submitted Successfully",
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 32,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF61181D),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Visit Completed",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Oakwood Apartments",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.white54, size: 16),
                    SizedBox(width: 4),
                    Text(
                      "123 Oak Street, Unit 4B",
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Column(
                  children: [
                    Text(
                      "6",
                      style: TextStyle(color: Color(0xFF76B500), fontSize: 18),
                    ),
                    Text(
                      "Tasks Completed",
                      style: TextStyle(color: Colors.white70, fontSize: 12),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "15",
                      style: TextStyle(color: Color(0xFF76B500), fontSize: 18),
                    ),
                    Text(
                      "Media Files",
                      style: TextStyle(color: Colors.white70, fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              "Visit Summary",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Column(
              children: const [
                SummaryRow(
                  label: "Tasks Completed",
                  value: "6/6",
                  iconData: Icons.task_alt,
                ),
                SummaryRow(
                  label: "Photos Uploaded",
                  value: "6",
                  iconData: Icons.photo,
                ),
                SummaryRow(
                  label: "Videos Uploaded",
                  value: "3",
                  iconData: Icons.videocam,
                ),
                SummaryRow(
                  label: "Check-In Time",
                  value: "9:15 AM",
                  iconData: Icons.timer,
                ),
                SummaryRow(
                  label: "Check-Out Time",
                  value: "10:45 AM",
                  iconData: Icons.timer,
                ),
                SummaryRow(
                  label: "Total Time",
                  value: "1h 30m",
                  iconData: Icons.schedule,
                ),
              ],
            ),
            const SizedBox(height: 24),
            Center(
              child: Column(
                children: const [
                  Text(
                    "Performance Rating",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.star, color: Color(0xFFFFC107), size: 24),
                      Icon(Icons.star, color: Color(0xFFFFC107), size: 24),
                      Icon(Icons.star, color: Color(0xFFFFC107), size: 24),
                      Icon(Icons.star, color: Color(0xFFFFC107), size: 24),
                      Icon(Icons.star, color: Color(0xFFFFC107), size: 24),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Excellent Work! All Tasks Completed On Time",
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
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
                  Navigator.pop(context);
                },
                child: const Text(
                  "Return to Dashboard",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class SummaryRow extends StatelessWidget {
  final String label;
  final String value;
  final IconData? iconData;

  const SummaryRow({
    super.key,
    required this.label,
    required this.value,
    this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(
            iconData ?? Icons.check_circle,
            color: iconData == Icons.timer || iconData == Icons.schedule
                ? Colors.white
                : const Color(0xFF76B500),
            size: 18,
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
          const Spacer(),
          Text(
            value,
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SuccessScreen(),
  ));
}
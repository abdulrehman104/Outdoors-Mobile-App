import 'package:flutter/material.dart';

import 'package:cuttingedge/features/home/view/notification_screen.dart';

class HomeTopSection extends StatelessWidget {
  const HomeTopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Greeting with Notification and Logout Icons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Good Morning, John",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.notifications, color: Colors.white),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NotificationScreen(),
                        ),
                      );
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.logout, color: Colors.white),
                    onPressed: () {
                      // Placeholder for logout functionality
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Logout pressed")),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 4),
          const Text(
            "Ready To Start Your Workday?",
            style: TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 20),

          /// Progress Bar
          Container(
            margin: const EdgeInsets.only(bottom: 16), // Consistent margin with task cards
            padding: const EdgeInsets.all(16), // Updated padding to match task cards
            decoration: BoxDecoration(
              color: const Color(0xFF61181D), // Transparent green background
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFF61181D), width: 2), // Transparent green border
              boxShadow: [
                BoxShadow(
                  color: const Color(0x1A466B00), // Subtle green glow
                  blurRadius: 8,
                  spreadRadius: 2,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Today's Progress",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                LinearProgressIndicator(
                  value: 0.0,
                  backgroundColor: Colors.white24,
                  color: const Color(0xFF61181D), // Green progress
                  minHeight: 6,
                  borderRadius: BorderRadius.circular(4),
                ),
                const SizedBox(height: 8),
                const Text("0 of 3 Completed", style: TextStyle(color: Colors.white70)),
              ],
            ),
          ),
          const SizedBox(height: 20),

          /// Task Cards
          _buildTaskCard(
            context,
            title: "Oakwood Apartments",
            address: "123 Oak Street, Unit 48",
            time: "9:00 AM – 11:00 AM",
            tasks: "5 Tasks • 0.3 Miles Away",
          ),
          _buildTaskCard(
            context,
            title: "Sunset Gardens",
            address: "123 Oak Street, Unit 48",
            time: "9:00 AM – 11:00 AM",
            tasks: "6 Tasks • 0.3 Miles Away",
          ),
          _buildTaskCard(
            context,
            title: "Metro Plaza",
            address: "123 Oak Street, Unit 48",
            time: "9:00 AM – 11:00 AM",
            tasks: "5 Tasks • 0.3 Miles Away",
          ),
        ],
      ),
    );
  }

  /// Task Card
  Widget _buildTaskCard(
      BuildContext context, {
        required String title,
        required String address,
        required String time,
        required String tasks,
      }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0x14466B00), // Transparent green background
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0x1A466B00), width: 2), // Transparent green border
        boxShadow: [
          BoxShadow(
            color: const Color(0x1A466B00), // Subtle green glow
            blurRadius: 8,
            spreadRadius: 2,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Title + Status
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text("Pending",
                    style: TextStyle(color: Colors.white70, fontSize: 12)),
              ),
            ],
          ),
          const SizedBox(height: 8),

          /// Address & Time
          Text(address, style: const TextStyle(color: Colors.white70, fontSize: 13)),
          Text(time, style: const TextStyle(color: Colors.white70, fontSize: 13)),
          const SizedBox(height: 8),

          /// Tasks
          Row(
            children: [
              const Icon(Icons.list, size: 16, color: Colors.white70),
              const SizedBox(width: 6),
              Text(tasks, style: const TextStyle(color: Colors.white70)),
            ],
          ),
          const SizedBox(height: 12),

          /// Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF61181D), // Solid green
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              icon: const Icon(Icons.lock_open, color: Colors.white),
              label: const Text(
                "Check In & Start Task",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
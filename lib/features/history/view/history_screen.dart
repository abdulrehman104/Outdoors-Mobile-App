import 'package:flutter/material.dart';

class WorkHistoryScreen extends StatelessWidget {
  const WorkHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Progress Bar Section
          Text(
            "Today's Progress",
            style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 6),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: 2 / 3,
              minHeight: 8,
              backgroundColor: Colors.grey[800],
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF466B00)),
            ),
          ),
          SizedBox(height: 6),
          Text(
            "2 Of 3 Completed",
            style: TextStyle(color: Colors.white70, fontSize: 13),
          ),
          SizedBox(height: 20),
          // History Cards Section
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              HistoryCard(
                title: "Harbor View Complex",
                address: "123 Oak Street, Unit 45",
                time: "9:00 AM - 11:00 AM",
                tasks: "8 Tasks • 0.3 Miles Away",
                status: "Completed",
              ),
              HistoryCard(
                title: "Shine Plaza",
                address: "123 Oak Street, Unit 48",
                time: "9:00 AM - 11:00 AM",
                tasks: "8 Tasks • 0.3 Miles Away",
                status: "Completed",
              ),
              HistoryCard(
                title: "Harbor View Complex",
                address: "123 Oak Street, Unit 46",
                time: "9:00 AM - 11:00 AM",
                tasks: "8 Tasks • 0.3 Miles Away",
                status: "Pending",
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class HistoryCard extends StatelessWidget {
  final String title;
  final String address;
  final String time;
  final String tasks;
  final String status;

  const HistoryCard({
    super.key,
    required this.title,
    required this.address,
    required this.time,
    required this.tasks,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    bool isCompleted = status == "Completed";

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0x14466B00), // Transparent card
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF466B00), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              const Icon(Icons.location_on, size: 16, color: Colors.white70),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  address,
                  style: const TextStyle(color: Colors.white70, fontSize: 13),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const Icon(Icons.access_time, size: 16, color: Colors.white70),
              const SizedBox(width: 6),
              Text(time, style: const TextStyle(color: Colors.white70, fontSize: 13)),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const Icon(Icons.task_alt, size: 16, color: Colors.white70),
              const SizedBox(width: 6),
              Text(tasks, style: const TextStyle(color: Colors.white70, fontSize: 13)),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: isCompleted ? const Color(0xFF61181D) : Colors.grey[700],
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {},
              child: Text(
                status,
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
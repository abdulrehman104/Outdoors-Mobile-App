import 'package:flutter/material.dart';
import 'package:cuttingedge/features/customer/report/view/report_screen.dart'; // Adjust import based on your project structure

class CustomerHomeTopSection extends StatelessWidget {
  const CustomerHomeTopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Header Greeting
          const Text(
            "Hello, Jason",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            "Welcome Back To Your Property Dashboard",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 24),

          /// Today's Summary Section with Border Container
          Container(
            decoration: BoxDecoration(
              color: const Color(0x14466B00),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0x1A466B00), width: 2),
              boxShadow: [
                BoxShadow(
                  color: const Color(0x1A466B00),
                  blurRadius: 300,
                  spreadRadius: 2,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Today's Summary",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _buildSummaryCard(
                    "Tasks Completed Today",
                    "5",
                    Icons.check_circle,
                  ),
                  const SizedBox(height: 6),
                  _buildSummaryCard(
                    "Pending Invoices",
                    "\$450",
                    Icons.receipt,
                  ),
                  const SizedBox(height: 6),
                  _buildSummaryCard(
                    "Active Properties",
                    "3",
                    Icons.home,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),

          /// Recent Services Section with Border Container
          Container(
            decoration: BoxDecoration(
              color: const Color(0x14466B00),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0x1A466B00), width: 2),
              boxShadow: [
                BoxShadow(
                  color: const Color(0x1A466B00),
                  blurRadius: 300,
                  spreadRadius: 2,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Recent Services",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "View All",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildServiceCard(
                    "Sunset Villa Apartment",
                    "Plumbing • 8 May 5 Tasks",
                    "Completed",
                    const Color(0xFF61181D),
                  ),
                  _buildServiceCard(
                    "Downtown Office Complex",
                    "Electrical • 7 May 3 Tasks",
                    "Completed",
                    const Color(0xFF61181D),
                  ),
                  _buildServiceCard(
                    "Garden View Residence",
                    "Cleaning • 6 May 4 Tasks",
                    "Pending",
                    const Color(0xFF515151),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),

          /// Quick Actions Section
          const Text(
            "Quick Actions",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),

          /// Action Buttons in Single Container
          Container(
            decoration: BoxDecoration(
              color: const Color(0x14466B00),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0x1A466B00), width: 2),
              boxShadow: [
                BoxShadow(
                  color: const Color(0x1A466B00),
                  blurRadius: 300,
                  spreadRadius: 2,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: _buildActionButton(
                      "Report Issue",
                      Icons.report_problem_outlined,
                          () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ReportScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildActionButton(
                      "Pay Invoice",
                      Icons.payment_outlined,
                          () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Summary Card Widget
  Widget _buildSummaryCard(String title, String value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Icon(icon, color: const Color(0xFF76B500), size: 20),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              color: Color(0xFF76B500),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  /// Service Card Widget
  Widget _buildServiceCard(String title, String subtitle, String status, Color statusColor) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: statusColor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: statusColor),
            ),
            child: Text(
              status,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Action Button Widget
  Widget _buildActionButton(String label, IconData icon, VoidCallback onPressed) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Icon(icon, color: Colors.white70, size: 20),
              const SizedBox(height: 8),
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
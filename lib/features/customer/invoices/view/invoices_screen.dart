import 'package:flutter/material.dart';

class InvoicesScreen extends StatelessWidget {
  const InvoicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            // Outstanding and Paid Section (Above Container)
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // Center the columns
              children: [
                // Outstanding Column
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "\$450",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      "Outstanding",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 190), // Increased gap between Outstanding and Paid
                // Paid Column
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      "2",
                      style: TextStyle(
                        color: Color(0xFF76B500),
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      "Paid",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
            // Invoice Summary Section (Container with Pay All Outstanding and Pay Button)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF111111),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white12, width: 1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Pay All Outstanding Text (Left Side)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Pay All Outstanding",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        "Save time with one payment",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 7,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  // Pay Button (Right Side)
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF76B500),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      "Pay \$450",
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // All Invoices Section (Wrapped in Container)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF111111),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white12, width: 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "All Invoices",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 16),
                  InvoiceCard(
                    invoiceNumber: "INV-001",
                    amount: "\$150",
                    dueDate: "Due: Jan 5, 2025",
                    status: "Unpaid",
                    statusColor: Colors.red,
                  ),
                  const SizedBox(height: 12),
                  InvoiceCard(
                    invoiceNumber: "INV-002",
                    amount: "\$300",
                    dueDate: "Due: Jan 5, 2025",
                    status: "Unpaid",
                    statusColor: Colors.red,
                  ),
                  const SizedBox(height: 12),
                  InvoiceCard(
                    invoiceNumber: "INV-003",
                    amount: "\$80",
                    dueDate: "Due: Dec 26, 2024",
                    status: "Paid",
                    statusColor: const Color(0xFF76B500),
                  ),
                  const SizedBox(height: 12),
                  InvoiceCard(
                    invoiceNumber: "INV-004",
                    amount: "\$120",
                    dueDate: "Due: Dec 30, 2024",
                    status: "Paid",
                    statusColor: const Color(0xFF76B500),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InvoiceCard extends StatelessWidget {
  final String invoiceNumber;
  final String amount;
  final String dueDate;
  final String status;
  final Color statusColor;

  const InvoiceCard({
    super.key,
    required this.invoiceNumber,
    required this.amount,
    required this.dueDate,
    required this.status,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF111111),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left Section
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                invoiceNumber,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                dueDate,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          // Right Section
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                amount,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 6),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: statusColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  status,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'invoice_detail.dart'; // Adjust import based on your project structure

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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Outstanding Column
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "\$450",
                      style: TextStyle(
                        color: Color(0xFF61181D),
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      semanticsLabel: "Outstanding amount: 450 dollars",
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
                const SizedBox(width: 190),
                // Paid Column
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      "2",
                      style: TextStyle(
                        color: Color(0xFF466B00),
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      semanticsLabel: "2 invoices paid",
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
                color: const Color(0x14466B00),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0x1A466B00), width: 2),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x1A466B00),
                    blurRadius: 300,
                    spreadRadius: 2,
                    offset: Offset(0, 2),
                  ),
                ],
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
                        semanticsLabel: "Pay All Outstanding",
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        "Save time with one payment",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  // Pay Button (Right Side)
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF466B00),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      "Pay \$450",
                      style: TextStyle(color: Colors.white, fontSize: 13),
                      semanticsLabel: "Pay 450 dollars",
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
                color: const Color(0x14466B00),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0x1A466B00), width: 2),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x1A466B00),
                    blurRadius: 300,
                    spreadRadius: 2,
                    offset: Offset(0, 2),
                  ),
                ],
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
                    semanticsLabel: "All Invoices Section",
                  ),
                  const SizedBox(height: 16),
                  InvoiceCard(
                    invoiceNumber: "INV-001",
                    subheading: "Sunset Villa Apartment",
                    amount: "\$150",
                    dueDate: "Due: Jan 5, 2025",
                    status: "Unpaid",
                    statusColor: const Color(0xFF61181D),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InvoiceDetailScreen(
                            invoiceNumber: "INV-001",
                            subheading: "Sunset Villa Apartment",
                            amount: "\$150",
                            dueDate: "Due: Jan 5, 2025",
                            status: "Unpaid",
                            statusColor: const Color(0xFF61181D),
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 12),
                  InvoiceCard(
                    invoiceNumber: "INV-002",
                    subheading: "Sunset Villa Apartment",
                    amount: "\$300",
                    dueDate: "Due: Jan 5, 2025",
                    status: "Unpaid",
                    statusColor: const Color(0xFF61181D),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InvoiceDetailScreen(
                            invoiceNumber: "INV-002",
                            subheading: "Sunset Villa Apartment",
                            amount: "\$300",
                            dueDate: "Due: Jan 5, 2025",
                            status: "Unpaid",
                            statusColor: const Color(0xFF61181D),
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 12),
                  InvoiceCard(
                    invoiceNumber: "INV-003",
                    subheading: "Sunset Villa Apartment",
                    amount: "\$80",
                    dueDate: "Due: Dec 26, 2024",
                    status: "Paid",
                    statusColor: const Color(0xFF466B00),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InvoiceDetailScreen(
                            invoiceNumber: "INV-003",
                            subheading: "Sunset Villa Apartment",
                            amount: "\$80",
                            dueDate: "Due: Dec 26, 2024",
                            status: "Paid",
                            statusColor: const Color(0xFF466B00),
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 12),
                  InvoiceCard(
                    invoiceNumber: "INV-004",
                    subheading: "Sunset Villa Apartment",
                    amount: "\$120",
                    dueDate: "Due: Dec 30, 2024",
                    status: "Paid",
                    statusColor: const Color(0xFF466B00),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InvoiceDetailScreen(
                            invoiceNumber: "INV-004",
                            subheading: "Sunset Villa Apartment",
                            amount: "\$120",
                            dueDate: "Due: Dec 30, 2024",
                            status: "Paid",
                            statusColor: const Color(0xFF466B00),
                          ),
                        ),
                      );
                    },
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
  final String subheading;
  final String amount;
  final String dueDate;
  final String status;
  final Color statusColor;
  final VoidCallback onTap;

  const InvoiceCard({
    super.key,
    required this.invoiceNumber,
    required this.subheading,
    required this.amount,
    required this.dueDate,
    required this.status,
    required this.statusColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
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
                  semanticsLabel: "Invoice $invoiceNumber",
                ),
                const SizedBox(height: 4),
                Text(
                  subheading,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  amount,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            // Right Section
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
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
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class InvoicesScreen extends StatelessWidget {
  const InvoicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Invoice Summary Section
          Text(
            "Invoice Summary",
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
            "2 of 3 Invoices Paid",
            style: TextStyle(color: Colors.white70, fontSize: 13),
          ),
          SizedBox(height: 20),
          // Invoice Cards Section
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              InvoiceCard(
                invoiceNumber: "INV-001",
                service: "Lawn Maintenance",
                amount: "\$150.00",
                dueDate: "2025-09-10",
                status: "Paid",
              ),
              InvoiceCard(
                invoiceNumber: "INV-002",
                service: "Tree Trimming",
                amount: "\$200.00",
                dueDate: "2025-09-15",
                status: "Paid",
              ),
              InvoiceCard(
                invoiceNumber: "INV-003",
                service: "Garden Cleanup",
                amount: "\$100.00",
                dueDate: "2025-09-20",
                status: "Pending",
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class InvoiceCard extends StatelessWidget {
  final String invoiceNumber;
  final String service;
  final String amount;
  final String dueDate;
  final String status;

  const InvoiceCard({
    super.key,
    required this.invoiceNumber,
    required this.service,
    required this.amount,
    required this.dueDate,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    bool isPaid = status == "Paid";

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
            invoiceNumber,
            style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              const Icon(Icons.description, size: 16, color: Colors.white70),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  service,
                  style: const TextStyle(color: Colors.white70, fontSize: 13),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const Icon(Icons.attach_money, size: 16, color: Colors.white70),
              const SizedBox(width: 6),
              Text(amount, style: const TextStyle(color: Colors.white70, fontSize: 13)),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const Icon(Icons.calendar_today, size: 16, color: Colors.white70),
              const SizedBox(width: 6),
              Text(dueDate, style: const TextStyle(color: Colors.white70, fontSize: 13)),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: isPaid ? const Color(0xFF61181D) : Colors.grey[700],
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
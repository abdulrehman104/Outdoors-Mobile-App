import 'package:flutter/material.dart';

class InvoiceDetailScreen extends StatelessWidget {
  final String invoiceNumber;
  final String subheading;
  final String amount;
  final String dueDate;
  final String status;
  final Color statusColor;

  const InvoiceDetailScreen({
    super.key,
    required this.invoiceNumber,
    required this.subheading,
    required this.amount,
    required this.dueDate,
    required this.status,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          "Invoices Details",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Invoice Header Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0x14466B00),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0x1A466B00), width: 2),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x1A466B00),
                    blurRadius: 10,
                    spreadRadius: 2,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Left Details
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        invoiceNumber,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        subheading,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          const Icon(Icons.attach_money,
                              color: Colors.green, size: 20),
                          const SizedBox(width: 6),
                          Text(
                            amount,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.calendar_today,
                              color: Colors.green, size: 18),
                          const SizedBox(width: 6),
                          Text(
                            dueDate,
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  // Right Status
                  Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
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
            ),

            const SizedBox(height: 20),

            // Services Provided Section
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0x14466B00),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0x1A466B00), width: 2),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x1A466B00),
                    blurRadius: 10,
                    spreadRadius: 2,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Services Provided",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildServiceItem("Deep Cleaning", "\$50"),
                  _buildServiceItem("Window Washing", "\$50"),
                  _buildServiceItem("Carpet Cleaning", "\$50"),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Payment Method Section
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0x14466B00),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0x1A466B00), width: 2),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x1A466B00),
                    blurRadius: 10,
                    spreadRadius: 2,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Payment Method",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: const [
                      Icon(Icons.credit_card, color: Colors.white70, size: 20),
                      SizedBox(width: 10),
                      Text(
                        "•••• •••• •••• 4242",
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                      Spacer(),
                      Text(
                        "Expires 12/27",
                        style: TextStyle(color: Colors.white54, fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Pay Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: status == "Paid" ? null : () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: status == "Unpaid"
                      ? const Color(0xFF61181D)
                      : const Color(0xFF466B00),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  status == "Unpaid"
                      ? "Pay $amount Now"
                      : "Already Paid",
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Footer Secure Text
            const Center(
              child: Text(
                "Secure Payment Powered By Stripe. Your Card Information is Encrypted And Safe.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Service Item Widget
  Widget _buildServiceItem(String title, String amount) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(Icons.check_circle,
                  color: Color(0xFF466B00), size: 20),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(color: Colors.white, fontSize: 14),
              ),
            ],
          ),
          Text(
            amount,
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
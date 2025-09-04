import 'package:flutter/material.dart';

class InvoiceDetailScreen extends StatelessWidget {
  final String invoiceNumber;
  final String subheading;
  final String amount; // e.g. "$150"
  final String dueDate; // e.g. "Jan 5, 2025"
  final String status; // e.g. "Unpaid" | "Paid"
  final Color statusColor; // e.g. Colors.red or Colors.green

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
          'Invoice Details',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ===== Header Card (matches screenshot) =====
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF101010),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white12, width: 1),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top Row: left (title/sub) + right (status pill)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                          const SizedBox(height: 4),
                          Text(
                            subheading,
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: statusColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          status,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 18),

                  // Bottom: two columns -> Amount (label above value) & Due Date (label above value)
                  Row(
                    children: [
                      // Amount column
                      Expanded(
                        child: _buildLabeledStat(
                          icon: Icons.attach_money,
                          label: 'Amount',
                          value: amount,
                        ),
                      ),
                      const SizedBox(width: 16),
                      // Due date column
                      Expanded(
                        child: _buildLabeledStat(
                          icon: Icons.calendar_today,
                          label: 'Due Date',
                          value: dueDate.replaceFirst('Due: ', ''),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ===== Services Provided =====
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF101010),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white12, width: 1),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Services Provided',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildServiceItem('Deep Cleaning', '\$50'),
                  _buildServiceItem('Window Washing', '\$50'),
                  _buildServiceItem('Carpet Cleaning', '\$50'),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ===== Payment Method =====
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF101010),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white12, width: 1),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Payment Method',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(Icons.credit_card, color: Colors.white70, size: 20),
                      SizedBox(width: 10),
                      Text(
                        '•••• •••• •••• 4242',
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                      Spacer(),
                      Text(
                        'Expires 12/27',
                        style: TextStyle(color: Colors.white54, fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // ===== Pay Button =====
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: status == 'Paid' ? null : () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: status == 'Unpaid'
                      ? const Color(0xFFD32F2F) // Red for Unpaid
                      : const Color(0xFF388E3C), // Green for Paid
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  status == 'Unpaid' ? 'Pay $amount Now' : 'Already Paid',
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),

            const SizedBox(height: 12),

            const Center(
              child: Text(
                'Secure Payment Powered By Stripe. Your Card Information is Encrypted And Safe.',
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

  // ===== small helper: label above value, with green icon =====
  Widget _buildLabeledStat({
    required IconData icon,
    required String label,
    required String value,
  }) {
    const green = Color(0xFF63B400); // soft green like screenshot
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            Icon(Icons.circle, size: 0), // keeps row height predictable (no-op)
          ],
        ),
        Row(
          children: [
            Icon(icon, color: green, size: 20),
            const SizedBox(width: 6),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Padding(
          padding: const EdgeInsets.only(left: 25.0), // Move value text further to the right
          child: Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16, // Reduced font size for amount and date
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }

  // ===== service row =====
  Widget _buildServiceItem(String title, String amount) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: const [
              Icon(Icons.check_circle, color: Color(0xFF466B00), size: 20),
              SizedBox(width: 8),
            ],
          ),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
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
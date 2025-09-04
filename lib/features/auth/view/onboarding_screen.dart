import 'package:flutter/material.dart';
import 'package:cuttingedge/config/routes.dart';

class OnboardingScreen extends StatelessWidget {
    const OnboardingScreen({super.key});

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: Colors.black, // ✅ Dark background
            body: SafeArea(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                            const SizedBox(height: 40),

                            /// ✅ Logo Title
                            const Text(
                                "CuttingEdge",
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                ),
                            ),
                            const Text(
                                "OUTDOORS",
                                style: TextStyle(
                                    fontSize: 16,
                                    letterSpacing: 4,
                                    color: Colors.white,
                                ),
                            ),

                            const SizedBox(height: 16),

                            /// ✅ Subtitle
                            const Text(
                                "Professional Service Management Platform For\nWorkers, Customers, And Administrators.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white70,
                                ),
                            ),

                            const SizedBox(height: 30),

                            /// ✅ Choose Role Button (not functional, just heading)
                            OutlinedButton(
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
                                    side: const BorderSide(color: Color(0xFF466B00)),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                    ),
                                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                                ),
                                child: const Text(
                                    "Choose Your Role To Get Started",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                    ),
                                ),
                            ),

                            const SizedBox(height: 30),

                            /// ✅ Customer Card
                            _buildRoleCard(
                                context,
                                title: "Customer",
                                subtitle: "View Completed Services, Submit Complaints,\nAnd Manage Payments.",
                                buttonLabel: "Continue",
                                onPressed: () {
                                    Navigator.pushNamed(context, Routes.customerLogin); // Updated to customer login route
                                },
                            ),

                            const SizedBox(height: 20),

                            /// ✅ Worker Card
                            _buildRoleCard(
                                context,
                                title: "Worker",
                                subtitle: "Access Your Daily Assignments, Check-In/Out,\nAnd Complete Tasks.",
                                buttonLabel: "Continue",
                                onPressed: () {
                                    Navigator.pushNamed(context, Routes.login); // Worker stays on original login route
                                },
                            ),
                        ],
                    ),
                ),
            ),
        );
    }

    /// ✅ Reusable Card Widget
    Widget _buildRoleCard(
        BuildContext context, {
            required String title,
            required String subtitle,
            required String buttonLabel,
            required VoidCallback onPressed,
        }) {
        return Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(color: const Color(0xFF466B00)),
                borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    /// Title
                    Text(
                        title,
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                        ),
                    ),

                    const SizedBox(height: 8),

                    /// Subtitle
                    Text(
                        subtitle,
                        style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white70,
                        ),
                    ),

                    const SizedBox(height: 12),

                    /// Continue Button
                    SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: onPressed,
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF61181D),
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                ),
                            ),
                            child: Text(
                                buttonLabel,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                ),
                            ),
                        ),
                    )
                ],
            ),
        );
    }
}
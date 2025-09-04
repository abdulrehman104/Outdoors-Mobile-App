import 'package:flutter/material.dart';
import 'package:cuttingedge/features/customer/home/widgets/customer_home_top_section.dart';
import 'package:cuttingedge/features/customer/home/widgets/customer_custom_bottom_nav_bar.dart';
import 'package:cuttingedge/features/customer/invoices/view/invoices_screen.dart';
import 'package:cuttingedge/features/profile/view/profile_screen.dart';
import 'package:cuttingedge/features/chat/view/chat_screen.dart';

class CustomerHomeScreen extends StatefulWidget {
  const CustomerHomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<CustomerHomeScreen> {
  int _currentIndex = 0;

  void _onNavTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomerHomeTopSection(), // Updated to customer-specific widget
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          ],
        ),
      ),
      const InvoicesScreen(),
      const ChatScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: _currentIndex == 1
          ? AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Invoice Screen",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      )
          : null,
      body: SafeArea(
        child: screens[_currentIndex],
      ),
      bottomNavigationBar: CustomerCustomBottomNavBar( // Updated to customer-specific widget
        currentIndex: _currentIndex,
        onTap: _onNavTap,
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:cuttingedge/config/routes.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _startSplashTimer();
  }

  void _startSplashTimer() {
    Future.delayed(const Duration(seconds: 2), () {
      _navigate();
    });
  }

  void _navigate() {
    Navigator.pushNamedAndRemoveUntil(
      context,
      Routes.welcome, // 👈 Change this to Routes.home if needed
          (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // 👈 Dark background
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "CuttingEdge",
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "OUTDOORS",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                letterSpacing: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

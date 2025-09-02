import 'package:flutter/material.dart';
import 'package:cuttingedge/app.dart';
import 'package:cuttingedge/core/local_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await _initializeApp();

  runApp(const cuttingedgeApp());
}

Future<void> _initializeApp() async {
  try {
    await LocalStorage.init();
  } catch (e) {
    debugPrint('Failed to initialize Testify local storage: $e');
  }
}
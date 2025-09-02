import 'package:flutter/material.dart';
import 'package:cuttingedge/config/routes.dart';
import 'package:cuttingedge/config/theme.dart';

class cuttingedgeApp extends StatelessWidget {
  const cuttingedgeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'cuttingedge',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: Routes.initial,
      routes: Routes.getRoutes(),
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (context) => Scaffold(
          body: Center(child: Text('Route not found: ${settings.name}')),
        ),
      ),
    );
  }
}
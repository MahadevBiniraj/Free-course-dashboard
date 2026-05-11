import 'package:flutter/material.dart';
import 'screens/dashboard_screen.dart';

void main() {
  runApp(const UXUIOpenApp());
}

class UXUIOpenApp extends StatelessWidget {
  const UXUIOpenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UX/UI Open',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0A0A0A),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF00FF7F),
          surface: Color(0xFF111111),
        ),
        fontFamily: 'Roboto',
      ),
      home: const DashboardScreen(),
    );
  }
}

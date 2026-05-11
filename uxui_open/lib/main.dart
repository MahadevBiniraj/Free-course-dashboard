import 'package:flutter/material.dart';
import 'screens/dashboard_screen.dart';
import 'theme/app_theme.dart';

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
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: const ColorScheme.dark(
          primary: AppColors.green,
          surface: AppColors.cardBackground,
        ),
        fontFamily: 'Roboto',
      ),
      home: const DashboardScreen(),
    );
  }
}

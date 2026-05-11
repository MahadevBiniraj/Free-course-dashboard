import 'package:flutter/material.dart';
import '../widgets/top_nav_bar.dart';
import '../widgets/hero_section.dart';
import '../widgets/learning_cards_row.dart';
import '../widgets/progress_section.dart';
import '../widgets/action_cards_row.dart';
import '../widgets/faq_section.dart';
import '../widgets/footer_section.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      appBar: const TopNavBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            SizedBox(height: 8),
            HeroSection(),
            SizedBox(height: 16),
            LearningCardsRow(),
            SizedBox(height: 16),
            ProgressSection(),
            SizedBox(height: 16),
            ActionCardsRow(),
            SizedBox(height: 40),
            FAQSection(),
            SizedBox(height: 40),
            FooterSection(),
          ],
        ),
      ),
    );
  }
}

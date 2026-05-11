import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
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
      backgroundColor: AppColors.background,
      appBar: const TopNavBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            SizedBox(height: 16),
            HeroSection(),
            SizedBox(height: 32),
            LearningCardsRow(),
            SizedBox(height: 32),
            ProgressSection(),
            SizedBox(height: 32),
            ActionCardsRow(),
            SizedBox(height: 60),
            FAQSection(),
            SizedBox(height: 60),
            FooterSection(),
          ],
        ),
      ),
    );
  }
}

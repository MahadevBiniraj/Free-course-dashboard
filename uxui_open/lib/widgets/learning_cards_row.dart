import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../screens/navscreen.dart';

class LearningCardsRow extends StatelessWidget {
  const LearningCardsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Row(
        children: [
          Expanded(child: _StartLearningCard()),
          const SizedBox(width: 24),
          Expanded(child: const _MyAchievementsCard()),
        ],
      ),
    );
  }
}

class _StartLearningCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CourseNavPage()),
        );
      },
      child: Container(
        height: 260,
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.cardBorder, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          // Background decoration - laptop illustration placeholder
          Positioned(
            right: -10,
            top: -10,
            bottom: -10,
            child: Opacity(
              opacity: 0.8,
              child: Container(
                width: 200,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.cardBackground.withOpacity(0.0),
                      AppColors.green.withOpacity(0.05),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 120,
                      height: 80,
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1A1A),
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: AppColors.green.withOpacity(0.4)),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.green.withOpacity(0.1),
                            blurRadius: 20,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: const Icon(Icons.laptop_mac, color: AppColors.green, size: 48),
                    ),
                    const SizedBox(height: 6),
                    Container(
                      width: 70,
                      height: 60,
                      decoration: const BoxDecoration(
                        color: Color(0xFF151515),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.all(28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.greenDim,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.play_lesson_outlined, color: AppColors.green, size: 24),
                ),
                const SizedBox(height: 18),
                const Text('Start Learning', style: AppTextStyles.heading2),
                const SizedBox(height: 8),
                const Text('Continue from where\nyou left off.', style: AppTextStyles.body),
                const Spacer(),
                Row(
                  children: [
                    const Text('Resume Learning', style: AppTextStyles.label),
                    const SizedBox(width: 6),
                    const Icon(Icons.arrow_forward, color: AppColors.green, size: 16),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

class _MyAchievementsCard extends StatelessWidget {
  const _MyAchievementsCard();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle view achievements tap
      },
      child: Container(
        height: 260,
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.cardBorder, width: 1.5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            // Background decoration - Trophy placeholder
            Positioned(
              right: 10,
              top: 30,
              child: Opacity(
                opacity: 0.9,
                child: Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.green.withOpacity(0.08),
                        blurRadius: 40,
                        spreadRadius: 20,
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.emoji_events,
                      size: 130,
                      color: Color(0xFF151515), // Dark placeholder trophy
                    ),
                  ),
                ),
              ),
            ),
            // Content
            Padding(
              padding: const EdgeInsets.all(28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.greenDim,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.emoji_events_outlined, color: AppColors.green, size: 24),
                  ),
                  const SizedBox(height: 18),
                  const Text('My Achievements', style: AppTextStyles.heading2),
                  const SizedBox(height: 8),
                  const Text('Track your badges,\ncertificates and\nmilestones.', style: AppTextStyles.body),
                  const Spacer(),
                  Row(
                    children: [
                      const Text('View Achievements', style: AppTextStyles.label),
                      const SizedBox(width: 6),
                      const Icon(Icons.arrow_forward, color: AppColors.green, size: 16),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

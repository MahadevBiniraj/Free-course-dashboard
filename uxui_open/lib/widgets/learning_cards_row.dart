import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class LearningCardsRow extends StatelessWidget {
  const LearningCardsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(child: _StartLearningCard()),
        ],
      ),
    );
  }
}

class _StartLearningCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.cardBorder),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          // Background decoration - laptop illustration placeholder
          Positioned(
            right: -10,
            top: 10,
            child: Opacity(
              opacity: 0.5,
              child: Container(
                width: 130,
                height: 140,
                decoration: BoxDecoration(
                  color: AppColors.cardBorder,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 70,
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1A1A),
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: AppColors.green.withOpacity(0.3)),
                      ),
                      child: const Icon(Icons.laptop_mac, color: AppColors.green, size: 36),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      width: 60,
                      height: 50,
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
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.greenDim,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.play_lesson_outlined, color: AppColors.green, size: 20),
                ),
                const SizedBox(height: 14),
                const Text('Start Learning', style: AppTextStyles.heading2),
                const SizedBox(height: 6),
                const Text('Continue from where\nyou left off.', style: AppTextStyles.body),
                const Spacer(),
                Row(
                  children: [
                    const Text('Resume Learning', style: AppTextStyles.label),
                    const SizedBox(width: 4),
                    const Icon(Icons.arrow_forward, color: AppColors.green, size: 14),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

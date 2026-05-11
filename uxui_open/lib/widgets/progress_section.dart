import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ProgressSection extends StatelessWidget {
  const ProgressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.cardBorder),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Your Progress', style: AppTextStyles.heading2),
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.cardBorder),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Icon(Icons.arrow_forward_ios, color: AppColors.greyLight, size: 14),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Progress row
            Row(
              children: [
                // Circular progress
                SizedBox(
                  width: 90,
                  height: 90,
                  child: Stack(
                    children: [
                      SizedBox(
                        width: 90,
                        height: 90,
                        child: CircularProgressIndicator(
                          value: 0.68,
                          strokeWidth: 8,
                          backgroundColor: AppColors.greyDark,
                          valueColor: const AlwaysStoppedAnimation<Color>(AppColors.green),
                          strokeCap: StrokeCap.round,
                        ),
                      ),
                      const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('68%',
                                style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)),
                            Text('Completed',
                                style: TextStyle(color: AppColors.grey, fontSize: 9)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 24),
                // Course info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Flutter Development Bootcamp', style: AppTextStyles.heading3),
                      const SizedBox(height: 10),
                      // Progress bar
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: LinearProgressIndicator(
                          value: 12 / 18,
                          backgroundColor: AppColors.greyDark,
                          valueColor: const AlwaysStoppedAnimation<Color>(AppColors.green),
                          minHeight: 8,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text('12 of 18 Modules Completed', style: AppTextStyles.body),
                      const SizedBox(height: 12),
                      OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.bar_chart, size: 14, color: AppColors.greyLight),
                        label: const Text('View Detailed Progress',
                            style: TextStyle(color: AppColors.greyLight, fontSize: 12)),
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: AppColors.greyDark),
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                // Next up
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.cardBorder),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Next Up',
                          style: TextStyle(color: AppColors.green, fontSize: 12, fontWeight: FontWeight.w500)),
                      const SizedBox(height: 6),
                      const Text('Module 5', style: TextStyle(color: AppColors.grey, fontSize: 12)),
                      const Text('State Management\nwith Provider',
                          style: TextStyle(color: AppColors.white, fontSize: 14, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 12),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.play_arrow, size: 14),
                        label: const Text('Continue', style: TextStyle(fontSize: 12)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.green,
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

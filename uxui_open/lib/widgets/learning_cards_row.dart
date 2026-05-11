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
          const SizedBox(width: 16),
          Expanded(child: _CalendarCard()),
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

class _CalendarCard extends StatelessWidget {
  final List<List<int?>> _weeks = [
    [null, null, null, null, 1, 2, 3],
    [4, 5, 6, 7, 8, 9, 10],
    [11, 12, 13, 14, 15, 16, 17],
    [18, 19, 20, 21, 22, 23, 24],
    [25, 27, 28, 29, 30, 31, null],
  ];

  final List<String> _dayNames = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.cardBorder),
      ),
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left content
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.greenDim,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.calendar_today_outlined, color: AppColors.green, size: 20),
                ),
                const SizedBox(height: 14),
                const Text('View Calendar', style: AppTextStyles.heading2),
                const SizedBox(height: 6),
                const Text('Check your schedule\nand important dates.', style: AppTextStyles.body),
                const Spacer(),
                Row(
                  children: [
                    const Text('Open Calendar', style: AppTextStyles.label),
                    const SizedBox(width: 4),
                    const Icon(Icons.arrow_forward, color: AppColors.green, size: 14),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          // Mini Calendar
          Expanded(
            flex: 5,
            child: Column(
              children: [
                // Day headers
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: _dayNames
                      .map((d) => SizedBox(
                            width: 22,
                            child: Text(d,
                                style: const TextStyle(
                                    color: AppColors.grey, fontSize: 8, fontWeight: FontWeight.w500),
                                textAlign: TextAlign.center),
                          ))
                      .toList(),
                ),
                const SizedBox(height: 4),
                // Calendar grid
                ..._weeks.map((week) => Padding(
                      padding: const EdgeInsets.only(bottom: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: week.map((day) {
                          final isToday = day == 11;
                          return SizedBox(
                            width: 22,
                            height: 18,
                            child: day == null
                                ? const SizedBox()
                                : Container(
                                    decoration: isToday
                                        ? BoxDecoration(
                                            color: AppColors.green,
                                            borderRadius: BorderRadius.circular(4),
                                          )
                                        : null,
                                    child: Center(
                                      child: Text(
                                        '$day',
                                        style: TextStyle(
                                          color: isToday ? Colors.black : AppColors.greyLight,
                                          fontSize: 9,
                                          fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                          );
                        }).toList(),
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

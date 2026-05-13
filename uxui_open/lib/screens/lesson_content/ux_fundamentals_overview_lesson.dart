import 'package:flutter/material.dart';
import '../../models/course_data.dart';
import '../../theme/app_theme.dart';
import '../../widgets/breadcrumb_bar.dart';
import '../../widgets/lesson_widgets.dart';

class UXFundamentalsOverviewLesson extends StatelessWidget {
  final bool sidebarCollapsed;
  final VoidCallback onExpandSidebar;
  final ValueChanged<String> onLessonTap;

  const UXFundamentalsOverviewLesson({
    super.key,
    required this.sidebarCollapsed,
    required this.onExpandSidebar,
    required this.onLessonTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BreadcrumbBar(
          sidebarCollapsed: sidebarCollapsed,
          onExpandSidebar: onExpandSidebar,
          items: const [
            BreadcrumbItem(label: '02 – UX Fundamentals'),
          ],
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(36, 28, 36, 36),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '02 – UX Fundamentals',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 38,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -1.0,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Discover the foundational principles of UX design. From understanding '
                  'users to mastering design thinking — this module sets you up with the '
                  'essential skills every designer needs.',
                  style: TextStyle(
                    color: AppColors.greyLight,
                    fontSize: 16,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 32),
                
                // ── Vertical Lesson List ─────────────────────────────────────
                const Text(
                  'Lessons in this module:',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 16),
                
                ...kSections[1].lessons.asMap().entries.map((entry) {
                  final title = entry.value;
                  final isActive = false; // Overview itself is not a lesson
                  
                  return LessonTile(
                    title: title,
                    isActive: isActive,
                    onTap: () => onLessonTap(title),
                  );
                }).toList(),

                const SizedBox(height: 36),
                PrevNextBar(
                  prevLabel: '« 01 - Orientation',
                  nextLabel: '2.1 The Way Of The Designer ⭐ »',
                  onPrev: () => onLessonTap('01 - Orientation'),
                  onNext: () => onLessonTap('2.1 The Way Of The Designer ⭐'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

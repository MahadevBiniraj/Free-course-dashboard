import 'package:flutter/material.dart';
import '../../models/course_data.dart';
import '../../theme/app_theme.dart';
import '../../widgets/breadcrumb_bar.dart';
import '../../widgets/lesson_widgets.dart';

class OrientationLesson extends StatelessWidget {
  final bool sidebarCollapsed;
  final VoidCallback onExpandSidebar;
  final ValueChanged<String> onLessonTap;

  const OrientationLesson({
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
            BreadcrumbItem(
              label: '01 – Orientation',
              isLast: false,
              color: AppColors.green,
            ),
          ],
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(36, 28, 36, 36),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '01 – Orientation',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 38,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -1.0,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Get started with the UX/UI Open curriculum and set yourself up with '
                  'the best support system and network to ace your learning.',
                  style: TextStyle(
                    color: AppColors.greyLight,
                    fontSize: 16,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 32),
                CardGrid(
                  cards: kCards,
                  onCardTap: onLessonTap,
                ),
                const SizedBox(height: 36),
                PrevNextBar(
                  prevLabel: '« UX/UI Course Intro',
                  nextLabel: '1.1 Welcome »',
                  onPrev: () {}, // No intro yet
                  onNext: () => onLessonTap('1.1 Welcome'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

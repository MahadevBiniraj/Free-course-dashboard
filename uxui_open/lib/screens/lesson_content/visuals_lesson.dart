import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/breadcrumb_bar.dart';
import '../../widgets/lesson_widgets.dart';

class VisualsLesson extends StatelessWidget {
  final bool sidebarCollapsed;
  final VoidCallback onExpandSidebar;

  const VisualsLesson({
    super.key,
    required this.sidebarCollapsed,
    required this.onExpandSidebar,
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
            BreadcrumbItem(label: '2.5 The Visuals', isLast: true),
          ],
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(36, 28, 36, 36),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '2.5 The Visuals 🎨',
                  style: TextStyle(color: AppColors.white, fontSize: 36, fontWeight: FontWeight.w800, letterSpacing: -1.0),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Visual design is about more than just looking good. It\'s about communicating information clearly, establishing brand identity, and guiding the user\'s eye.',
                  style: TextStyle(color: AppColors.greyLight, fontSize: 16, height: 1.7),
                ),
                const SizedBox(height: 32),
                const Text('Visual Principles', style: TextStyle(color: AppColors.white, fontSize: 22, fontWeight: FontWeight.w700)),
                const SizedBox(height: 16),
                buildBulletPoint('Typography: The art and technique of arranging type.'),
                buildBulletPoint('Color Theory: The science and art of using color.'),
                buildBulletPoint('Hierarchy: Arranging elements in order of importance.'),
                buildBulletPoint('Whitespace: The negative space that gives elements room to breathe.'),
                const SizedBox(height: 48),
                const PrevNextBar(
                  prevLabel: '« 2.4 Understanding Users',
                  nextLabel: '2.6 Designing For Everyone »',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/breadcrumb_bar.dart';
import '../../widgets/lesson_widgets.dart';

class DesignFoundationsLesson extends StatelessWidget {
  final bool sidebarCollapsed;
  final VoidCallback onExpandSidebar;
  final ValueChanged<String> onLessonTap;

  const DesignFoundationsLesson({
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
            BreadcrumbItem(label: '2.8 Design Foundations', isLast: true),
          ],
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(36, 28, 36, 36),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '2.8 Design Foundations 🏗️',
                  style: TextStyle(color: AppColors.white, fontSize: 36, fontWeight: FontWeight.w800, letterSpacing: -1.0),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Before we dive into the pixels, we need to understand the foundations. This includes design systems, grid systems, and layout principles.',
                  style: TextStyle(color: AppColors.greyLight, fontSize: 16, height: 1.7),
                ),
                const SizedBox(height: 32),
                const Text('Design Systems', style: TextStyle(color: AppColors.white, fontSize: 22, fontWeight: FontWeight.w700)),
                const SizedBox(height: 16),
                const Text(
                  'A design system is a collection of reusable components, guided by clear standards, that can be assembled together to build any number of applications.',
                  style: TextStyle(color: AppColors.greyLight, fontSize: 16, height: 1.7),
                ),
                const SizedBox(height: 48),
                PrevNextBar(
                  prevLabel: '« 2.7 Design Process',
                  nextLabel: 'Next Module: 03 - UI Design »',
                  onPrev: () => onLessonTap('2.7 Design Process 🎉📞'),
                  onNext: () => onLessonTap('03 – User Centered Design'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

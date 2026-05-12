import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/breadcrumb_bar.dart';
import '../../widgets/lesson_widgets.dart';

class DesignProcessLesson extends StatelessWidget {
  final bool sidebarCollapsed;
  final VoidCallback onExpandSidebar;

  const DesignProcessLesson({
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
            BreadcrumbItem(label: '2.7 Design Process 🎉📞', isLast: true),
          ],
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(36, 28, 36, 36),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '2.7 Design Process 🎉📞',
                  style: TextStyle(color: AppColors.white, fontSize: 36, fontWeight: FontWeight.w800, letterSpacing: -1.0),
                ),
                const SizedBox(height: 24),
                const Text(
                  'The design process is the glue that holds everything together. It\'s the framework we use to move from a vague idea to a polished, validated product.',
                  style: TextStyle(color: AppColors.greyLight, fontSize: 16, height: 1.7),
                ),
                const SizedBox(height: 32),
                const Text('The Double Diamond', style: TextStyle(color: AppColors.white, fontSize: 22, fontWeight: FontWeight.w700)),
                const SizedBox(height: 16),
                const Text(
                  'The Double Diamond is a visual representation of the design process. It consists of four stages: Discover, Define, Develop, and Deliver.',
                  style: TextStyle(color: AppColors.greyLight, fontSize: 16, height: 1.7),
                ),
                const SizedBox(height: 48),
                const PrevNextBar(
                  prevLabel: '« 2.6 Designing For Everyone',
                  nextLabel: '2.8 Design Foundations »',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

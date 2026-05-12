import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/breadcrumb_bar.dart';
import '../../widgets/lesson_widgets.dart';

class YourCareerLesson extends StatelessWidget {
  final bool sidebarCollapsed;
  final VoidCallback onExpandSidebar;

  const YourCareerLesson({
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
            BreadcrumbItem(label: '2.2 Your Career', isLast: true),
          ],
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(36, 28, 36, 36),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '2.2 Your Career 🚀',
                  style: TextStyle(color: AppColors.white, fontSize: 36, fontWeight: FontWeight.w800, letterSpacing: -1.0),
                ),
                const SizedBox(height: 24),
                const Text(
                  'A career in UX/UI design is one of the most rewarding and dynamic paths in the modern tech landscape. As a designer, you are at the intersection of psychology, technology, and art.',
                  style: TextStyle(color: AppColors.greyLight, fontSize: 16, height: 1.7),
                ),
                const SizedBox(height: 32),
                const Text('Key Career Paths', style: TextStyle(color: AppColors.white, fontSize: 22, fontWeight: FontWeight.w700)),
                const SizedBox(height: 16),
                buildBulletPoint('UX Researcher: Focuses on understanding user needs and behaviors.'),
                buildBulletPoint('UI Designer: Specializes in the visual and interactive elements of a product.'),
                buildBulletPoint('Product Designer: A holistic role covering both UX and UI, often involved in business strategy.'),
                buildBulletPoint('Interaction Designer: Focuses on how a user interacts with a product, specifically transitions and animations.'),
                const SizedBox(height: 48),
                const PrevNextBar(
                  prevLabel: '« 2.1 The Way Of The Designer',
                  nextLabel: '2.3 Design Thinking ⭐ »',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

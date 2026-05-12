import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/breadcrumb_bar.dart';
import '../../widgets/lesson_widgets.dart';

class UnderstandingUsersLesson extends StatelessWidget {
  final bool sidebarCollapsed;
  final VoidCallback onExpandSidebar;

  const UnderstandingUsersLesson({
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
            BreadcrumbItem(label: '2.4 Understanding Users', isLast: true),
          ],
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(36, 28, 36, 36),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '2.4 Understanding Users 👥',
                  style: TextStyle(color: AppColors.white, fontSize: 36, fontWeight: FontWeight.w800, letterSpacing: -1.0),
                ),
                const SizedBox(height: 24),
                const Text(
                  'To design great products, you must first understand the people who will use them. This section covers the fundamental tools for user research and empathy.',
                  style: TextStyle(color: AppColors.greyLight, fontSize: 16, height: 1.7),
                ),
                const SizedBox(height: 32),
                const Text('User Personas', style: TextStyle(color: AppColors.white, fontSize: 22, fontWeight: FontWeight.w700)),
                const SizedBox(height: 16),
                const Text(
                  'Personas are fictional characters, which you create based upon your research in order to represent the different user types that might use your service, product, site, or brand in a similar way.',
                  style: TextStyle(color: AppColors.greyLight, fontSize: 16, height: 1.7),
                ),
                const SizedBox(height: 48),
                const PrevNextBar(
                  prevLabel: '« 2.3 Design Thinking',
                  nextLabel: '2.5 The Visuals »',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

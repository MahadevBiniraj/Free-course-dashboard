import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/breadcrumb_bar.dart';
import '../../widgets/lesson_widgets.dart';

class DesigningForEveryoneLesson extends StatelessWidget {
  final bool sidebarCollapsed;
  final VoidCallback onExpandSidebar;

  const DesigningForEveryoneLesson({
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
            BreadcrumbItem(label: '2.6 Designing For Everyone', isLast: true),
          ],
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(36, 28, 36, 36),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '2.6 Designing For Everyone 🌍',
                  style: TextStyle(color: AppColors.white, fontSize: 36, fontWeight: FontWeight.w800, letterSpacing: -1.0),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Accessibility and inclusive design are core to modern UX. Designing for everyone means ensuring that people of all abilities can use your product.',
                  style: TextStyle(color: AppColors.greyLight, fontSize: 16, height: 1.7),
                ),
                const SizedBox(height: 32),
                const Text('Accessibility Guidelines (WCAG)', style: TextStyle(color: AppColors.white, fontSize: 22, fontWeight: FontWeight.w700)),
                const SizedBox(height: 16),
                buildBulletPoint('Perceivable: Information and UI components must be presentable to users in ways they can perceive.'),
                buildBulletPoint('Operable: UI components and navigation must be operable.'),
                buildBulletPoint('Understandable: Information and the operation of the UI must be understandable.'),
                buildBulletPoint('Robust: Content must be robust enough that it can be interpreted reliably by a wide variety of user agents.'),
                const SizedBox(height: 48),
                const PrevNextBar(
                  prevLabel: '« 2.5 The Visuals',
                  nextLabel: '2.7 Design Process »',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

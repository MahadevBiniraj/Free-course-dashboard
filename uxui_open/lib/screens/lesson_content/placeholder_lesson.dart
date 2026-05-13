import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/breadcrumb_bar.dart';

class PlaceholderLesson extends StatelessWidget {
  final String title;
  final bool sidebarCollapsed;
  final VoidCallback onExpandSidebar;
  final ValueChanged<String> onLessonTap;

  const PlaceholderLesson({
    super.key,
    required this.title,
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
          items: [
            BreadcrumbItem(label: title),
          ],
        ),
        Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.construction, color: AppColors.green, size: 48),
                const SizedBox(height: 24),
                Text(
                  '$title content coming soon',
                  style: const TextStyle(
                    color: AppColors.greyLight,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

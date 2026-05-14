import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class BreadcrumbBar extends StatelessWidget {
  final bool sidebarCollapsed;
  final VoidCallback onExpandSidebar;
  final List<BreadcrumbItem> items;

  const BreadcrumbBar({
    super.key,
    required this.sidebarCollapsed,
    required this.onExpandSidebar,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.cardBorder)),
      ),
      child: Row(
        children: [
          if (sidebarCollapsed)
            IconButton(
              icon: const Icon(Icons.keyboard_double_arrow_right,
                  color: AppColors.grey, size: 20),
              onPressed: onExpandSidebar,
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
            ),
          InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.home_outlined, color: AppColors.grey, size: 17),
          ),
          ...items.expand((item) => [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6),
                  child: Text('›', style: TextStyle(color: AppColors.greyDark)),
                ),
                item.isLast
                    ? Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.greenDim,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          item.label,
                          style: const TextStyle(
                            color: AppColors.green,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                    : Text(
                        item.label,
                        style: TextStyle(
                          color: item.color ?? AppColors.greyLight,
                          fontSize: 14,
                          fontWeight: item.color != null ? FontWeight.w600 : FontWeight.normal,
                        ),
                      ),
              ]),
        ],
      ),
    );
  }
}

class BreadcrumbItem {
  final String label;
  final bool isLast;
  final Color? color;

  const BreadcrumbItem({
    required this.label,
    this.isLast = false,
    this.color,
  });
}

import 'package:flutter/material.dart';
import '../models/course_data.dart';
import '../theme/app_theme.dart';

class NavSidebar extends StatelessWidget {
  final List<CourseSection> sections;
  final int expandedIndex;
  final String selectedLesson;
  final ValueChanged<int> onSectionTap;
  final ValueChanged<String> onLessonTap;
  final VoidCallback onCollapse;

  const NavSidebar({
    super.key,
    required this.sections,
    required this.expandedIndex,
    required this.selectedLesson,
    required this.onSectionTap,
    required this.onLessonTap,
    required this.onCollapse,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Sidebar Header (Logo and Title)
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: AppColors.cardBorder)),
          ),
          child: Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.green, width: 1.5),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.all_inclusive,
                    color: AppColors.green, size: 18),
              ),
              const SizedBox(width: 12),
              const Text(
                'UX/UI Open',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.2,
                ),
              ),
            ],
          ),
        ),
        // Scrollable nav list
        Expanded(
          child: ListView.builder(
            itemCount: sections.length,
            itemBuilder: (ctx, i) {
              final section = sections[i];

              if (section.isPhaseHeader) {
                return PhaseHeader(title: section.title);
              }

              final isExpanded = i == expandedIndex;

              return SectionTile(
                section: section,
                isExpanded: isExpanded,
                selectedLesson: selectedLesson,
                onTap: () => onSectionTap(i),
                onLessonTap: onLessonTap,
              );
            },
          ),
        ),

        // Collapse button
        InkWell(
          onTap: onCollapse,
          child: Container(
            height: 44,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              border: Border(top: BorderSide(color: AppColors.cardBorder)),
            ),
            child: const Icon(Icons.keyboard_double_arrow_left,
                color: AppColors.grey, size: 20),
          ),
        ),
      ],
    );
  }
}

class PhaseHeader extends StatelessWidget {
  final String title;
  const PhaseHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Text(
        title.toUpperCase(),
        style: const TextStyle(
          color: AppColors.greyLight,
          fontSize: 12,
          fontWeight: FontWeight.w800,
          letterSpacing: 1.5,
        ),
      ),
    );
  }
}

class SectionTile extends StatelessWidget {
  final CourseSection section;
  final bool isExpanded;
  final String selectedLesson;
  final VoidCallback onTap;
  final ValueChanged<String> onLessonTap;

  const SectionTile({
    super.key,
    required this.section,
    required this.isExpanded,
    required this.selectedLesson,
    required this.onTap,
    required this.onLessonTap,
  });

  // Determine accent color based on section
  static const _coralAccent = Color(0xFFE85D75);
  static const _coralDim = Color(0xFF2A1F2D);

  Color get _accent {
    if (section.title.startsWith('01')) return AppColors.green;
    return _coralAccent;
  }

  Color get _dimBg {
    if (section.title.startsWith('01')) return AppColors.greenDim;
    return _coralDim;
  }

  @override
  Widget build(BuildContext context) {
    final hasLessons = section.lessons.isNotEmpty;
    final accent = _accent;
    final dimBg = _dimBg;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section header row
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: isExpanded ? dimBg : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    section.title,
                    style: TextStyle(
                      color: isExpanded ? accent : AppColors.greyLight,
                      fontSize: 15,
                      fontWeight:
                          isExpanded ? FontWeight.w700 : FontWeight.w500,
                    ),
                  ),
                ),
                if (hasLessons)
                  AnimatedRotation(
                    turns: isExpanded ? 0.25 : 0,
                    duration: const Duration(milliseconds: 200),
                    child: Icon(
                      Icons.chevron_right,
                      color: isExpanded ? accent : AppColors.grey,
                      size: 18,
                    ),
                  ),
              ],
            ),
          ),
        ),

        // Lesson list (expanded)
        if (isExpanded && hasLessons)
          Padding(
            padding: const EdgeInsets.only(top: 4, bottom: 4),
            child: Column(
              children: section.lessons.map((lesson) {
                final isSelected = selectedLesson == lesson;
                return InkWell(
                  onTap: () => onLessonTap(lesson),
                  borderRadius: BorderRadius.circular(6),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 1),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                    decoration: BoxDecoration(
                      color: isSelected ? dimBg : Colors.transparent,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Row(
                      children: [
                        if (isSelected)
                          Container(
                            width: 3,
                            height: 16,
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              color: accent,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        Expanded(
                          child: Text(
                            lesson,
                            style: TextStyle(
                              color: isSelected ? accent : AppColors.greyLight,
                              fontSize: 14,
                              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
      ],
    );
  }
}

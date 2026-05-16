import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/course_data.dart';
import '../theme/app_theme.dart';

class ModernSidebar extends StatefulWidget {
  final List<CourseSection> sections;
  final int initialExpandedIndex;
  final String selectedLesson;
  final ValueChanged<String> onLessonTap;
  final VoidCallback onCollapse;

  const ModernSidebar({
    super.key,
    required this.sections,
    this.initialExpandedIndex = 2, // Default to section 03
    required this.selectedLesson,
    required this.onLessonTap,
    required this.onCollapse,
  });

  @override
  State<ModernSidebar> createState() => _ModernSidebarState();
}

class _ModernSidebarState extends State<ModernSidebar> {
  late int expandedIndex;

  @override
  void initState() {
    super.initState();
    expandedIndex = widget.initialExpandedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(5, 0),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildHeader(),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
              itemCount: widget.sections.length,
              itemBuilder: (context, index) {
                final section = widget.sections[index];
                if (section.isPhaseHeader) {
                  return _buildPhaseHeader(section.title);
                }
                return _buildSectionTile(section, index);
              },
            ),
          ),
          _buildFooter(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.white.withOpacity(0.05)),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColors.accent, AppColors.accentDeep],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
              child: Text(
                'U',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Text(
            'UX/UI Design',
            style: TextStyle(fontFamily: 'Lufga', 
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w800,
              letterSpacing: -0.8,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPhaseHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, top: 24, bottom: 8),
      child: Text(
        title.toUpperCase(),
        style: TextStyle(fontFamily: 'Lufga', 
          color: Colors.white.withOpacity(0.3),
          fontSize: 11,
          fontWeight: FontWeight.w800,
          letterSpacing: 1.5,
        ),
      ),
    );
  }

  Widget _buildSectionTile(CourseSection section, int index) {
    final bool isExpanded = expandedIndex == index;
    
    return Column(
      children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              setState(() {
                expandedIndex = isExpanded ? -1 : index;
              });
            },
            borderRadius: BorderRadius.circular(12),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                color: isExpanded ? AppColors.greenDim : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      section.title,
                      style: TextStyle(fontFamily: 'Lufga', 
                        color: isExpanded ? AppColors.accent : AppColors.greyLight,
                        fontSize: 16,
                        fontWeight: isExpanded ? FontWeight.w600 : FontWeight.w500,
                      ),
                    ),
                  ),
                  AnimatedRotation(
                    turns: isExpanded ? 0.25 : 0,
                    duration: const Duration(milliseconds: 200),
                    child: Icon(
                      Icons.chevron_right,
                      color: isExpanded ? AppColors.accent : AppColors.grey,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (isExpanded)
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 4),
            child: Column(
              children: section.lessons.map((lesson) => _buildSubItem(lesson)).toList(),
            ),
          ),
        const SizedBox(height: 4),
      ],
    );
  }

  Widget _buildSubItem(String lesson) {
    final bool isSelected = widget.selectedLesson == lesson;
    final bool hasStar = lesson.contains('⭐');
    final String cleanText = lesson.replaceAll('⭐', '').trim();

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => widget.onLessonTap(lesson),
        borderRadius: BorderRadius.circular(10),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.only(bottom: 2),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.greyDark : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected ? Colors.white.withOpacity(0.05) : Colors.transparent,
            ),
          ),
          child: Row(
            children: [
              if (isSelected)
                Container(
                  width: 3,
                  height: 16,
                  margin: const EdgeInsets.only(right: 12),
                  decoration: BoxDecoration(
                    color: AppColors.accent,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              Expanded(
                child: Text(
                  cleanText,
                  style: GoogleFonts.inter(
                    color: isSelected ? Colors.white : AppColors.greyLight,
                    fontSize: 14,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                  ),
                ),
              ),
              if (hasStar)
                const Icon(
                  Icons.star_rounded,
                  color: AppColors.yellow,
                  size: 16,
                ),
            ],
          ),
        ),
      ),
    );

  }

  Widget _buildFooter() {
    return Column(
      children: [
        InkWell(
          onTap: widget.onCollapse,
          child: Container(
            height: 44,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Colors.white.withOpacity(0.05))),
            ),
            child: const Icon(Icons.keyboard_double_arrow_left,
                color: AppColors.greyLight, size: 20),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(
            'Modern Dashboard v2.0',
            style: TextStyle(fontFamily: 'Lufga', 
              color: Colors.white.withOpacity(0.2),
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}

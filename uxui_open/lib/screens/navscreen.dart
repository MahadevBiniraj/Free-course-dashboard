import 'package:flutter/material.dart';

void main() {
  runApp(const UXUIApp());
}

class UXUIApp extends StatelessWidget {
  const UXUIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UX/UI Course',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF1A1A1A),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFFF6B4A),
          surface: Color(0xFF242424),
        ),
      ),
      home: const CourseNavPage(),
    );
  }
}

// ─── Data Model ──────────────────────────────────────────────────────────────

class CourseSection {
  final String title;
  final List<String> lessons;
  final bool isPhaseHeader; // non-expandable divider row

  const CourseSection({
    required this.title,
    this.lessons = const [],
    this.isPhaseHeader = false,
  });
}

const List<CourseSection> kSections = [
  CourseSection(title: 'UX/UI Course Intro', lessons: [
    '1.1 Welcome',
    '1.2 Code of Conduct',
    '1.3 Slack 🎯',
    '1.4 Program Overview ⭐',
  ]),
  CourseSection(title: '02 – UX Fundamentals'),
  CourseSection(title: '03 – User Centered Design'),
  CourseSection(title: '04 – Visual Design'),
  CourseSection(title: 'UX Intensive Phase 🏛', isPhaseHeader: true),
  CourseSection(title: '05 – Discover'),
  CourseSection(title: '06 – Define'),
  CourseSection(title: '07 – Develop'),
  CourseSection(title: '08 – Deliver'),
  CourseSection(title: 'Team Design Phase 🏛', isPhaseHeader: true),
  CourseSection(title: '09 – Defining A Product'),
  CourseSection(title: '10 – Low Fidelity Prototyping'),
];

// ─── Main Page ────────────────────────────────────────────────────────────────

class CourseNavPage extends StatefulWidget {
  const CourseNavPage({super.key});

  @override
  State<CourseNavPage> createState() => _CourseNavPageState();
}

class _CourseNavPageState extends State<CourseNavPage> {
  // Index of the expanded section (0 = Course Intro / Orientation)
  int _expandedIndex = 0;
  // Selected lesson inside the expanded section
  String _selectedLesson = '01 - Orientation';
  bool _sidebarCollapsed = false;

  static const double kSidebarWidth = 270;
  static const double kCollapsedWidth = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      body: Row(
        children: [
          // ── Sidebar ──────────────────────────────────────────────────────
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            width: _sidebarCollapsed ? kCollapsedWidth : kSidebarWidth,
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
              color: Color(0xFF242424),
            ),
            child: _SidebarContent(
              sections: kSections,
              expandedIndex: _expandedIndex,
              selectedLesson: _selectedLesson,
              onSectionTap: (i) => setState(() => _expandedIndex = i),
              onLessonTap: (l) => setState(() => _selectedLesson = l),
              onCollapse: () => setState(() => _sidebarCollapsed = true),
            ),
          ),

          // ── Main content ─────────────────────────────────────────────────
          Expanded(
            child: _MainContent(
              sidebarCollapsed: _sidebarCollapsed,
              onExpandSidebar: () => setState(() => _sidebarCollapsed = false),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Sidebar ──────────────────────────────────────────────────────────────────

class _SidebarContent extends StatelessWidget {
  final List<CourseSection> sections;
  final int expandedIndex;
  final String selectedLesson;
  final ValueChanged<int> onSectionTap;
  final ValueChanged<String> onLessonTap;
  final VoidCallback onCollapse;

  const _SidebarContent({
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
      children: [
        // Scrollable nav list
        Expanded(
          child: ListView.builder(
            itemCount: sections.length,
            itemBuilder: (ctx, i) {
              final section = sections[i];

              if (section.isPhaseHeader) {
                return _PhaseHeader(title: section.title);
              }

              final isExpanded = i == expandedIndex;

              return _SectionTile(
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
              border: Border(top: BorderSide(color: Color(0xFF333333))),
            ),
            child: const Icon(Icons.keyboard_double_arrow_left,
                color: Color(0xFF888888), size: 20),
          ),
        ),
      ],
    );
  }
}

class _PhaseHeader extends StatelessWidget {
  final String title;
  const _PhaseHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Text(
        title,
        style: const TextStyle(
          color: Color(0xFFCCCCCC),
          fontSize: 13,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.2,
        ),
      ),
    );
  }
}

class _SectionTile extends StatelessWidget {
  final CourseSection section;
  final bool isExpanded;
  final String selectedLesson;
  final VoidCallback onTap;
  final ValueChanged<String> onLessonTap;

  const _SectionTile({
    required this.section,
    required this.isExpanded,
    required this.selectedLesson,
    required this.onTap,
    required this.onLessonTap,
  });

  @override
  Widget build(BuildContext context) {
    final hasLessons = section.lessons.isNotEmpty;
    final accent = const Color(0xFFFF6B4A);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section header row
        InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    section.title,
                    style: TextStyle(
                      color: isExpanded ? accent : const Color(0xFFCCCCCC),
                      fontSize: 13.5,
                      fontWeight:
                          isExpanded ? FontWeight.w600 : FontWeight.w400,
                    ),
                  ),
                ),
                if (hasLessons)
                  Icon(
                    isExpanded ? Icons.expand_more : Icons.chevron_right,
                    color: isExpanded ? accent : const Color(0xFF666666),
                    size: 18,
                  ),
              ],
            ),
          ),
        ),

        // Lesson list (expanded)
        if (isExpanded && hasLessons)
          ...section.lessons.map((lesson) {
            final isSelected = selectedLesson == lesson;
            return InkWell(
              onTap: () => onLessonTap(lesson),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 9),
                decoration: BoxDecoration(
                  color:
                      isSelected ? const Color(0xFF2E2E2E) : Colors.transparent,
                ),
                child: Text(
                  lesson,
                  style: TextStyle(
                    color: const Color(0xFFAAAAAA),
                    fontSize: 13,
                    fontWeight:
                        isSelected ? FontWeight.w500 : FontWeight.normal,
                  ),
                ),
              ),
            );
          }),
      ],
    );
  }
}

// ─── Main Content ─────────────────────────────────────────────────────────────

class _MainContent extends StatelessWidget {
  final bool sidebarCollapsed;
  final VoidCallback onExpandSidebar;

  const _MainContent({
    required this.sidebarCollapsed,
    required this.onExpandSidebar,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Top breadcrumb bar ────────────────────────────────────────────
        _BreadcrumbBar(
          sidebarCollapsed: sidebarCollapsed,
          onExpandSidebar: onExpandSidebar,
        ),

        // ── Scrollable body ───────────────────────────────────────────────
        Expanded(
          child: Center(
            child: Text(
              'Lesson content will appear here.',
              style: TextStyle(
                color: Color(0xFF666666),
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// ─── Breadcrumb Bar ───────────────────────────────────────────────────────────

class _BreadcrumbBar extends StatelessWidget {
  final bool sidebarCollapsed;
  final VoidCallback onExpandSidebar;

  const _BreadcrumbBar({
    required this.sidebarCollapsed,
    required this.onExpandSidebar,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFF2E2E2E))),
      ),
      child: Row(
        children: [
          // Expand button (only when collapsed)
          if (sidebarCollapsed)
            IconButton(
              icon: const Icon(Icons.keyboard_double_arrow_right,
                  color: Color(0xFF888888), size: 20),
              onPressed: onExpandSidebar,
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
            ),

          const Icon(Icons.home_outlined, color: Color(0xFF888888), size: 17),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 6),
            child: Text('›', style: TextStyle(color: Color(0xFF555555))),
          ),
          const Text(
            '01 – Orientation',
            style: TextStyle(
              color: Color(0xFFFF6B4A),
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

// End of navscreen.dart

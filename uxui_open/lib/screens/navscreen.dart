import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

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
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: const ColorScheme.dark(
          primary: AppColors.green,
          surface: AppColors.cardBackground,
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
  CourseSection(title: '01 - Orientation', lessons: [
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

// ─── Orientation cards data ───────────────────────────────────────────────────

const List<Map<String, String>> kCards = [
  {
    'title': '1.1 Welcome',
    'subtitle': "Welcome to UX/UI Open! It's so great to have you here 😄",
  },
  {
    'title': '1.2 Code of Conduct',
    'subtitle':
        'Slack access is a part of our Plus plan 🧡. The Slack section is fo...',
  },
  {
    'title': '1.3 Slack 🎯',
    'subtitle':
        'By the end of this checkpoint, you should be able to join UX/UI ...',
  },
  {
    'title': '1.4 Program Overview ⭐',
    'subtitle':
        'By the end of this checkpoint, you should be able to identify the...',
  },
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
  String _selectedLesson = '1.1 Welcome';
  bool _sidebarCollapsed = false;

  static const double kSidebarWidth = 320;
  static const double kCollapsedWidth = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Row(
        children: [
          // ── Sidebar ──────────────────────────────────────────────────────
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            width: _sidebarCollapsed ? kCollapsedWidth : kSidebarWidth,
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
              color: AppColors.cardBackground,
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

class _PhaseHeader extends StatelessWidget {
  final String title;
  const _PhaseHeader({required this.title});

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
    const accent = AppColors.green;

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
                      color: isExpanded ? accent : AppColors.greyLight,
                      fontSize: 15,
                      fontWeight:
                          isExpanded ? FontWeight.w700 : FontWeight.w500,
                    ),
                  ),
                ),
                if (hasLessons)
                  Icon(
                    isExpanded ? Icons.expand_more : Icons.chevron_right,
                    color: isExpanded ? accent : AppColors.grey,
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
                  color: isSelected ? AppColors.greenDim : Colors.transparent,
                ),
                child: Text(
                  lesson,
                  style: TextStyle(
                    color: isSelected ? AppColors.white : AppColors.greyLight,
                    fontSize: 14,
                    fontWeight:
                        isSelected ? FontWeight.w600 : FontWeight.w400,
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
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(36, 28, 36, 36),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                const Text(
                  '01 – Orientation',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 38,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -1.0,
                  ),
                ),
                const SizedBox(height: 12),

                // Subtitle
                const Text(
                  'Get started with the UX/UI Open curriculum and set yourself up with '
                  'the best support system and network to ace your learning.',
                  style: TextStyle(
                    color: AppColors.greyLight,
                    fontSize: 16,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 32),

                // 2-column card grid
                _CardGrid(cards: kCards),
                const SizedBox(height: 36),

                // Prev / Next navigation
                const _PrevNextBar(),
              ],
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
        border: Border(bottom: BorderSide(color: AppColors.cardBorder)),
      ),
      child: Row(
        children: [
          // Expand button (only when collapsed)
          if (sidebarCollapsed)
            IconButton(
              icon: const Icon(Icons.keyboard_double_arrow_right,
                  color: AppColors.grey, size: 20),
              onPressed: onExpandSidebar,
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
            ),

          const Icon(Icons.home_outlined, color: AppColors.grey, size: 17),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 6),
            child: Text('›', style: TextStyle(color: AppColors.greyDark)),
          ),
          const Text(
            '01 – Orientation',
            style: TextStyle(
              color: AppColors.green,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Card Grid ────────────────────────────────────────────────────────────────

class _CardGrid extends StatelessWidget {
  final List<Map<String, String>> cards;
  const _CardGrid({required this.cards});

  @override
  Widget build(BuildContext context) {
    // Responsive: 2 columns on wide, 1 on narrow
    return LayoutBuilder(builder: (ctx, constraints) {
      final cols = constraints.maxWidth > 520 ? 2 : 1;
      final rows = (cards.length / cols).ceil();

      return Column(
        children: List.generate(rows, (r) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Row(
              children: List.generate(cols, (c) {
                final idx = r * cols + c;
                if (idx >= cards.length)
                  return const Expanded(child: SizedBox());
                return Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: c == 1 ? 16 : 0),
                    child: _LessonCard(data: cards[idx]),
                  ),
                );
              }),
            ),
          );
        }),
      );
    });
  }
}

class _LessonCard extends StatelessWidget {
  final Map<String, String> data;
  const _LessonCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.insert_drive_file_outlined,
                  color: AppColors.grey, size: 16),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  data['title']!,
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            data['subtitle']!,
            style: const TextStyle(
              color: AppColors.greyLight,
              fontSize: 14,
              height: 1.6,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

// ─── Prev / Next Bar ─────────────────────────────────────────────────────────

class _PrevNextBar extends StatelessWidget {
  const _PrevNextBar();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: _NavButton(
                label: '« UX/UI Course Intro', align: TextAlign.left)),
        const SizedBox(width: 16),
        Expanded(
            child: _NavButton(label: '1.1 Welcome »', align: TextAlign.right)),
      ],
    );
  }
}

class _NavButton extends StatelessWidget {
  final String label;
  final TextAlign align;
  const _NavButton({required this.label, required this.align});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Text(
        label,
        textAlign: align,
        style: const TextStyle(
          color: AppColors.greyLight,
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

// End of navscreen.dart

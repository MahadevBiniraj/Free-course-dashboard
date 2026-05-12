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
  CourseSection(title: '02 – UX Fundamentals', lessons: [
    '2.1 The Way Of The Designer ⭐',
    '2.2 Your Career',
    '2.3 Design Thinking ⭐',
    '2.4 Understanding Users',
    '2.5 The Visuals',
    '2.6 Designing For Everyone',
    '2.7 Design Process 🎉📞',
    '2.8 Design Foundations',
  ]),
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
              onSectionTap: (i) => setState(() {
                _expandedIndex = i;
                _selectedLesson = kSections[i].title;
              }),
              onLessonTap: (l) => setState(() => _selectedLesson = l),
              onCollapse: () => setState(() => _sidebarCollapsed = true),
            ),
          ),

          // ── Main content ─────────────────────────────────────────────────
          Expanded(
            child: _MainContent(
              sidebarCollapsed: _sidebarCollapsed,
              selectedLesson: _selectedLesson,
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

// ─── Main Content ─────────────────────────────────────────────────────────────

class _MainContent extends StatelessWidget {
  final bool sidebarCollapsed;
  final String selectedLesson;
  final VoidCallback onExpandSidebar;

  const _MainContent({
    required this.sidebarCollapsed,
    required this.selectedLesson,
    required this.onExpandSidebar,
  });

  @override
  Widget build(BuildContext context) {
    if (selectedLesson == '1.1 Welcome') {
      return _WelcomeContent(
        sidebarCollapsed: sidebarCollapsed,
        onExpandSidebar: onExpandSidebar,
      );
    }
    
    if (selectedLesson == '1.2 Code of Conduct') {
      return _CodeOfConductContent(
        sidebarCollapsed: sidebarCollapsed,
        onExpandSidebar: onExpandSidebar,
      );
    }
    
    if (selectedLesson == '01 - Orientation') {
      return _OrientationContent(
        sidebarCollapsed: sidebarCollapsed,
        onExpandSidebar: onExpandSidebar,
      );
    }
    
    if (selectedLesson == '1.4 Program Overview ⭐') {
      return _ProgramOverviewContent(
        sidebarCollapsed: sidebarCollapsed,
        onExpandSidebar: onExpandSidebar,
      );
    }

    if (selectedLesson == '02 – UX Fundamentals') {
      return _UXFundamentalsOverviewContent(
        sidebarCollapsed: sidebarCollapsed,
        onExpandSidebar: onExpandSidebar,
      );
    }

    if (selectedLesson == '2.1 The Way Of The Designer ⭐') {
      return _WayOfDesignerContent(
        sidebarCollapsed: sidebarCollapsed,
        onExpandSidebar: onExpandSidebar,
      );
    }
    
    return _PlaceholderContent(
      title: selectedLesson,
      sidebarCollapsed: sidebarCollapsed,
      onExpandSidebar: onExpandSidebar,
    );
  }
}

class _OrientationContent extends StatelessWidget {
  final bool sidebarCollapsed;
  final VoidCallback onExpandSidebar;

  const _OrientationContent({
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

// ─── Welcome Content ──────────────────────────────────────────────────────────

class _WelcomeContent extends StatelessWidget {
  final bool sidebarCollapsed;
  final VoidCallback onExpandSidebar;

  const _WelcomeContent({
    required this.sidebarCollapsed,
    required this.onExpandSidebar,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Top breadcrumb bar ────────────────────────────────────────────
        _WelcomeBreadcrumbBar(
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
                  '1.1 Welcome',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 38,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -1.0,
                  ),
                ),
                const SizedBox(height: 24),

                // Content
                _paragraph("Welcome to UX/UI Open! It's so great to have you here 🤩"),
                const SizedBox(height: 20),
                _paragraph("Today, you embark on a journey that, with hard work, will result in a new career and trajectory for your life. That's a big deal."),
                const SizedBox(height: 20),
                _paragraph("In this program, you will learn essential skills for your new career. But before you begin, it's helpful to spend a few minutes familiarizing yourself with the major components of your program, the network that's here to assist you, the UX/UI communication platform (Open Bootcamp's Slack workspace for paid users), and some general student expectations and code of conduct."),
                const SizedBox(height: 20),
                _paragraph("Now it's time to dive in!"),
                
                const SizedBox(height: 48),

                // Prev / Next navigation
                const Row(
                  children: [
                    Expanded(child: _NavButton(label: '« 01 - Orientation', align: TextAlign.left)),
                    SizedBox(width: 16),
                    Expanded(child: _NavButton(label: '1.2 Code of Conduct »', align: TextAlign.right)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _paragraph(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: AppColors.greyLight,
        fontSize: 16,
        height: 1.7,
      ),
    );
  }
}

class _WelcomeBreadcrumbBar extends StatelessWidget {
  final bool sidebarCollapsed;
  final VoidCallback onExpandSidebar;

  const _WelcomeBreadcrumbBar({
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
            '01 - Orientation',
            style: TextStyle(
              color: AppColors.greyLight,
              fontSize: 14,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 6),
            child: Text('›', style: TextStyle(color: AppColors.greyDark)),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFF2A1F2D), // Very dark pinkish/purple grey
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              '1.1 Welcome',
              style: TextStyle(
                color: Color(0xFFE85D75), // The pinkish text from the image
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Code of Conduct Content ───────────────────────────────────────────────────

class _CodeOfConductContent extends StatelessWidget {
  final bool sidebarCollapsed;
  final VoidCallback onExpandSidebar;

  const _CodeOfConductContent({
    required this.sidebarCollapsed,
    required this.onExpandSidebar,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _CodeOfConductBreadcrumbBar(
          sidebarCollapsed: sidebarCollapsed,
          onExpandSidebar: onExpandSidebar,
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(36, 28, 36, 36),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: AppColors.cardBackground,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: AppColors.cardBorder),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'On this page',
                        style: TextStyle(color: AppColors.greyLight, fontSize: 15),
                      ),
                      Icon(Icons.keyboard_arrow_down, color: AppColors.greyLight),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  '1.2 Code of Conduct',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 38,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -1.0,
                  ),
                ),
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFF333333),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.info_outline, color: AppColors.white, size: 20),
                          SizedBox(width: 8),
                          Text(
                            'NOTE',
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.0,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Slack access is a part of our Plus plan 🧡. The Slack section is for those that have upgraded to our Plus plan. We also use slack to submit assignments, get feedback on assignments and earn certificates.',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 15,
                          height: 1.6,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                RichText(
                  text: const TextSpan(
                    style: TextStyle(color: AppColors.greyLight, fontSize: 16, height: 1.6),
                    children: [
                      TextSpan(text: 'It is mandatory to fully respect the requirements of '),
                      TextSpan(text: 'UX/UI Open', style: TextStyle(color: Color(0xFFE85D75))),
                      TextSpan(text: ' Code of Conduct to assure the best possible experience for all students.'),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                const Text(
                  'Respect people and guidelines:',
                  style: TextStyle(color: AppColors.white, fontSize: 22, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 16),
                _bulletPointRich(const [
                  TextSpan(text: 'Abusive behavior towards other students and/or '),
                  TextSpan(text: 'UX/UI Open', style: TextStyle(color: Color(0xFFE85D75))),
                  TextSpan(text: ' employees. (Either anywhere online or on our Slack community platform)'),
                ]),
                _bulletPoint('Avoid breaking national and/or local laws.'),
                _bulletPoint("Don't express sexism, racism, homophobia, ageism, ableism, or any other behavior deemed inappropriate for a healthy learning environment."),
                _bulletPoint('Be receptive to feedback and constructive criticism.'),
                _bulletPoint('Ask for help in our Slack workspace when you need it'),
                const SizedBox(height: 32),
                const Text(
                  'Open Bootcamp Content',
                  style: TextStyle(color: AppColors.white, fontSize: 22, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 16),
                _bulletPointRich(const [
                  TextSpan(text: 'Students are not allowed to photograph, record, copy nor share content without permission from '),
                  TextSpan(text: 'UX/UI Open', style: TextStyle(color: Color(0xFFE85D75))),
                  TextSpan(text: '.'),
                ]),
                _bulletPointRich(const [
                  TextSpan(text: 'The course material is licensed under '),
                  TextSpan(text: 'Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License', style: TextStyle(color: Color(0xFFE85D75))),
                  TextSpan(text: ', which means that you are free to copy and redistribute the material in any medium or format as long as the names of the original authors '),
                  TextSpan(text: 'UX/UI Open', style: TextStyle(color: Color(0xFFE85D75))),
                  TextSpan(text: ' and '),
                  TextSpan(text: 'Open Bootcamp', style: TextStyle(color: Color(0xFFE85D75))),
                  TextSpan(text: ' along with a link to the sites are not removed. If you remix, transform, or build upon the material, you may '),
                  TextSpan(text: 'not distribute', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.white)),
                  TextSpan(text: ' the modified material. '),
                  TextSpan(text: 'Using the material for commercial purposes is forbidden without permission.', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.white)),
                  TextSpan(text: ' '),
                  TextSpan(text: 'UX/UI Open', style: TextStyle(color: Color(0xFFE85D75))),
                  TextSpan(text: ' is powered and managed solely by '),
                  TextSpan(text: 'The Open Bootcamp', style: TextStyle(color: Color(0xFFE85D75))),
                  TextSpan(text: '. Please reach out to '),
                  TextSpan(text: 'uxui@theopenbootcamp.com', style: TextStyle(color: Color(0xFFE85D75))),
                  TextSpan(text: ' for queries'),
                ]),
                const SizedBox(height: 24),
                Row(
                  children: [
                    _ccIcon(Icons.copyright),
                    _ccIcon(Icons.person),
                    _ccIcon(Icons.money_off),
                    _ccIcon(Icons.block),
                  ],
                ),
                const SizedBox(height: 12),
                RichText(
                  text: const TextSpan(
                    style: TextStyle(color: AppColors.greyLight, fontSize: 16, height: 1.6),
                    children: [
                      TextSpan(text: 'This work is licensed under a '),
                      TextSpan(text: 'Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License', style: TextStyle(color: Color(0xFFE85D75))),
                      TextSpan(text: '.'),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                RichText(
                  text: const TextSpan(
                    style: TextStyle(color: AppColors.white, fontSize: 22, fontWeight: FontWeight.w700),
                    children: [
                      TextSpan(text: 'Using '),
                      TextSpan(text: 'ADPList', style: TextStyle(color: Color(0xFFE85D75))),
                      TextSpan(text: ' for FREE mentorship'),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                _bulletPointRich(const [
                  TextSpan(text: 'We\'re recommending '),
                  TextSpan(text: 'ADPList', style: TextStyle(color: Color(0xFFE85D75))),
                  TextSpan(text: ' to get mentored for FREE at our own will. This isn\'t a sponsored text. ADPList is an amazing platform that all designers must leverage to the best. ADPList also comes out regularly with free courses and workshops. '),
                  TextSpan(text: 'UX/UI Open', style: TextStyle(color: Color(0xFFE85D75))),
                  TextSpan(text: ' shall not be responsible in any way as to what happens on '),
                  TextSpan(text: 'ADPList', style: TextStyle(color: Color(0xFFE85D75))),
                  TextSpan(text: '. Please reach out to the team at '),
                  TextSpan(text: 'ADPList', style: TextStyle(color: Color(0xFFE85D75))),
                  TextSpan(text: ' for queries regarding '),
                  TextSpan(text: 'ADPList', style: TextStyle(color: Color(0xFFE85D75))),
                  TextSpan(text: '.'),
                ]),
                const SizedBox(height: 48),
                const Row(
                  children: [
                    Expanded(child: _NavButton(label: '« 1.1 Welcome', align: TextAlign.left)),
                    SizedBox(width: 16),
                    Expanded(child: _NavButton(label: '1.3 Slack 🎯 »', align: TextAlign.right)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _bulletPoint(String text) {
    return _bulletPointRich([TextSpan(text: text)]);
  }

  Widget _bulletPointRich(List<InlineSpan> spans) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 8, right: 12),
            child: CircleAvatar(backgroundColor: AppColors.greyLight, radius: 3),
          ),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: const TextStyle(color: AppColors.greyLight, fontSize: 16, height: 1.6),
                children: spans,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _ccIcon(IconData icon) {
    return Container(
      margin: const EdgeInsets.only(right: 4),
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(4),
      child: Icon(icon, size: 24, color: Colors.black),
    );
  }
}

class _CodeOfConductBreadcrumbBar extends StatelessWidget {
  final bool sidebarCollapsed;
  final VoidCallback onExpandSidebar;

  const _CodeOfConductBreadcrumbBar({
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
          if (sidebarCollapsed)
            IconButton(
              icon: const Icon(Icons.keyboard_double_arrow_right, color: AppColors.grey, size: 20),
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
            '01 - Orientation',
            style: TextStyle(color: AppColors.greyLight, fontSize: 14),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 6),
            child: Text('›', style: TextStyle(color: AppColors.greyDark)),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFF2A1F2D),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              '1.2 Code of Conduct',
              style: TextStyle(
                color: Color(0xFFE85D75),
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Program Overview Content ──────────────────────────────────────────────────

class _ProgramOverviewContent extends StatelessWidget {
  final bool sidebarCollapsed;
  final VoidCallback onExpandSidebar;

  const _ProgramOverviewContent({
    required this.sidebarCollapsed,
    required this.onExpandSidebar,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _ProgramOverviewBreadcrumbBar(
          sidebarCollapsed: sidebarCollapsed,
          onExpandSidebar: onExpandSidebar,
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(36, 28, 36, 36),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: AppColors.cardBackground,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: AppColors.cardBorder),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'On this page',
                        style: TextStyle(color: AppColors.greyLight, fontSize: 15),
                      ),
                      Icon(Icons.keyboard_arrow_down, color: AppColors.greyLight),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  '1.4 Program Overview ⭐',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 38,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -1.0,
                  ),
                ),
                const SizedBox(height: 24),
                
                // Success criteria box
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.green.withOpacity(0.1),
                    border: Border.all(color: AppColors.green),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.flag_outlined, color: AppColors.green, size: 20),
                          SizedBox(width: 8),
                          Text(
                            'Success criteria',
                            style: TextStyle(
                              color: AppColors.green,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'By the end of this checkpoint, you should be able to identify the core aspects of our program and successfully submit your first checkpoint!',
                        style: TextStyle(color: AppColors.white, fontSize: 15, height: 1.5),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.white,
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                        ),
                        child: const Text('Mark as done', style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                
                // Time
                Row(
                  children: const [
                    Icon(Icons.access_time, color: AppColors.greyLight, size: 18),
                    SizedBox(width: 8),
                    Text(
                      'Time: 1 hr 0 mins',
                      style: TextStyle(color: AppColors.greyLight, fontSize: 15),
                    ),
                    SizedBox(width: 16),
                    Icon(Icons.info_outline, color: AppColors.greyLight, size: 18),
                  ],
                ),
                const SizedBox(height: 32),
                
                // Overview Video
                const Text(
                  'Overview',
                  style: TextStyle(color: AppColors.white, fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  height: 400,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.network(
                        'https://picsum.photos/800/400?1',
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 400,
                      ),
                      Container(
                        width: double.infinity,
                        height: 400,
                        color: Colors.black.withOpacity(0.3),
                      ),
                      const Icon(Icons.play_circle_fill, color: Colors.white, size: 64),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'An overview essential for all our students, full of valuable info on what you\'ll learn, how to complete this program, and best practices. Highly recommended you watch it fully before starting the program. ☝',
                  style: TextStyle(color: AppColors.greyLight, fontSize: 15, height: 1.5),
                ),
                const SizedBox(height: 32),

                // Dashboard and curriculum overview
                const Text(
                  'Dashboard and curriculum overview',
                  style: TextStyle(color: AppColors.white, fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                const Text(
                  'UX/UI Open\'s premium curriculum is structured carefully to take you from a total beginner with no prior experience to a hired junior UI/UX designer. Your curriculum covers the main UX/UI design processes across the following phases:',
                  style: TextStyle(color: AppColors.greyLight, fontSize: 16, height: 1.6),
                ),
                const SizedBox(height: 32),

                // Lesson types and assignments
                const Text(
                  'Lesson types and assignments',
                  style: TextStyle(color: AppColors.white, fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                const Text(
                  'To ensure that you properly engage with your coursework, we alternate heavily between theory, exercises and projects. There are basically five forms of interaction for every user on our platform at Open Bootcamp:',
                  style: TextStyle(color: AppColors.greyLight, fontSize: 16, height: 1.6),
                ),
                const SizedBox(height: 24),
                
                _bulletItem('1. Reading Lessons', 'These act exactly like what you are doing right now. Talk to basically teach you concept about certain topics covered here over our platform.'),
                _bulletItem('2. Activity Lessons 🎯', 'Activity lessons are exactly as the name suggests... We\'ll be testing what you\'ve read over reading assignments through short fun activity assignments...'),
                _bulletItem('3. Self Appraised Assignments ⭐', 'These assignments are basic assignments... you appraise yourself if you got the answer correctly after clicking on the Mark as Done button...'),
                _bulletItem('4. Student Assignments 🎓', 'There are specific assignments that needs to be officially appraised and graded by us to determine if you are ready to move on. These assignments must be submitted to us and will be strictly reviewed and critiqued...'),
                _bulletItem('5. Capstone Projects', 'Capstone projects refer to projects that will be used to enhance your resume when you are done with the course...'),
                
                const SizedBox(height: 32),

                // Careers course
                const Text(
                  'Careers course',
                  style: TextStyle(color: AppColors.white, fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                const Text(
                  'In addition to the UX/UI content, all Open Bootcamp premium users have access to our Career program.',
                  style: TextStyle(color: AppColors.greyLight, fontSize: 16, height: 1.6),
                ),
                const SizedBox(height: 12),
                RichText(
                  text: const TextSpan(
                    style: TextStyle(color: AppColors.greyLight, fontSize: 16, height: 1.6),
                    children: [
                      TextSpan(text: 'Please note: your job search starts on '),
                      TextSpan(text: 'Day One', style: TextStyle(color: Color(0xFFE85D75), fontWeight: FontWeight.bold)),
                      TextSpan(text: ' of this program. UX/UI Open is partnered with The Career program provided by '),
                      TextSpan(text: 'Open Bootcamp', style: TextStyle(color: Color(0xFFE85D75))),
                      TextSpan(text: '. This career program teaches you everything you need to get a job in tech, including:'),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE5F1EB),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'Learn Software Development',
                          style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: AppColors.green,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text('Live', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                _bulletPoint('How to conduct an effective job search that will result in a tech job that you will genuinely enjoy'),
                _bulletPoint('How to build a network of mentors and peers to lean on, learn from, and collaborate with as you progress throughout your new tech career'),
                _bulletPoint('How to present yourself through your resume, LinkedIn profile, online portfolio, and other online presence in the best possible light'),
                _bulletPoint('How to pass technical screens, take home assignments, and non-technical interviews'),
                _bulletPoint('How to negotiate effectively and get paid what you are worth as a professional'),

                const SizedBox(height: 32),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF7F7F7),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'A better way to learn coding',
                        style: TextStyle(color: Colors.black, fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Image.network('https://picsum.photos/400/300?2', fit: BoxFit.cover),
                          ),
                          const SizedBox(width: 24),
                          Expanded(
                            child: Column(
                              children: [
                                _tag('Live'),
                                const SizedBox(height: 12),
                                _tag('Engaging'),
                                const SizedBox(height: 12),
                                _tag('Interactive'),
                                const SizedBox(height: 12),
                                _tag('Project Based'),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'webdevopen.com',
                        style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                // Graduation
                const Text(
                  'Graduation',
                  style: TextStyle(color: AppColors.white, fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                RichText(
                  text: const TextSpan(
                    style: TextStyle(color: AppColors.greyLight, fontSize: 16, height: 1.6),
                    children: [
                      TextSpan(text: 'Due to the rigorous and practical nature of this program, completing the requirements for graduation is a major feat. Those who are successful in completing our full rigorous program will be officially recognized as certified '),
                      TextSpan(text: 'Open Bootcamp', style: TextStyle(color: Color(0xFFE85D75))),
                      TextSpan(text: ' Graduates.'),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                RichText(
                  text: const TextSpan(
                    style: TextStyle(color: AppColors.greyLight, fontSize: 16, height: 1.6),
                    children: [
                      TextSpan(text: 'Upon completing your graduation requirements, you will be directed to a checkout process where you can apply your final payment in exchange for your hard-earned UX/UI Certificate. Most users do end up completing the program in less than 4 months and end up spending just a little around '),
                      TextSpan(text: '\$100 - \$200', style: TextStyle(color: Color(0xFFE85D75), fontWeight: FontWeight.bold)),
                      TextSpan(text: ' for this awesome program.'),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                // Assignment 1
                const Text(
                  'Assignment 1 ⭐',
                  style: TextStyle(color: AppColors.white, fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Are you ready for your first assignment? Your assignment is simple: Say Hello to your new community! If you haven\'t yet, join our workspace and head to the #01_introductions channel. We\'d like to hear about the following please:',
                  style: TextStyle(color: AppColors.greyLight, fontSize: 16, height: 1.6),
                ),
                const SizedBox(height: 16),
                _bulletPoint('Who are you? (Where you are from?)'),
                _bulletPoint('Why did you enroll for the program? (Learning goals for this course)'),
                _bulletPoint('What\'s a fun fact about you? (Optional)'),
                const SizedBox(height: 16),
                const Text(
                  'This will be the standard format for communicating in this course moving forward. And remember, the more you put into this community, the more you get out. Say hi to someone new as you submit this simple assignment.',
                  style: TextStyle(color: AppColors.greyLight, fontSize: 16, height: 1.6),
                ),
                
                const SizedBox(height: 32),
                const Text(
                  'Submit lesson',
                  style: TextStyle(color: AppColors.white, fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                const Text(
                  'If you have fully read and understood the assignment, please mark the assignment as done 🤩 on this screen to confirm you\'ve read these instructions and have officially completed your first lesson.',
                  style: TextStyle(color: AppColors.greyLight, fontSize: 16, height: 1.6),
                ),

                const SizedBox(height: 32),
                
                const Text(
                  'Ready to Join our design community of 7000+ members? 🤩',
                  style: TextStyle(color: AppColors.white, fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                const Text('If you haven\'t enrolled yet, here is a breakdown of what you\'ll unlock:', style: TextStyle(color: AppColors.greyLight, fontSize: 16)),
                const SizedBox(height: 16),
                _bulletPoint('Slack community access 💬'),
                _bulletPoint('Valuable mentorship and feedback 💡'),
                _bulletPoint('Group and real-life projects 🤝'),
                _bulletPoint('Peer reviews 🧑‍🏫'),
                _bulletPoint('Keep your access over your FULL student period 🤩'),
                _bulletPoint('Our course updates you on the new trends etc. ✨'),
                _bulletPoint('and much more ...'),
                const SizedBox(height: 16),
                RichText(
                  text: const TextSpan(
                    style: TextStyle(color: AppColors.greyLight, fontSize: 16),
                    children: [
                      TextSpan(text: 'Join us, you wouldn\'t regret your decision 🤝'),
                    ],
                  ),
                ),

                const SizedBox(height: 48),

                const Row(
                  children: [
                    Expanded(child: _NavButton(label: '« 1.3 Slack 🎯', align: TextAlign.left)),
                    SizedBox(width: 16),
                    Expanded(child: _NavButton(label: 'Next: 1.5 Your First UI »', align: TextAlign.right)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _bulletItem(String title, String desc) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(color: AppColors.white, fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          Text(
            desc,
            style: const TextStyle(color: AppColors.greyLight, fontSize: 16, height: 1.6),
          ),
        ],
      ),
    );
  }

  Widget _bulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 8, right: 12),
            child: CircleAvatar(backgroundColor: AppColors.greyLight, radius: 3),
          ),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(color: AppColors.greyLight, fontSize: 16, height: 1.6),
            ),
          ),
        ],
      ),
    );
  }

  Widget _tag(String label) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF165C47),
        borderRadius: BorderRadius.circular(4),
      ),
      alignment: Alignment.center,
      child: Text(
        label,
        style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class _ProgramOverviewBreadcrumbBar extends StatelessWidget {
  final bool sidebarCollapsed;
  final VoidCallback onExpandSidebar;

  const _ProgramOverviewBreadcrumbBar({
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
          if (sidebarCollapsed)
            IconButton(
              icon: const Icon(Icons.keyboard_double_arrow_right, color: AppColors.grey, size: 20),
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
            '01 - Orientation',
            style: TextStyle(color: AppColors.greyLight, fontSize: 14),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 6),
            child: Text('›', style: TextStyle(color: AppColors.greyDark)),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFF2A1F2D),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              '1.4 Program Overview ⭐',
              style: TextStyle(
                color: Color(0xFFE85D75),
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── UX Fundamentals Overview Content ─────────────────────────────────────────

const List<Map<String, String>> kUXFundamentalsCards = [
  {
    'title': '2.1 The Way Of The Designer ⭐',
    'subtitle': 'Understand the mindset, approach, and daily life of a UX/UI designer...',
  },
  {
    'title': '2.2 Your Career',
    'subtitle': 'Explore career paths, job roles, and industry expectations for designers...',
  },
  {
    'title': '2.3 Design Thinking ⭐',
    'subtitle': 'Learn the core design thinking framework used by top companies worldwide...',
  },
  {
    'title': '2.4 Understanding Users',
    'subtitle': 'Deep dive into user research, personas, and empathy mapping techniques...',
  },
  {
    'title': '2.5 The Visuals',
    'subtitle': 'Explore visual hierarchy, color theory, typography and layout principles...',
  },
  {
    'title': '2.6 Designing For Everyone',
    'subtitle': 'Learn accessibility best practices and inclusive design principles...',
  },
  {
    'title': '2.7 Design Process 🎉📞',
    'subtitle': 'Master the end-to-end design process from research to final handoff...',
  },
  {
    'title': '2.8 Design Foundations',
    'subtitle': 'Build a solid foundation in design principles, grids, and systems...',
  },
];

class _UXFundamentalsOverviewContent extends StatelessWidget {
  final bool sidebarCollapsed;
  final VoidCallback onExpandSidebar;

  const _UXFundamentalsOverviewContent({
    required this.sidebarCollapsed,
    required this.onExpandSidebar,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _UXFundamentalsBreadcrumbBar(
          sidebarCollapsed: sidebarCollapsed,
          onExpandSidebar: onExpandSidebar,
          lessonTitle: null,
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(36, 28, 36, 36),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '02 – UX Fundamentals',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 38,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -1.0,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Discover the foundational principles of UX design. From understanding '
                  'users to mastering design thinking — this module sets you up with the '
                  'essential skills every designer needs.',
                  style: TextStyle(
                    color: AppColors.greyLight,
                    fontSize: 16,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 32),
                _CardGrid(cards: kUXFundamentalsCards),
                const SizedBox(height: 36),
                const Row(
                  children: [
                    Expanded(child: _NavButton(label: '« 01 - Orientation', align: TextAlign.left)),
                    SizedBox(width: 16),
                    Expanded(child: _NavButton(label: '2.1 The Way Of The Designer ⭐ »', align: TextAlign.right)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// ─── Way Of The Designer Content ──────────────────────────────────────────────

class _WayOfDesignerContent extends StatelessWidget {
  final bool sidebarCollapsed;
  final VoidCallback onExpandSidebar;

  const _WayOfDesignerContent({
    required this.sidebarCollapsed,
    required this.onExpandSidebar,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _UXFundamentalsBreadcrumbBar(
          sidebarCollapsed: sidebarCollapsed,
          onExpandSidebar: onExpandSidebar,
          lessonTitle: '2.1 The Way Of The Designer ⭐',
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(36, 28, 36, 36),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: AppColors.cardBackground,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: AppColors.cardBorder),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'On this page',
                        style: TextStyle(color: AppColors.greyLight, fontSize: 15),
                      ),
                      Icon(Icons.keyboard_arrow_down, color: AppColors.greyLight),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  '2.1 The Way Of The Designer ⭐',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 38,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -1.0,
                  ),
                ),
                const SizedBox(height: 24),

                // Success criteria
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE85D75).withOpacity(0.08),
                    border: Border.all(color: const Color(0xFFE85D75)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.flag_outlined, color: Color(0xFFE85D75), size: 20),
                          SizedBox(width: 8),
                          Text(
                            'Success criteria',
                            style: TextStyle(
                              color: Color(0xFFE85D75),
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'By the end of this checkpoint, you should understand the core mindset and approach of a UX/UI designer and how design thinking applies to everyday problem-solving.',
                        style: TextStyle(color: AppColors.white, fontSize: 15, height: 1.5),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.white,
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                        ),
                        child: const Text('Mark as done', style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Time
                const Row(
                  children: [
                    Icon(Icons.access_time, color: AppColors.greyLight, size: 18),
                    SizedBox(width: 8),
                    Text(
                      'Time: 45 mins',
                      style: TextStyle(color: AppColors.greyLight, fontSize: 15),
                    ),
                    SizedBox(width: 16),
                    Icon(Icons.info_outline, color: AppColors.greyLight, size: 18),
                  ],
                ),
                const SizedBox(height: 32),

                // Section 1
                const Text(
                  'What is UX Design?',
                  style: TextStyle(color: AppColors.white, fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                const Text(
                  'User Experience (UX) Design is the process of creating products that provide meaningful, relevant, and enjoyable experiences to users. This involves the design of the entire process of acquiring and integrating the product, including aspects of branding, design, usability, and function.',
                  style: TextStyle(color: AppColors.greyLight, fontSize: 16, height: 1.6),
                ),
                const SizedBox(height: 20),
                const Text(
                  'UX design is not just about creating beautiful interfaces — it\'s about solving real problems for real people. Great designers think like detectives, researchers, and artists all rolled into one.',
                  style: TextStyle(color: AppColors.greyLight, fontSize: 16, height: 1.6),
                ),
                const SizedBox(height: 32),

                // Section 2
                const Text(
                  'The Designer Mindset',
                  style: TextStyle(color: AppColors.white, fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                const Text(
                  'To succeed as a designer, you need to develop a specific mindset. Here are the key principles:',
                  style: TextStyle(color: AppColors.greyLight, fontSize: 16, height: 1.6),
                ),
                const SizedBox(height: 16),
                _mindsetItem('Empathy First', 'Always put yourself in the user\'s shoes. Understand their frustrations, needs, and goals before jumping to solutions.'),
                _mindsetItem('Iterate Constantly', 'Design is never done on the first try. Be willing to test, learn, and improve your designs continuously.'),
                _mindsetItem('Stay Curious', 'The best designers are lifelong learners. Stay curious about new tools, trends, and methodologies.'),
                _mindsetItem('Embrace Constraints', 'Real-world design always has constraints — budget, time, technology. Learn to see them as creative challenges.'),
                _mindsetItem('Communicate Clearly', 'A designer who can\'t explain their decisions is only half effective. Practice articulating your design rationale.'),

                const SizedBox(height: 32),

                // Section 3
                const Text(
                  'A Day in the Life',
                  style: TextStyle(color: AppColors.white, fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                const Text(
                  'What does a typical day look like for a UX/UI designer? While every company is different, most designers spend their time across these activities:',
                  style: TextStyle(color: AppColors.greyLight, fontSize: 16, height: 1.6),
                ),
                const SizedBox(height: 16),
                _activityRow(Icons.search, 'Research', 'User interviews, surveys, competitive analysis'),
                _activityRow(Icons.edit_note, 'Wireframing', 'Low-fidelity sketches and layout exploration'),
                _activityRow(Icons.brush, 'Visual Design', 'High-fidelity mockups, color, typography'),
                _activityRow(Icons.devices, 'Prototyping', 'Interactive prototypes for testing'),
                _activityRow(Icons.people, 'Collaboration', 'Syncing with developers, PMs, stakeholders'),
                _activityRow(Icons.science, 'Testing', 'Usability tests and design validation'),

                const SizedBox(height: 48),

                const Row(
                  children: [
                    Expanded(child: _NavButton(label: '« 02 – UX Fundamentals', align: TextAlign.left)),
                    SizedBox(width: 16),
                    Expanded(child: _NavButton(label: '2.2 Your Career »', align: TextAlign.right)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _mindsetItem(String title, String desc) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 4, right: 14),
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: const Color(0xFFE85D75).withOpacity(0.12),
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Icon(Icons.auto_awesome, color: Color(0xFFE85D75), size: 16),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: AppColors.white, fontSize: 17, fontWeight: FontWeight.w600)),
                const SizedBox(height: 4),
                Text(desc, style: const TextStyle(color: AppColors.greyLight, fontSize: 15, height: 1.5)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _activityRow(IconData icon, String title, String desc) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.cardBorder),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFF2A1F2D),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: const Color(0xFFE85D75), size: 22),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(color: AppColors.white, fontSize: 16, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 4),
                  Text(desc, style: const TextStyle(color: AppColors.greyLight, fontSize: 14)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── UX Fundamentals Breadcrumb Bar ───────────────────────────────────────────

class _UXFundamentalsBreadcrumbBar extends StatelessWidget {
  final bool sidebarCollapsed;
  final VoidCallback onExpandSidebar;
  final String? lessonTitle;

  const _UXFundamentalsBreadcrumbBar({
    required this.sidebarCollapsed,
    required this.onExpandSidebar,
    required this.lessonTitle,
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
              icon: const Icon(Icons.keyboard_double_arrow_right, color: AppColors.grey, size: 20),
              onPressed: onExpandSidebar,
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
            ),
          const Icon(Icons.home_outlined, color: AppColors.grey, size: 17),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 6),
            child: Text('›', style: TextStyle(color: AppColors.greyDark)),
          ),
          if (lessonTitle != null) ...[
            const Text(
              '02 – UX Fundamentals',
              style: TextStyle(color: AppColors.greyLight, fontSize: 14),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 6),
              child: Text('›', style: TextStyle(color: AppColors.greyDark)),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFF2A1F2D),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                lessonTitle!,
                style: const TextStyle(
                  color: Color(0xFFE85D75),
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ] else
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFF2A1F2D),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                '02 – UX Fundamentals',
                style: TextStyle(
                  color: Color(0xFFE85D75),
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

// ─── Placeholder Content ────────────────────────────────────────────────────────

class _PlaceholderContent extends StatelessWidget {
  final String title;
  final bool sidebarCollapsed;
  final VoidCallback onExpandSidebar;

  const _PlaceholderContent({
    required this.title,
    required this.sidebarCollapsed,
    required this.onExpandSidebar,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Top breadcrumb bar ────────────────────────────────────────────
        Container(
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
              const Icon(Icons.home_outlined, color: AppColors.grey, size: 17),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 6),
                child: Text('›', style: TextStyle(color: AppColors.greyDark)),
              ),
              Text(
                title,
                style: const TextStyle(
                  color: AppColors.greyLight,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),

        // ── Scrollable body ───────────────────────────────────────────────
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

// End of navscreen.dart

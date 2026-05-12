import 'package:flutter/material.dart';
import '../models/course_data.dart';
import '../theme/app_theme.dart';
import '../widgets/nav_sidebar.dart';
import 'lesson_content/welcome_lesson.dart';
import 'lesson_content/code_of_conduct_lesson.dart';
import 'lesson_content/orientation_lesson.dart';
import 'lesson_content/program_overview_lesson.dart';
import 'lesson_content/ux_fundamentals_overview_lesson.dart';
import 'lesson_content/way_of_designer_lesson.dart';
import 'lesson_content/design_thinking_lesson.dart';
import 'lesson_content/placeholder_lesson.dart';

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

class CourseNavPage extends StatefulWidget {
  const CourseNavPage({super.key});

  @override
  State<CourseNavPage> createState() => _CourseNavPageState();
}

class _CourseNavPageState extends State<CourseNavPage> {
  int _expandedIndex = 0;
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
            child: NavSidebar(
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
            child: _MainContentRouter(
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

class _MainContentRouter extends StatelessWidget {
  final bool sidebarCollapsed;
  final String selectedLesson;
  final VoidCallback onExpandSidebar;

  const _MainContentRouter({
    required this.sidebarCollapsed,
    required this.selectedLesson,
    required this.onExpandSidebar,
  });

  @override
  Widget build(BuildContext context) {
    switch (selectedLesson) {
      case '1.1 Welcome':
        return WelcomeLesson(
          sidebarCollapsed: sidebarCollapsed,
          onExpandSidebar: onExpandSidebar,
        );
      case '1.2 Code of Conduct':
        return CodeOfConductLesson(
          sidebarCollapsed: sidebarCollapsed,
          onExpandSidebar: onExpandSidebar,
        );
      case '01 - Orientation':
        return OrientationLesson(
          sidebarCollapsed: sidebarCollapsed,
          onExpandSidebar: onExpandSidebar,
        );
      case '1.4 Program Overview ⭐':
        return ProgramOverviewLesson(
          sidebarCollapsed: sidebarCollapsed,
          onExpandSidebar: onExpandSidebar,
        );
      case '02 – UX Fundamentals':
        return UXFundamentalsOverviewLesson(
          sidebarCollapsed: sidebarCollapsed,
          onExpandSidebar: onExpandSidebar,
        );
      case '2.1 The Way Of The Designer ⭐':
        return WayOfDesignerLesson(
          sidebarCollapsed: sidebarCollapsed,
          onExpandSidebar: onExpandSidebar,
        );
      case '2.3 Design Thinking ⭐':
        return DesignThinkingLesson(
          sidebarCollapsed: sidebarCollapsed,
          onExpandSidebar: onExpandSidebar,
        );
      default:
        return PlaceholderLesson(
          title: selectedLesson,
          sidebarCollapsed: sidebarCollapsed,
          onExpandSidebar: onExpandSidebar,
        );
    }
  }
}

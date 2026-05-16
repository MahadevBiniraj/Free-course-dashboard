import 'package:flutter/material.dart';
import '../models/course_data.dart';
import '../theme/app_theme.dart';
import '../widgets/nav_sidebar.dart';
import '../widgets/modern_sidebar.dart';

// Lesson Imports
import 'package:uxui_open/screens/lesson_content/welcome_lesson.dart';
import 'package:uxui_open/screens/lesson_content/code_of_conduct_lesson.dart';
import 'package:uxui_open/screens/lesson_content/orientation_lesson.dart';
import 'package:uxui_open/screens/lesson_content/program_overview_lesson.dart';
import 'package:uxui_open/screens/lesson_content/ux_fundamentals_overview_lesson.dart';
import 'package:uxui_open/screens/lesson_content/way_of_designer_lesson.dart';
import 'package:uxui_open/screens/lesson_content/your_career_lesson.dart';
import 'package:uxui_open/screens/lesson_content/design_thinking_lesson.dart';
import 'package:uxui_open/screens/lesson_content/understanding_users_lesson.dart';
import 'package:uxui_open/screens/lesson_content/visuals_lesson.dart';
import 'package:uxui_open/screens/lesson_content/designing_for_everyone_lesson.dart';
import 'package:uxui_open/screens/lesson_content/design_process_lesson.dart';
import 'package:uxui_open/screens/lesson_content/design_foundations_lesson.dart';
import 'package:uxui_open/screens/lesson_content/placeholder_lesson.dart';
import 'package:uxui_open/screens/lesson_content/research_methods_lesson.dart';
import 'package:uxui_open/screens/lesson_content/user_centered_research_lesson.dart';
import 'package:uxui_open/screens/lesson_content/using_research_lesson.dart';
import 'package:uxui_open/screens/lesson_content/insight_translation_lesson.dart';
import 'package:uxui_open/screens/lesson_content/ongoing_evaluation_lesson.dart';
import 'package:uxui_open/screens/lesson_content/assignment_03_lesson.dart';



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
  final String? initialLesson;
  const CourseNavPage({super.key, this.initialLesson});

  @override
  State<CourseNavPage> createState() => _CourseNavPageState();
}

class _CourseNavPageState extends State<CourseNavPage> {
  int _expandedIndex = 0;
  late String _selectedLesson;
  bool _sidebarCollapsed = false;

  @override
  void initState() {
    super.initState();
    _selectedLesson = widget.initialLesson ?? '3.3 Research Methods';

    // Auto-expand the section containing the initial lesson
    for (int i = 0; i < kSections.length; i++) {
      if (kSections[i].lessons.contains(_selectedLesson)) {
        _expandedIndex = i;
        break;
      }
    }
  }

  static const double kSidebarWidth = 320;
  static const double kCollapsedWidth = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Row(
        children: [
          // ── Sidebar ──────────────────────────────────────────────────────────
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            width: _sidebarCollapsed ? kCollapsedWidth : kSidebarWidth,
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
              color: AppColors.cardBackground,
            ),
            child: ModernSidebar(
              sections: kSections,
              initialExpandedIndex: _expandedIndex,
              selectedLesson: _selectedLesson,
              onLessonTap: (l) => setState(() => _selectedLesson = l),
              onCollapse: () => setState(() => _sidebarCollapsed = true),
            ),
          ),

          // ── Main content ──────────────────────────────────────────────────────
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              switchInCurve: Curves.easeOutCubic,
              switchOutCurve: Curves.easeInCubic,
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(
                  opacity: animation,
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0.01, 0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  ),
                );
              },
              child: _MainContentRouter(
                key: ValueKey(_selectedLesson),
                sidebarCollapsed: _sidebarCollapsed,
                selectedLesson: _selectedLesson,
                onExpandSidebar: () =>
                    setState(() => _sidebarCollapsed = false),
                onLessonTap: (l) => setState(() => _selectedLesson = l),
              ),
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
  final ValueChanged<String> onLessonTap;

  const _MainContentRouter({
    super.key,
    required this.sidebarCollapsed,
    required this.selectedLesson,
    required this.onExpandSidebar,
    required this.onLessonTap,
  });

  @override
  Widget build(BuildContext context) {
    // Normalize lesson title for matching
    final String lesson = selectedLesson;

    switch (lesson) {
      case '1.1 Welcome':
        return WelcomeLesson(
          sidebarCollapsed: sidebarCollapsed,
          onExpandSidebar: onExpandSidebar,
          onLessonTap: onLessonTap,
        );
      case '1.2 Code of Conduct':
        return CodeOfConductLesson(
          sidebarCollapsed: sidebarCollapsed,
          onExpandSidebar: onExpandSidebar,
          onLessonTap: onLessonTap,
        );
      case '01 - Orientation':
        return OrientationLesson(
          sidebarCollapsed: sidebarCollapsed,
          onExpandSidebar: onExpandSidebar,
          onLessonTap: onLessonTap,
        );
      case '1.4 Program Overview ⭐':
        return ProgramOverviewLesson(
          sidebarCollapsed: sidebarCollapsed,
          onExpandSidebar: onExpandSidebar,
          onLessonTap: onLessonTap,
        );
      case '02 – UX Fundamentals':
        return UXFundamentalsOverviewLesson(
          sidebarCollapsed: sidebarCollapsed,
          onExpandSidebar: onExpandSidebar,
          onLessonTap: onLessonTap,
        );
      case '2.1 The Way Of The Designer ⭐':
        return WayOfDesignerLesson(
          sidebarCollapsed: sidebarCollapsed,
          onExpandSidebar: onExpandSidebar,
          onLessonTap: onLessonTap,
        );
      case '2.2 Your Career':
        return YourCareerLesson(
          sidebarCollapsed: sidebarCollapsed,
          onExpandSidebar: onExpandSidebar,
          onLessonTap: onLessonTap,
        );
      case '2.3 Design Thinking ⭐':
        return DesignThinkingLesson(
          sidebarCollapsed: sidebarCollapsed,
          onExpandSidebar: onExpandSidebar,
          onLessonTap: onLessonTap,
        );
      case '2.4 Understanding Users':
        return UnderstandingUsersScreen(
          sidebarCollapsed: sidebarCollapsed,
          onExpandSidebar: onExpandSidebar,
          onLessonTap: onLessonTap,
        );
      case '2.5 The Visuals':
        return VisualsLesson(
          sidebarCollapsed: sidebarCollapsed,
          onExpandSidebar: onExpandSidebar,
          onLessonTap: onLessonTap,
        );
      case '2.6 Designing For Everyone':
        return DesigningForEveryoneLesson(
          sidebarCollapsed: sidebarCollapsed,
          onExpandSidebar: onExpandSidebar,
          onLessonTap: onLessonTap,
        );
      case '2.7 Design Process 🎉📞':
        return DesignProcessLesson(
          sidebarCollapsed: sidebarCollapsed,
          onExpandSidebar: onExpandSidebar,
          onLessonTap: onLessonTap,
        );
      case '2.8 Design Foundations':
        return DesignFoundationsLesson(
          sidebarCollapsed: sidebarCollapsed,
          onExpandSidebar: onExpandSidebar,
          onLessonTap: onLessonTap,
        );
      case '3.3 Research Methods':
        return ResearchMethodsLesson(
          sidebarCollapsed: sidebarCollapsed,
          onExpandSidebar: onExpandSidebar,
          onLessonTap: onLessonTap,
        );
      case '3.1 User Centered Research':
        return UserCenteredResearchLesson(
          sidebarCollapsed: sidebarCollapsed,
          onExpandSidebar: onExpandSidebar,
          onLessonTap: onLessonTap,
        );
      case '3.2 Using Research':
        return UsingResearchLesson(
          sidebarCollapsed: sidebarCollapsed,
          onExpandSidebar: onExpandSidebar,
          onLessonTap: onLessonTap,
        );
      case '3.4 Insight Translation':
        return InsightTranslationLesson(
          sidebarCollapsed: sidebarCollapsed,
          onExpandSidebar: onExpandSidebar,
          onLessonTap: onLessonTap,
        );
      case '3.5 Ongoing Evaluation':
        return OngoingEvaluationLesson(
          sidebarCollapsed: sidebarCollapsed,
          onExpandSidebar: onExpandSidebar,
          onLessonTap: onLessonTap,
        );
      case '3.6 Assignment ⭐':
        return Assignment03Lesson(
          sidebarCollapsed: sidebarCollapsed,
          onExpandSidebar: onExpandSidebar,
          onLessonTap: onLessonTap,
        );


      default:
        return PlaceholderLesson(
          title: selectedLesson,
          sidebarCollapsed: sidebarCollapsed,
          onExpandSidebar: onExpandSidebar,
          onLessonTap: onLessonTap,
        );
    }
  }
}

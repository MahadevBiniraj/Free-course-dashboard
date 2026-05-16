import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/app_theme.dart';
import '../../widgets/breadcrumb_bar.dart';

class Assignment03Lesson extends StatelessWidget {
  final bool sidebarCollapsed;
  final VoidCallback onExpandSidebar;
  final ValueChanged<String> onLessonTap;

  const Assignment03Lesson({
    super.key,
    required this.sidebarCollapsed,
    required this.onExpandSidebar,
    required this.onLessonTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BreadcrumbBar(
          sidebarCollapsed: sidebarCollapsed,
          onExpandSidebar: onExpandSidebar,
          items: const [
            BreadcrumbItem(label: '03 – User Centered Design'),
            BreadcrumbItem(label: '3.6 Assignment ⭐', isLast: true),
          ],
        ),
        Expanded(
          child: Container(
            color: AppColors.background,
            child: LayoutBuilder(
              builder: (context, constraints) {
                final isWide = constraints.maxWidth > 1000;
                return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      _HeroSection(isWide: isWide),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: isWide ? 60 : 20,
                          vertical: 40,
                        ),
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 1200),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _BriefSection(),
                              const SizedBox(height: 80),
                              _RequirementsSection(),
                              const SizedBox(height: 80),
                              _SubmissionPortal(),
                              const SizedBox(height: 100),
                              _LessonFooter(onLessonTap: onLessonTap),
                              const SizedBox(height: 100),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class _HeroSection extends StatelessWidget {
  final bool isWide;
  const _HeroSection({required this.isWide});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.cardBackground,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.star_rounded, color: AppColors.yellow, size: 80),
            const SizedBox(height: 24),
            Text(
              'Module 03 Assignment',
              style: GoogleFonts.outfit(
                color: Colors.white,
                fontSize: isWide ? 56 : 36,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'User Centered Research & Synthesis',
              style: GoogleFonts.inter(
                color: AppColors.accent,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BriefSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'The Brief',
          style: GoogleFonts.outfit(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Select a mobile app that you use frequently. Identify one major frustration or friction point that you have experienced. Your task is to perform a mini-research sprint to validate this problem and synthesize your findings.',
          style: GoogleFonts.inter(
            color: AppColors.greyLight,
            fontSize: 18,
            height: 1.8,
          ),
        ),
      ],
    );
  }
}

class _RequirementsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Requirements',
          style: GoogleFonts.outfit(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 32),
        _RequirementItem(text: 'Conduct 3 user interviews (friends or family are fine).'),
        _RequirementItem(text: 'Create 1 Empathy Map based on your interviews.'),
        _RequirementItem(text: 'Create 1 User Persona representing your core user.'),
        _RequirementItem(text: 'Write 3 "How Might We" statements to solve the problem.'),
      ],
    );
  }
}

class _RequirementItem extends StatelessWidget {
  final String text;
  const _RequirementItem({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          const Icon(Icons.check_circle_outline_rounded, color: AppColors.accent, size: 24),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.inter(color: Colors.white70, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}

class _SubmissionPortal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(48),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Column(
        children: [
          const Icon(Icons.cloud_upload_outlined, color: AppColors.grey, size: 48),
          const SizedBox(height: 24),
          Text(
            'Upload your PDF or Link',
            style: GoogleFonts.outfit(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'Submit your work as a single Figma link or a PDF document.',
            style: TextStyle(color: AppColors.grey, fontSize: 14),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 24),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            ),
            child: const Text('SUBMIT ASSIGNMENT', style: TextStyle(fontWeight: FontWeight.w900)),
          ),
        ],
      ),
    );
  }
}

class _LessonFooter extends StatelessWidget {
  final ValueChanged<String> onLessonTap;
  const _LessonFooter({required this.onLessonTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TextButton(
          onPressed: () => onLessonTap('3.5 Ongoing Evaluation'),
          child: const Text('« Back to 3.5', style: TextStyle(color: AppColors.grey)),
        ),
      ],
    );
  }
}

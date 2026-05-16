import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/app_theme.dart';
import '../../widgets/breadcrumb_bar.dart';

class UsingResearchLesson extends StatelessWidget {
  final bool sidebarCollapsed;
  final VoidCallback onExpandSidebar;
  final ValueChanged<String> onLessonTap;

  const UsingResearchLesson({
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
            BreadcrumbItem(label: '3.2 Using Research', isLast: true),
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
                              _SynthesisSection(),
                              const SizedBox(height: 80),
                              _EmpathyMapSection(),
                              const SizedBox(height: 80),
                              _PersonaSection(),
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
        image: DecorationImage(
          image: NetworkImage('https://images.unsplash.com/photo-1531403009284-440f080d1e12?auto=format&fit=crop&q=80&w=2000'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.background.withOpacity(0.1),
              AppColors.background,
            ],
          ),
        ),
        padding: const EdgeInsets.all(60),
        alignment: Alignment.bottomLeft,
        child: Text(
          '3.2 Using Research',
          style: GoogleFonts.outfit(
            color: Colors.white,
            fontSize: isWide ? 64 : 40,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}

class _SynthesisSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Data Synthesis',
          style: GoogleFonts.outfit(
            color: AppColors.accent,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Research without synthesis is just a pile of notes. Synthesis is the process of looking for patterns, themes, and insights across your research data to form a cohesive understanding of your users.',
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

class _EmpathyMapSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'The Empathy Map',
            style: GoogleFonts.outfit(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: _EmpathyQuadrant(title: 'SAYS', content: 'What are the explicit quotes and statements?'),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _EmpathyQuadrant(title: 'THINKS', content: 'What is happening in their head but not said?'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _EmpathyQuadrant(title: 'DOES', content: 'What actions and behaviors did you observe?'),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _EmpathyQuadrant(title: 'FEELS', content: 'What emotions are they experiencing?'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _EmpathyQuadrant extends StatelessWidget {
  final String title;
  final String content;
  const _EmpathyQuadrant({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.jetBrainsMono(
              color: AppColors.accent,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: GoogleFonts.inter(
              color: AppColors.grey,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

class _PersonaSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'User Personas',
          style: GoogleFonts.outfit(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Personas are fictional characters created to represent the different user types that might use your service, product, site, or brand in a similar way. They help the team focus on human-centered design rather than abstract data points.',
          style: GoogleFonts.inter(
            color: AppColors.greyLight,
            fontSize: 16,
            height: 1.6,
          ),
        ),
      ],
    );
  }
}

class _LessonFooter extends StatelessWidget {
  final ValueChanged<String> onLessonTap;
  const _LessonFooter({required this.onLessonTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () => onLessonTap('3.1 User Centered Research'),
          child: const Text('« Back to 3.1', style: TextStyle(color: AppColors.grey)),
        ),
        ElevatedButton(
          onPressed: () => onLessonTap('3.3 Research Methods'),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.accent,
            foregroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          child: const Text('Next: 3.3 Research Methods', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }
}

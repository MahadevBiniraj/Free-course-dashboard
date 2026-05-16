import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/app_theme.dart';
import '../../widgets/breadcrumb_bar.dart';

class InsightTranslationLesson extends StatelessWidget {
  final bool sidebarCollapsed;
  final VoidCallback onExpandSidebar;
  final ValueChanged<String> onLessonTap;

  const InsightTranslationLesson({
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
            BreadcrumbItem(label: '3.4 Insight Translation', isLast: true),
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
                              _HMWSection(),
                              const SizedBox(height: 80),
                              _AffinityMappingSection(),
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
          image: NetworkImage('https://images.unsplash.com/photo-1542744173-8e7e53415bb0?auto=format&fit=crop&q=80&w=2000'),
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
          '3.4 Insight Translation',
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

class _HMWSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'How Might We...',
          style: GoogleFonts.outfit(
            color: AppColors.accent,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          '"How Might We" (HMW) questions are short statements that start with "How might we..." and are used to launch brainstorms. They help translate user problems into design opportunities.',
          style: GoogleFonts.inter(
            color: AppColors.greyLight,
            fontSize: 18,
            height: 1.8,
          ),
        ),
        const SizedBox(height: 32),
        Container(
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: AppColors.cardBackground,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: AppColors.accent.withOpacity(0.3)),
          ),
          child: Column(
            children: [
              _HMWExample(problem: 'Users are overwhelmed by the number of products.', hmw: 'How might we simplify the discovery process?'),
              const Divider(color: AppColors.cardBorder, height: 40),
              _HMWExample(problem: 'Checkout takes too long.', hmw: 'How might we make the payment flow feel instant?'),
            ],
          ),
        ),
      ],
    );
  }
}

class _HMWExample extends StatelessWidget {
  final String problem;
  final String hmw;
  const _HMWExample({required this.problem, required this.hmw});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.error_outline_rounded, color: Colors.redAccent, size: 24),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(problem, style: const TextStyle(color: AppColors.grey, fontSize: 14)),
              const SizedBox(height: 4),
              Text(hmw, style: GoogleFonts.outfit(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ],
    );
  }
}

class _AffinityMappingSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Affinity Mapping',
          style: GoogleFonts.outfit(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Affinity mapping is a technique used to organize ideas and data into clusters based on their natural relationships. It is the bridge between research notes and high-level themes.',
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
          onPressed: () => onLessonTap('3.3 Research Methods'),
          child: const Text('« Back to 3.3', style: TextStyle(color: AppColors.grey)),
        ),
        ElevatedButton(
          onPressed: () => onLessonTap('3.5 Ongoing Evaluation'),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.accent,
            foregroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          child: const Text('Next: 3.5 Ongoing Evaluation', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }
}

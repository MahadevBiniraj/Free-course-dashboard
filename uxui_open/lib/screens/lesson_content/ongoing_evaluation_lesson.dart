import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/app_theme.dart';
import '../../widgets/breadcrumb_bar.dart';

class OngoingEvaluationLesson extends StatelessWidget {
  final bool sidebarCollapsed;
  final VoidCallback onExpandSidebar;
  final ValueChanged<String> onLessonTap;

  const OngoingEvaluationLesson({
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
            BreadcrumbItem(label: '3.5 Ongoing Evaluation', isLast: true),
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
                              _MetricsSection(),
                              const SizedBox(height: 80),
                              _LoopSection(),
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
          image: NetworkImage('https://images.unsplash.com/photo-1551288049-bebda4e38f71?auto=format&fit=crop&q=80&w=2000'),
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
          '3.5 Ongoing Evaluation',
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

class _MetricsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Measuring Success',
          style: GoogleFonts.outfit(
            color: AppColors.accent,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 32),
        Row(
          children: [
            Expanded(child: _MetricCard(title: 'NPS', value: '+54', label: 'Net Promoter Score')),
            const SizedBox(width: 24),
            Expanded(child: _MetricCard(title: 'SUS', value: '82', label: 'System Usability Scale')),
            const SizedBox(width: 24),
            Expanded(child: _MetricCard(title: 'CRR', value: '92%', label: 'Customer Retention Rate')),
          ],
        ),
      ],
    );
  }
}

class _MetricCard extends StatelessWidget {
  final String title;
  final String value;
  final String label;
  const _MetricCard({required this.title, required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: GoogleFonts.jetBrainsMono(color: AppColors.accent, fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(value, style: GoogleFonts.outfit(color: Colors.white, fontSize: 36, fontWeight: FontWeight.w900)),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(color: AppColors.grey, fontSize: 12)),
        ],
      ),
    );
  }
}

class _LoopSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'The Feedback Loop',
          style: GoogleFonts.outfit(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Evaluation isn\'t the end; it\'s the start of the next cycle. Continuous research means constantly monitoring how live products are performing and using that data to drive the next set of HMW questions.',
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

class _LessonFooter extends StatelessWidget {
  final ValueChanged<String> onLessonTap;
  const _LessonFooter({required this.onLessonTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () => onLessonTap('3.4 Insight Translation'),
          child: const Text('« Back to 3.4', style: TextStyle(color: AppColors.grey)),
        ),
        ElevatedButton(
          onPressed: () => onLessonTap('3.6 Assignment ⭐'),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.accent,
            foregroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          child: const Text('Next: 3.6 Assignment', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }
}

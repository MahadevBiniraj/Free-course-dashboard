import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';
import '../../theme/app_theme.dart';
import '../../widgets/breadcrumb_bar.dart';
import '../../widgets/lesson_widgets.dart';

class ResearchMethodsLesson extends StatelessWidget {
  final bool sidebarCollapsed;
  final VoidCallback onExpandSidebar;
  final ValueChanged<String> onLessonTap;

  const ResearchMethodsLesson({
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
            BreadcrumbItem(label: '3.3 Research Methods', isLast: true),
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
                      _HeroBanner(isWide: isWide),
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
                              _LessonMetadataRow(isWide: isWide),
                              const SizedBox(height: 60),
                              const _ContentNavigation(),
                              const SizedBox(height: 60),
                              const _IntroductionSection(),
                              const SizedBox(height: 80),
                              const _MethodsGrid(),
                              const SizedBox(height: 80),
                              const _IndustryWorkflowSection(),
                              const SizedBox(height: 80),
                              const _CaseStudiesSection(),
                              const SizedBox(height: 80),
                              const _AssignmentSection(),
                              const SizedBox(height: 100),
                              _NextLessonFooter(onLessonTap: onLessonTap),
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

class _HeroBanner extends StatelessWidget {
  final bool isWide;
  const _HeroBanner({required this.isWide});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 500,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                'https://images.unsplash.com/photo-1552664730-d307ca884978?auto=format&fit=crop&q=80&w=2000',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: 500,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.background.withOpacity(0.2),
                AppColors.background.withOpacity(0.8),
                AppColors.background,
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 60,
          left: isWide ? 60 : 20,
          right: isWide ? 60 : 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.accent.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.accent.withOpacity(0.5)),
                ),
                child: Text(
                  'PHASE 03 • USER CENTERED DESIGN',
                  style: GoogleFonts.inter(
                    color: AppColors.accent,
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 2.0,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                '3.3 Research Methods',
                style: GoogleFonts.outfit(
                  color: Colors.white,
                  fontSize: isWide ? 72 : 42,
                  fontWeight: FontWeight.w800,
                  height: 1.0,
                  letterSpacing: -2.0,
                ),
              ),
              const SizedBox(height: 16),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 700),
                child: Text(
                  'Master the toolkit of professional UX researchers. From qualitative interviews to quantitative A/B testing, learn how to extract actionable insights from user behavior.',
                  style: GoogleFonts.inter(
                    color: Colors.white70,
                    fontSize: 20,
                    height: 1.5,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _LessonMetadataRow extends StatelessWidget {
  final bool isWide;
  const _LessonMetadataRow({required this.isWide});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 40,
      runSpacing: 24,
      children: [
        _MetadataItem(
          icon: Icons.timer_outlined,
          label: 'ESTIMATED TIME',
          value: '45 Minutes',
        ),
        _MetadataItem(
          icon: Icons.bar_chart_rounded,
          label: 'DIFFICULTY',
          value: 'Intermediate',
        ),
        _MetadataItem(
          icon: Icons.people_outline_rounded,
          label: 'ENROLLED',
          value: '12,482 Students',
        ),
        _MetadataItem(
          icon: Icons.person_outline_rounded,
          label: 'INSTRUCTOR',
          value: 'Sarah Jenkins',
        ),
      ],
    );
  }
}

class _MetadataItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _MetadataItem({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.cardBorder,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: AppColors.accent, size: 20),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: GoogleFonts.inter(
                color: AppColors.grey,
                fontSize: 10,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.0,
              ),
            ),
            Text(
              value,
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _ContentNavigation extends StatelessWidget {
  const _ContentNavigation();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'TABLE OF CONTENTS',
            style: GoogleFonts.inter(
              color: AppColors.accent,
              fontSize: 11,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 32,
            runSpacing: 16,
            children: [
              _TocItem(number: '01', label: 'Introduction'),
              _TocItem(number: '02', label: 'Qual vs Quant'),
              _TocItem(number: '03', label: 'Common Methods'),
              _TocItem(number: '04', label: 'Industry Workflow'),
              _TocItem(number: '05', label: 'Assignment'),
            ],
          ),
        ],
      ),
    );
  }
}

class _TocItem extends StatelessWidget {
  final String number;
  final String label;
  const _TocItem({required this.number, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          number,
          style: GoogleFonts.jetBrainsMono(
            color: AppColors.grey,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(width: 12),
        Text(
          label,
          style: GoogleFonts.inter(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class _IntroductionSection extends StatelessWidget {
  const _IntroductionSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionHeader(
          number: '01',
          title: 'The Foundation of Insight',
          subtitle: 'Why we research before we design.',
        ),
        const SizedBox(height: 32),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Text(
                    'UX Research is the systematic investigation of users and their requirements, in order to add context and insight to the design process. Research allows us to design with data rather than assumptions, ensuring that the products we build actually solve real problems for real people.',
                    style: GoogleFonts.inter(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 18,
                      height: 1.8,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'In this lesson, we will explore the spectrum of research methods used by elite design teams at companies like Google, Airbnb, and Netflix. You will learn when to use qualitative versus quantitative data, and how to select the right method for your specific project goals.',
                    style: GoogleFonts.inter(
                      color: AppColors.greyLight,
                      fontSize: 16,
                      height: 1.7,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 48),
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.accent.withOpacity(0.15), Colors.transparent],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: AppColors.accent.withOpacity(0.3)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.lightbulb_outline_rounded, color: AppColors.accent, size: 32),
                    const SizedBox(height: 20),
                    Text(
                      'Core Objective',
                      style: GoogleFonts.outfit(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'By the end of this module, you will be able to construct a comprehensive research plan using multiple validation methods.',
                      style: GoogleFonts.inter(
                        color: Colors.white70,
                        fontSize: 15,
                        height: 1.6,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _MethodsGrid extends StatelessWidget {
  const _MethodsGrid();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionHeader(
          number: '02',
          title: 'The Toolkit',
          subtitle: 'The primary research methods every designer must master.',
        ),
        const SizedBox(height: 48),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 32,
          mainAxisSpacing: 32,
          childAspectRatio: 1.4,
          children: const [
            _MethodCard(
              title: 'User Interviews',
              icon: Icons.record_voice_over_rounded,
              type: 'QUALITATIVE',
              description: 'One-on-one sessions to dive deep into user motivations, frustrations, and behaviors.',
              imageUrl: 'https://images.unsplash.com/photo-1551836022-d5d88e9218df?auto=format&fit=crop&q=80&w=800',
            ),
            _MethodCard(
              title: 'Usability Testing',
              icon: Icons.touch_app_rounded,
              type: 'BEHAVIORAL',
              description: 'Observing users as they interact with a prototype to identify friction and navigation issues.',
              imageUrl: 'https://images.unsplash.com/photo-1586717791821-3f44a563eb4c?auto=format&fit=crop&q=80&w=800',
            ),
            _MethodCard(
              title: 'Card Sorting',
              icon: Icons.dashboard_customize_rounded,
              type: 'INFORMATION ARCHITECTURE',
              description: 'Learning how users categorize information to design intuitive navigation systems.',
              imageUrl: 'https://images.unsplash.com/photo-1517245386807-bb43f82c33c4?auto=format&fit=crop&q=80&w=800',
            ),
            _MethodCard(
              title: 'A/B Testing',
              icon: Icons.compare_arrows_rounded,
              type: 'QUANTITATIVE',
              description: 'Comparing two versions of a design to see which one performs better based on metrics.',
              imageUrl: 'https://images.unsplash.com/photo-1460925895917-afdab827c52f?auto=format&fit=crop&q=80&w=800',
            ),
          ],
        ),
      ],
    );
  }
}

class _MethodCard extends StatefulWidget {
  final String title;
  final IconData icon;
  final String type;
  final String description;
  final String imageUrl;

  const _MethodCard({
    required this.title,
    required this.icon,
    required this.type,
    required this.description,
    required this.imageUrl,
  });

  @override
  State<_MethodCard> createState() => _MethodCardState();
}

class _MethodCardState extends State<_MethodCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic,
        transform: Matrix4.identity()..translate(0.0, isHovered ? -10.0 : 0.0),
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(32),
          border: Border.all(
            color: isHovered ? AppColors.accent.withOpacity(0.5) : AppColors.cardBorder,
            width: 2,
          ),
          boxShadow: [
            if (isHovered)
              BoxShadow(
                color: AppColors.accent.withOpacity(0.1),
                blurRadius: 40,
                offset: const Offset(0, 20),
              ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.network(
                widget.imageUrl,
                fit: BoxFit.cover,
                color: Colors.black.withOpacity(isHovered ? 0.3 : 0.6),
                colorBlendMode: BlendMode.darken,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: Colors.white24),
                    ),
                    child: Text(
                      widget.type,
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Icon(widget.icon, color: AppColors.accent, size: 40),
                  const SizedBox(height: 16),
                  Text(
                    widget.title,
                    style: GoogleFonts.outfit(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 8),
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 300),
                    opacity: isHovered ? 1.0 : 0.0,
                    child: Text(
                      widget.description,
                      style: GoogleFonts.inter(
                        color: Colors.white70,
                        fontSize: 16,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _IndustryWorkflowSection extends StatelessWidget {
  const _IndustryWorkflowSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(60),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.accent.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(Icons.analytics_rounded, color: AppColors.accent, size: 32),
              ),
              const SizedBox(width: 24),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'INDUSTRY STANDARD',
                    style: GoogleFonts.inter(
                      color: AppColors.accent,
                      fontSize: 12,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 2.0,
                    ),
                  ),
                  Text(
                    'The Enterprise Research Workflow',
                    style: GoogleFonts.outfit(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 60),
          _WorkflowStep(
            number: '01',
            title: 'Define the Learning Objective',
            description: 'Top teams start with a question, not a solution. "Why are users dropping off at checkout?" instead of "Let\'s test the checkout button."',
          ),
          _WorkflowStep(
            number: '02',
            title: 'Triangulate Methods',
            description: 'Never rely on one source. Combine quantitative data (Analytics) with qualitative data (Interviews) to get the "what" and the "why".',
          ),
          _WorkflowStep(
            number: '03',
            title: 'Rapid Synthesis',
            description: 'In fast-moving environments like Netflix, research findings must be shared within 48 hours to remain actionable.',
          ),
          _WorkflowStep(
            number: '04',
            title: 'Metric Alignment',
            description: 'Ensure research findings are tied to business KPIs like retention, conversion, or NPS.',
            isLast: true,
          ),
        ],
      ),
    );
  }
}

class _WorkflowStep extends StatelessWidget {
  final String number;
  final String title;
  final String description;
  final bool isLast;

  const _WorkflowStep({
    required this.number,
    required this.title,
    required this.description,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.accent,
                ),
                child: Center(
                  child: Text(
                    number,
                    style: GoogleFonts.jetBrainsMono(
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    color: AppColors.cardBorder,
                  ),
                ),
            ],
          ),
          const SizedBox(width: 32),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.outfit(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    description,
                    style: GoogleFonts.inter(
                      color: AppColors.greyLight,
                      fontSize: 16,
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CaseStudiesSection extends StatelessWidget {
  const _CaseStudiesSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionHeader(
          number: '03',
          title: 'Real-World Examples',
          subtitle: 'How the world\'s best products were researched.',
        ),
        const SizedBox(height: 40),
        Row(
          children: [
            Expanded(
              child: _CaseStudyCard(
                company: 'Google',
                title: 'The 41 Shades of Blue',
                description: 'Google tested 41 different shades of blue for search links to find which one maximized click-through rate.',
                icon: Icons.search,
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: _CaseStudyCard(
                company: 'Airbnb',
                title: 'Professional Photography',
                description: 'In-person research in New York led to the discovery that professional photos increased bookings by 2x.',
                icon: Icons.home_rounded,
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: _CaseStudyCard(
                company: 'Netflix',
                title: 'The "Skip Intro" Button',
                description: 'Observational research showed users were manually fast-forwarding intros, leading to the Skip Intro feature.',
                icon: Icons.play_circle_fill_rounded,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _CaseStudyCard extends StatelessWidget {
  final String company;
  final String title;
  final String description;
  final IconData icon;

  const _CaseStudyCard({
    required this.company,
    required this.title,
    required this.description,
    required this.icon,
  });

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
          Row(
            children: [
              Icon(icon, color: Colors.white, size: 24),
              const SizedBox(width: 12),
              Text(
                company,
                style: GoogleFonts.outfit(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: GoogleFonts.outfit(
              color: AppColors.accent,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: GoogleFonts.inter(
              color: AppColors.greyLight,
              fontSize: 14,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

class _AssignmentSection extends StatelessWidget {
  const _AssignmentSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(60),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.accent, AppColors.accentDeep],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: AppColors.accent.withOpacity(0.3),
            blurRadius: 60,
            offset: const Offset(0, 30),
          ),
        ],
      ),
      child: Column(
        children: [
          const Icon(Icons.assignment_turned_in_rounded, color: Colors.black, size: 64),
          const SizedBox(height: 32),
          Text(
            'Ready to Put it into Practice?',
            style: GoogleFonts.outfit(
              color: Colors.black,
              fontSize: 40,
              fontWeight: FontWeight.w900,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            'Create a research plan for a new grocery delivery app targeting elderly users. Choose 3 methods and justify your choice.',
            style: GoogleFonts.inter(
              color: Colors.black.withOpacity(0.7),
              fontSize: 18,
              height: 1.6,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 48),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 0,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Start Assignment',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 12),
                const Icon(Icons.arrow_forward_rounded),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _NextLessonFooter extends StatelessWidget {
  final ValueChanged<String> onLessonTap;
  const _NextLessonFooter({required this.onLessonTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _FooterNavButton(
          label: 'PREVIOUS',
          title: '3.2 Using Research',
          icon: Icons.arrow_back_ios_new_rounded,
          onTap: () => onLessonTap('3.2 Using Research'),
        ),
        _FooterNavButton(
          label: 'NEXT LESSON',
          title: '3.4 Insight Translation',
          icon: Icons.arrow_forward_ios_rounded,
          onTap: () => onLessonTap('3.4 Insight Translation'),
          isNext: true,
        ),
      ],
    );
  }
}

class _FooterNavButton extends StatelessWidget {
  final String label;
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final bool isNext;

  const _FooterNavButton({
    required this.label,
    required this.title,
    required this.icon,
    required this.onTap,
    this.isNext = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(24),
        child: Row(
          children: [
            if (!isNext) Icon(icon, color: AppColors.grey, size: 20),
            if (!isNext) const SizedBox(width: 20),
            Column(
              crossAxisAlignment: isNext ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: GoogleFonts.inter(
                    color: AppColors.grey,
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  title,
                  style: GoogleFonts.outfit(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            if (isNext) const SizedBox(width: 20),
            if (isNext) Icon(icon, color: AppColors.accent, size: 20),
          ],
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String number;
  final String title;
  final String subtitle;

  const _SectionHeader({
    required this.number,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              number,
              style: GoogleFonts.jetBrainsMono(
                color: AppColors.accent,
                fontSize: 16,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(width: 16),
            Container(width: 40, height: 2, color: AppColors.accent.withOpacity(0.3)),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          title,
          style: GoogleFonts.outfit(
            color: Colors.white,
            fontSize: 48,
            fontWeight: FontWeight.w800,
            letterSpacing: -1.0,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          subtitle,
          style: GoogleFonts.inter(
            color: AppColors.greyLight,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}

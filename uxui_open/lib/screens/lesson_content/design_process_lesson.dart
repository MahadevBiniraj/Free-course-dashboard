import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/app_theme.dart';
import '../../widgets/breadcrumb_bar.dart';
import '../../widgets/lesson_widgets.dart';

class DesignProcessLesson extends StatelessWidget {
  final bool sidebarCollapsed;
  final VoidCallback onExpandSidebar;
  final ValueChanged<String> onLessonTap;

  const DesignProcessLesson({
    super.key,
    required this.sidebarCollapsed,
    required this.onExpandSidebar,
    required this.onLessonTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BreadcrumbBar(
          sidebarCollapsed: sidebarCollapsed,
          onExpandSidebar: onExpandSidebar,
          items: const [
            BreadcrumbItem(label: '02 – UX Fundamentals'),
            BreadcrumbItem(label: '2.7 Design Process 🎉📞', isLast: true),
          ],
        ),
        Expanded(
          child: Container(
            color: _LessonColors.bg,
            child: LayoutBuilder(
              builder: (context, constraints) {
                final isWide = constraints.maxWidth > 900;
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _HeroSection(isWide: isWide),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: isWide ? 48 : 24,
                          vertical: 32,
                        ),
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 1000),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const _IntroSection(),
                              const _SectionLabel(label: 'THE 7-STEP WORKFLOW'),
                              const _WorkflowStep(
                                number: '01',
                                title: 'Define Scope',
                                focus: 'Establishing business goals and project boundaries.',
                                deliverables: ['Project brief', 'Success metrics (KPIs)', 'Stakeholder alignment'],
                              ),
                              _WorkflowStep(
                                number: '02',
                                title: 'Research',
                                focus: 'Understanding user needs, behaviors, and pain points.',
                                deliverables: ['Personas', 'Competitive analysis', 'Research reports'],
                                imagePath: 'assets/images/lessons/research_phase.png',
                              ),
                              const _WorkflowStep(
                                number: '03',
                                title: 'Analysis & IA',
                                focus: 'Organizing findings and structuring the experience.',
                                deliverables: ['User journey maps', 'Task flows', 'Sitemaps'],
                              ),
                              _WorkflowStep(
                                number: '04',
                                title: 'Design',
                                focus: 'Creating the visual and structural layout.',
                                deliverables: ['Wireframes', 'Style guides', 'UI components'],
                                imagePath: 'assets/images/lessons/design_phase.png',
                              ),
                              const _WorkflowStep(
                                number: '05',
                                title: 'Prototype',
                                focus: 'Building interactive, testable models.',
                                deliverables: ['Low-to-high fidelity interactive prototypes'],
                              ),
                              _WorkflowStep(
                                number: '06',
                                title: 'Test',
                                focus: 'Validating designs with real users.',
                                deliverables: ['Usability reports', 'Feedback summaries', 'Bug logs'],
                                imagePath: 'assets/images/lessons/testing_phase.png',
                              ),
                              const _WorkflowStep(
                                number: '07',
                                title: 'Handoff & Launch',
                                focus: 'Transitioning design to development.',
                                deliverables: ['Production assets', 'Documentation', 'Deployment plan'],
                                isLast: true,
                              ),
                              const SizedBox(height: 48),
                              const _ModernShiftsSection(),
                              const SizedBox(height: 48),
                              const _TakeawaySection(),
                              const SizedBox(height: 64),
                              PrevNextBar(
                                prevLabel: '« 2.6 Designing For Everyone',
                                nextLabel: '2.8 Design Foundations »',
                                onPrev: () => onLessonTap('2.6 Designing For Everyone'),
                                onNext: () => onLessonTap('2.8 Design Foundations'),
                              ),
                              const SizedBox(height: 80),
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

class _LessonColors {
  static const bg = Color(0xFF121212);
  static const card = Color(0xFF1E1E1E);
  static const border = Color(0xFF2A2A2A);
  static const accent = Color(0xFF00C853);
  static const textMain = Colors.white;
  static const textDim = Color(0xFFA0A0A0);
}

class _HeroSection extends StatelessWidget {
  final bool isWide;
  const _HeroSection({required this.isWide});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isWide ? 400 : 300,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/lessons/design_process_hero.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              _LessonColors.bg.withOpacity(0.8),
              _LessonColors.bg,
            ],
          ),
        ),
        padding: const EdgeInsets.all(40),
        alignment: Alignment.bottomLeft,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: _LessonColors.accent,
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Text(
                'MODULE 2.7',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                  fontSize: 12,
                  letterSpacing: 1.0,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'The UX Design Process',
              style: GoogleFonts.outfit(
                color: Colors.white,
                fontSize: isWide ? 56 : 36,
                fontWeight: FontWeight.w800,
                height: 1.1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _IntroSection extends StatelessWidget {
  const _IntroSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: _LessonColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _LessonColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.auto_fix_high, color: _LessonColors.accent, size: 28),
              const SizedBox(width: 16),
              Text(
                'The Glue of UX',
                style: GoogleFonts.outfit(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            'The design process is the glue that holds everything together. It\'s the framework we use to move from a vague idea to a polished, validated product. In 2026, this process is faster and smarter than ever, powered by AI but guided by human empathy.',
            style: TextStyle(
              color: _LessonColors.textDim,
              fontSize: 16,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}

class _WorkflowStep extends StatelessWidget {
  final String number;
  final String title;
  final String focus;
  final List<String> deliverables;
  final String? imagePath;
  final bool isLast;

  const _WorkflowStep({
    required this.number,
    required this.title,
    required this.focus,
    required this.deliverables,
    this.imagePath,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: _LessonColors.accent, width: 2),
                ),
                child: Center(
                  child: Text(
                    number,
                    style: const TextStyle(
                      color: _LessonColors.accent,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              if (!isLast)
                Container(
                  width: 2,
                  height: 300, // Approximate height to bridge to next step
                  color: _LessonColors.border,
                ),
            ],
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.outfit(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  focus,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'KEY DELIVERABLES:',
                  style: TextStyle(
                    color: _LessonColors.accent,
                    fontSize: 12,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.0,
                  ),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: deliverables.map((d) => _DeliverableChip(label: d)).toList(),
                ),
                if (imagePath != null) ...[
                  const SizedBox(height: 24),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      imagePath!,
                      height: 240,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DeliverableChip extends StatelessWidget {
  final String label;
  const _DeliverableChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: _LessonColors.card,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: _LessonColors.border),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: _LessonColors.textDim,
          fontSize: 13,
        ),
      ),
    );
  }
}

class _ModernShiftsSection extends StatelessWidget {
  const _ModernShiftsSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionLabel(label: 'THE 2026 LANDSCAPE'),
        const SizedBox(height: 16),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _ShiftCard(
                icon: Icons.psychology,
                title: 'AI-Enhanced Workflow',
                description: 'Automating repetitive tasks to focus on strategy and empathy.',
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _ShiftCard(
                icon: Icons.bolt,
                title: 'Real-Time Iteration',
                description: 'Moving from static mockups to functional prototypes earlier.',
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _ShiftCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _ShiftCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: _LessonColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _LessonColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: _LessonColors.accent, size: 32),
          const SizedBox(height: 16),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(
              color: _LessonColors.textDim,
              fontSize: 14,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

class _TakeawaySection extends StatelessWidget {
  const _TakeawaySection();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            _LessonColors.accent.withOpacity(0.2),
            _LessonColors.bg,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: _LessonColors.accent.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          const Icon(Icons.stars, color: _LessonColors.accent, size: 48),
          const SizedBox(height: 24),
          const Text(
            'Process is a Spiral, Not a Line',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          const Text(
            'The goal is not to follow every step perfectly, but to get "good enough" ideas into the hands of real users as quickly as possible to learn and iterate.',
            style: TextStyle(
              color: _LessonColors.textDim,
              fontSize: 16,
              height: 1.6,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  final String label;
  const _SectionLabel({required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Text(
        label,
        style: const TextStyle(
          color: _LessonColors.textDim,
          fontSize: 12,
          fontWeight: FontWeight.w900,
          letterSpacing: 2.0,
        ),
      ),
    );
  }
}

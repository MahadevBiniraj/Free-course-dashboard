import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/app_theme.dart';
import '../../widgets/breadcrumb_bar.dart';
import '../../widgets/lesson_widgets.dart';

class DesigningForEveryoneLesson extends StatelessWidget {
  final bool sidebarCollapsed;
  final VoidCallback onExpandSidebar;
  final ValueChanged<String> onLessonTap;

  const DesigningForEveryoneLesson({
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
            BreadcrumbItem(label: '2.6 Designing For Everyone', isLast: true),
          ],
        ),
        Expanded(
          child: Container(
            color: const Color(0xFF121212),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final bool isMobile = constraints.maxWidth < 800;
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Hero Section
                      _HeroSection(isMobile: isMobile),

                      Padding(
                        padding: EdgeInsets.all(isMobile ? 20 : 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Introduction
                            _IntroSection(),
                            const SizedBox(height: 60),

                            // The Curb-Cut Effect
                            _CurbCutSection(isMobile: isMobile),
                            const SizedBox(height: 60),

                            // WCAG Principles (POUR)
                            _WcagSection(isMobile: isMobile),
                            const SizedBox(height: 60),

                            // Dimensions of Accessibility
                            _DimensionsSection(isMobile: isMobile),
                            const SizedBox(height: 60),

                            // Conclusion
                            _ConclusionSection(),
                            
                            const SizedBox(height: 40),
                            const PrevNextBar(
                              prevLabel: '2.5 The Visuals',
                              nextLabel: '2.7 Design Process',
                            ),
                            const SizedBox(height: 40),
                          ],
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
  final bool isMobile;
  const _HeroSection({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: isMobile ? 300 : 450,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/lessons/accessibility_hero.png'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black.withOpacity(0.8),
              Colors.transparent,
              Colors.black.withOpacity(0.8),
            ],
          ),
        ),
        padding: EdgeInsets.all(isMobile ? 20 : 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.green,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                'LESSON 2.6',
                style: GoogleFonts.outfit(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Designing For\nEveryone',
              style: GoogleFonts.outfit(
                color: Colors.white,
                fontSize: isMobile ? 36 : 64,
                fontWeight: FontWeight.bold,
                height: 1.1,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Building a web that is inclusive, accessible, and human-centric.',
              style: GoogleFonts.outfit(
                color: AppColors.greyLight,
                fontSize: isMobile ? 16 : 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _IntroSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'The Power of Inclusive Design',
          style: GoogleFonts.outfit(
            color: AppColors.green,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Accessibility is not a "feature" to be added at the end; it is a fundamental human right. In 2026, designing for everyone means creating experiences that work for users regardless of their physical, cognitive, or situational circumstances. When we design for the edges, we better define the middle.',
          style: GoogleFonts.outfit(
            color: AppColors.greyLight,
            fontSize: 18,
            height: 1.6,
          ),
        ),
      ],
    );
  }
}

class _CurbCutSection extends StatelessWidget {
  final bool isMobile;
  const _CurbCutSection({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.diversity_3, color: AppColors.green, size: 28),
            const SizedBox(width: 12),
            Text(
              'The Curb-Cut Effect',
              style: GoogleFonts.outfit(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),
        if (!isMobile)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset('assets/images/lessons/inclusive_design.png'),
                ),
              ),
              const SizedBox(width: 40),
              Expanded(
                flex: 1,
                child: _CurbCutContent(),
              ),
            ],
          )
        else
          Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset('assets/images/lessons/inclusive_design.png'),
              ),
              const SizedBox(height: 30),
              _CurbCutContent(),
            ],
          ),
      ],
    );
  }
}

class _CurbCutContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Named after the physical ramps on sidewalks designed for wheelchair users, the "Curb-Cut Effect" describes how accessibility features benefit everyone.',
          style: GoogleFonts.outfit(
            color: AppColors.greyLight,
            fontSize: 16,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 20),
        _BenefitItem(
          icon: Icons.closed_caption,
          title: 'Captions',
          desc: 'Designed for the deaf, but used by people in loud gyms or quiet libraries.',
        ),
        _BenefitItem(
          icon: Icons.contrast,
          title: 'High Contrast',
          desc: 'Designed for low vision, but used by everyone when viewing screens in direct sunlight.',
        ),
        _BenefitItem(
          icon: Icons.touch_app,
          title: 'Large Target Areas',
          desc: 'Designed for motor impairments, but helpful for people using devices one-handed while traveling.',
        ),
      ],
    );
  }
}

class _BenefitItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String desc;

  const _BenefitItem({required this.icon, required this.title, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppColors.green, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.outfit(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  desc,
                  style: GoogleFonts.outfit(
                    color: AppColors.greyLight,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _WcagSection extends StatelessWidget {
  final bool isMobile;
  const _WcagSection({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'The WCAG POUR Framework',
            style: GoogleFonts.outfit(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Web Content Accessibility Guidelines (WCAG) are built on four core principles:',
            style: GoogleFonts.outfit(color: AppColors.greyLight, fontSize: 16),
          ),
          const SizedBox(height: 40),
          if (!isMobile)
            Row(
              children: [
                Expanded(child: _PourItem(title: 'P', name: 'Perceivable', desc: 'Users must be able to perceive the info (e.g., alt text for images).')),
                Expanded(child: _PourItem(title: 'O', name: 'Operable', desc: 'UI components must be operable (e.g., keyboard navigation).')),
                Expanded(child: _PourItem(title: 'U', name: 'Understandable', desc: 'Information and operation must be clear.')),
                Expanded(child: _PourItem(title: 'R', name: 'Robust', desc: 'Content must be compatible with assistive technologies.')),
              ],
            )
          else
            Column(
              children: [
                _PourItem(title: 'P', name: 'Perceivable', desc: 'Users must be able to perceive the info.'),
                _PourItem(title: 'O', name: 'Operable', desc: 'UI components must be operable.'),
                _PourItem(title: 'U', name: 'Understandable', desc: 'Information must be clear.'),
                _PourItem(title: 'R', name: 'Robust', desc: 'Compatible with assistive tech.'),
              ],
            ),
          const SizedBox(height: 40),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/images/lessons/wcag_standards.png',
                width: isMobile ? double.infinity : 600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PourItem extends StatelessWidget {
  final String title;
  final String name;
  final String desc;

  const _PourItem({required this.title, required this.name, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      child: Column(
        children: [
          Text(
            title,
            style: GoogleFonts.outfit(
              color: AppColors.green,
              fontSize: 48,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            name,
            style: GoogleFonts.outfit(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            desc,
            textAlign: TextAlign.center,
            style: GoogleFonts.outfit(
              color: AppColors.greyLight,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

class _DimensionsSection extends StatelessWidget {
  final bool isMobile;
  const _DimensionsSection({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Dimensions of Accessibility',
          style: GoogleFonts.outfit(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 30),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: isMobile ? 1 : 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: isMobile ? 2.5 : 3,
          children: const [
            _DimensionCard(icon: Icons.visibility, title: 'Visual', desc: 'Blindness, low vision, color blindness.'),
            _DimensionCard(icon: Icons.hearing, title: 'Auditory', desc: 'Deafness, hard of hearing.'),
            _DimensionCard(icon: Icons.accessibility_new, title: 'Motor', desc: 'Inability to use a mouse, slow response time.'),
            _DimensionCard(icon: Icons.psychology, title: 'Cognitive', desc: 'Learning disabilities, distractibility, memory.'),
          ],
        ),
      ],
    );
  }
}

class _DimensionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String desc;

  const _DimensionCard({required this.icon, required this.title, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.green.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: AppColors.green, size: 24),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.outfit(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  desc,
                  style: GoogleFonts.outfit(
                    color: AppColors.greyLight,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ConclusionSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.green.withOpacity(0.2), Colors.transparent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.green.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          const Icon(Icons.star, color: AppColors.green, size: 40),
          const SizedBox(height: 20),
          Text(
            'The Ultimate Goal',
            style: GoogleFonts.outfit(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Inclusive design doesn\'t mean "one size fits all." It means "one size fits one." By creating flexible systems that adapt to the individual needs of every user, we build a more equitable digital world.',
            textAlign: TextAlign.center,
            style: GoogleFonts.outfit(
              color: AppColors.greyLight,
              fontSize: 18,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}

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
            color: AppColors.background,
            child: LayoutBuilder(
              builder: (context, constraints) {
                final bool isMobile = constraints.maxWidth < 800;
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _HeroSection(isMobile: isMobile),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: isMobile ? 24 : 60,
                          vertical: isMobile ? 32 : 80,
                        ),
                        child: Center(
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 900),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _IntroSection(),
                                const SizedBox(height: 100),
                                _CurbCutSection(isMobile: isMobile),
                                const SizedBox(height: 100),
                                _WcagSection(isMobile: isMobile),
                                const SizedBox(height: 100),
                                _DimensionsSection(isMobile: isMobile),
                                const SizedBox(height: 100),
                                _ConclusionSection(),
                                const SizedBox(height: 80),
                                const PrevNextBar(
                                  prevLabel: '2.5 The Visuals',
                                  nextLabel: '2.7 Design Process',
                                ),
                                const SizedBox(height: 60),
                              ],
                            ),
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
        padding: EdgeInsets.all(isMobile ? 24 : 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppColors.accent, AppColors.accentDeep],
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'LESSON 2.6',
                style: TextStyle(fontFamily: 'Lufga', 
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 2.5,
                ),
              ),
            ),
            const SizedBox(height: 32),
            Text(
              'Designing For\nEveryone',
              style: TextStyle(fontFamily: 'Lufga', 
                color: Colors.white,
                fontSize: isMobile ? 40 : 80,
                fontWeight: FontWeight.w900,
                height: 1.0,
                letterSpacing: -2.0,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Building a web that is inclusive, accessible, and human-centric.',
              style: TextStyle(fontFamily: 'Lufga', 
                color: AppColors.greyLight,
                fontSize: isMobile ? 18 : 24,
                fontWeight: FontWeight.w400,
                letterSpacing: -0.2,
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
          style: TextStyle(fontFamily: 'Lufga', 
            color: AppColors.accent,
            fontSize: 28,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Accessibility is not a "feature" to be added at the end; it is a fundamental human right. In 2026, designing for everyone means creating experiences that work for users regardless of their physical, cognitive, or situational circumstances. When we design for the edges, we better define the middle.',
          style: TextStyle(fontFamily: 'Lufga', 
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
            const Icon(Icons.diversity_3, color: AppColors.accent, size: 28),
            const SizedBox(width: 12),
            Text(
              'The Curb-Cut Effect',
              style: TextStyle(fontFamily: 'Lufga', 
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
          style: TextStyle(fontFamily: 'Lufga', 
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
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.accent,
              borderRadius: BorderRadius.circular(6),
              boxShadow: [
                BoxShadow(
                  color: AppColors.accent.withOpacity(0.2),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Icon(icon, color: Colors.white, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontFamily: 'Lufga', 
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  desc,
                  style: TextStyle(fontFamily: 'Lufga', 
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
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.cardBorder, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'The WCAG POUR Framework',
            style: TextStyle(fontFamily: 'Lufga', 
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
            style: TextStyle(fontFamily: 'Lufga', 
              foreground: Paint()
                ..shader = const LinearGradient(
                  colors: [AppColors.accent, AppColors.accentDeep],
                ).createShader(const Rect.fromLTWH(0.0, 0.0, 100.0, 50.0)),
              fontSize: 56,
              fontWeight: FontWeight.w900,
            ),
          ),
          Text(
            name,
            style: TextStyle(fontFamily: 'Lufga', 
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            desc,
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: 'Lufga', 
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
          style: TextStyle(fontFamily: 'Lufga', 
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
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.cardBorder, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.accent.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: AppColors.accent, size: 24),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontFamily: 'Lufga', 
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  desc,
                  style: TextStyle(fontFamily: 'Lufga', 
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
          colors: [AppColors.accent.withOpacity(0.15), Colors.transparent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.accent.withOpacity(0.2)),
      ),
      child: Column(
        children: [
          const Icon(Icons.auto_awesome, color: AppColors.accent, size: 48),
          const SizedBox(height: 20),
          Text(
            'The Ultimate Goal',
            style: TextStyle(fontFamily: 'Lufga', 
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Inclusive design doesn\'t mean "one size fits all." It means "one size fits one." By creating flexible systems that adapt to the individual needs of every user, we build a more equitable digital world.',
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: 'Lufga', 
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

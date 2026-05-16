import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/app_theme.dart';
import '../../widgets/breadcrumb_bar.dart';

class UserCenteredResearchLesson extends StatelessWidget {
  final bool sidebarCollapsed;
  final VoidCallback onExpandSidebar;
  final ValueChanged<String> onLessonTap;

  const UserCenteredResearchLesson({
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
            BreadcrumbItem(label: '3.1 User Centered Research', isLast: true),
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
                              _IntroText(),
                              const SizedBox(height: 60),
                              _CorePrinciplesGrid(),
                              const SizedBox(height: 80),
                              _BusinessValueSection(),
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
      height: 450,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('https://images.unsplash.com/photo-1553028826-f4804a6dba3b?auto=format&fit=crop&q=80&w=2000'),
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
              AppColors.background.withOpacity(0.7),
              AppColors.background,
            ],
          ),
        ),
        padding: const EdgeInsets.all(60),
        alignment: Alignment.bottomLeft,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '3.1 User Centered Research',
              style: GoogleFonts.outfit(
                color: Colors.white,
                fontSize: isWide ? 64 : 40,
                fontWeight: FontWeight.w800,
                letterSpacing: -1.5,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Placing the human at the heart of every design decision.',
              style: GoogleFonts.inter(
                color: AppColors.accent,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _IntroText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Introduction to UCR',
          style: GoogleFonts.outfit(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'User-Centered Research (UCR) is more than just a step in the process; it is a philosophy. It is the practice of involving users throughout the design and development cycle to create products that are truly useful, usable, and desirable.',
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

class _CorePrinciplesGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Core Principles',
          style: GoogleFonts.outfit(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 32),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 3,
          crossAxisSpacing: 24,
          mainAxisSpacing: 24,
          childAspectRatio: 1.2,
          children: [
            _PrincipleCard(
              icon: Icons.psychology_outlined,
              title: 'Empathy First',
              description: 'Setting aside your own biases to truly understand the user\'s perspective.',
            ),
            _PrincipleCard(
              icon: Icons.loop_rounded,
              title: 'Iterative Cycles',
              description: 'Research is not a one-time event; it happens in loops of discovery and validation.',
            ),
            _PrincipleCard(
              icon: Icons.data_usage_rounded,
              title: 'Evidence Based',
              description: 'Every design choice should be backed by observed user behavior or stated needs.',
            ),
          ],
        ),
      ],
    );
  }
}

class _PrincipleCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _PrincipleCard({required this.icon, required this.title, required this.description});

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
          Icon(icon, color: AppColors.accent, size: 32),
          const SizedBox(height: 16),
          Text(
            title,
            style: GoogleFonts.outfit(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: GoogleFonts.inter(
              color: AppColors.grey,
              fontSize: 14,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

class _BusinessValueSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(48),
      decoration: BoxDecoration(
        color: AppColors.accent.withOpacity(0.05),
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: AppColors.accent.withOpacity(0.2)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'The Business Case',
                  style: GoogleFonts.outfit(
                    color: AppColors.accent,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Research isn\'t just "nice to have." It saves companies millions by preventing the development of features that users don\'t want or can\'t use. It reduces support costs and increases customer lifetime value.',
                  style: GoogleFonts.inter(
                    color: Colors.white70,
                    fontSize: 16,
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 48),
          const Icon(Icons.trending_up_rounded, color: AppColors.accent, size: 80),
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
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          onPressed: () => onLessonTap('3.2 Using Research'),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.accent,
            foregroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          child: const Row(
            children: [
              Text('Next: 3.2 Using Research', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(width: 12),
              Icon(Icons.arrow_forward_rounded),
            ],
          ),
        ),
      ],
    );
  }
}

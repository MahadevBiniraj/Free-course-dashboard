import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/breadcrumb_bar.dart';
import '../../widgets/lesson_widgets.dart';

class VisualsLesson extends StatelessWidget {
  final bool sidebarCollapsed;
  final VoidCallback onExpandSidebar;
  final ValueChanged<String> onLessonTap;

  const VisualsLesson({
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
            BreadcrumbItem(label: '2.5 The Visuals', isLast: true),
          ],
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(36, 28, 36, 36),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ── Title ──────────────────────────────────────────────────
                const Text(
                  '2.5 The Visuals 🎨',
                  style: AppTextStyles.heading1,
                ),
                const SizedBox(height: 24),

                // ── Learning Objective ─────────────────────────────────────
                const _LearningObjectiveBox(
                  text: 'By the end of this checkpoint, you will be able to explain the importance of visual design in UX and identify the key principles that guide modern interface design.',
                ),
                const SizedBox(height: 32),

                // ── Section 1: Intro ──────────────────────────────────────
                const Text(
                  'Visual design is more than just making things look "pretty." It\'s a functional tool that designers use to guide users, establish brand credibility, and evoke emotional responses.',
                  style: AppTextStyles.body,
                ),
                const SizedBox(height: 24),
                
                _ImageCard(
                  imagePath: 'assets/images/visuals/ux_ui_devices.png',
                  caption: 'Visual design spans across multiple platforms and devices.',
                ),
                const SizedBox(height: 32),

                // ── Section 2: Key Principles ─────────────────────────────
                const _SectionHeading('Key Visual Principles'),
                const SizedBox(height: 14),
                const Text(
                  'Modern visual design is built on several core principles that ensure interfaces are both beautiful and usable.',
                  style: AppTextStyles.body,
                ),
                const SizedBox(height: 20),
                
                _PrincipleRow(
                  icon: Icons.text_fields,
                  title: 'Typography',
                  desc: 'Choosing the right fonts to ensure readability and establish hierarchy.',
                ),
                _PrincipleRow(
                  icon: Icons.palette,
                  title: 'Color Theory',
                  desc: 'Using color palettes that evoke the right mood and pass accessibility checks.',
                ),
                _PrincipleRow(
                  icon: Icons.grid_view,
                  title: 'Grid & Layout',
                  desc: 'Organizing elements in a structured way to create visual balance.',
                ),
                const SizedBox(height: 24),
                
                _ImageCard(
                  imagePath: 'assets/images/visuals/ux_elements_grid.png',
                  caption: 'Consistency in UI elements is key to a professional look.',
                ),
                const SizedBox(height: 32),

                // ── Section 3: Intersection of UX & UI ────────────────────
                const _SectionHeading('The Intersection of UX & UI'),
                const SizedBox(height: 14),
                const Text(
                  'Visual design (UI) and user experience (UX) are inseparable. While UX focuses on how it works, UI focuses on how it looks and feels.',
                  style: AppTextStyles.body,
                ),
                const SizedBox(height: 28),
                
                const Center(child: VennDiagramWidget()),
                const SizedBox(height: 12),
                const Center(
                  child: Text(
                    'The sweet spot: where usability meets aesthetic excellence.',
                    style: TextStyle(color: AppColors.greyLight, fontSize: 13, fontStyle: FontStyle.italic),
                  ),
                ),
                const SizedBox(height: 32),

                // ── Section 4: Collaboration ──────────────────────────────
                const _SectionHeading('Collaboration in Design'),
                const SizedBox(height: 14),
                const Text(
                  'Visual designers rarely work in isolation. They collaborate with researchers, developers, and product managers to bring a vision to life.',
                  style: AppTextStyles.body,
                ),
                const SizedBox(height: 24),
                
                _ImageCard(
                  imagePath: 'assets/images/visuals/design_collaboration.png',
                  caption: 'Design is a team sport.',
                ),
                const SizedBox(height: 32),

                // ── Section 5: Future of Visuals ──────────────────────────
                const _SectionHeading('The Future of Visual Design'),
                const SizedBox(height: 14),
                const Text(
                  'As technology evolves, so does visual design. We are moving beyond 2D screens into immersive AR/VR experiences and AI-driven generative layouts.',
                  style: AppTextStyles.body,
                ),
                const SizedBox(height: 24),
                
                _ImageCard(
                  imagePath: 'assets/images/visuals/ar_glasses.png',
                  caption: 'Spatial design is the next frontier for visual designers.',
                ),
                const SizedBox(height: 48),

                // ── Footer Nav ─────────────────────────────────────────────
                PrevNextBar(
                  prevLabel: '« 2.4 Understanding Users',
                  nextLabel: '2.6 Designing For Everyone »',
                  onPrev: () => onLessonTap('2.4 Understanding Users'),
                  onNext: () => onLessonTap('2.6 Designing For Everyone'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _SectionHeading extends StatelessWidget {
  final String text;
  const _SectionHeading(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 40,
          height: 3,
          decoration: BoxDecoration(
            color: AppColors.green,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(height: 12),
        Text(text, style: AppTextStyles.heading2),
      ],
    );
  }
}

class _LearningObjectiveBox extends StatelessWidget {
  final String text;
  const _LearningObjectiveBox({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF0D2818),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.green.withAlpha(80), width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.green.withAlpha(40),
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Text(
              '🎯 LEARNING OBJECTIVE',
              style: TextStyle(
                color: AppColors.green,
                fontSize: 12,
                fontWeight: FontWeight.w800,
                letterSpacing: 1.0,
              ),
            ),
          ),
          const SizedBox(height: 14),
          Text(
            text,
            style: const TextStyle(
              color: Color(0xFF8FD9A8),
              fontSize: 15,
              height: 1.65,
            ),
          ),
        ],
      ),
    );
  }
}

class _ImageCard extends StatelessWidget {
  final String imagePath;
  final String caption;

  const _ImageCard({super.key, required this.imagePath, required this.caption});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              width: double.infinity,
              errorBuilder: (context, error, stackTrace) => Container(
                height: 200,
                color: AppColors.greyLight.withAlpha(30),
                child: const Icon(Icons.image, color: AppColors.greyLight),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              caption,
              style: const TextStyle(color: AppColors.greyLight, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}

class _PrincipleRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String desc;

  const _PrincipleRow({super.key, required this.icon, required this.title, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.green.withAlpha(30),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: AppColors.green, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: AppColors.white, fontSize: 17, fontWeight: FontWeight.w700)),
                const SizedBox(height: 4),
                Text(desc, style: const TextStyle(color: AppColors.greyLight, fontSize: 14, height: 1.5)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class VennDiagramWidget extends StatelessWidget {
  const VennDiagramWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      height: 240,
      child: CustomPaint(
        painter: _VennPainter(),
      ),
    );
  }
}

class _VennPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    const radius = 80.0;

    final uxPaint = Paint()
      ..color = AppColors.greenLight.withAlpha(100)
      ..style = PaintingStyle.fill;

    final uiPaint = Paint()
      ..color = AppColors.green.withAlpha(100)
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = Colors.white.withAlpha(50)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    // Draw UX Circle (Left)
    canvas.drawCircle(Offset(center.dx - 45, center.dy), radius, uxPaint);
    canvas.drawCircle(Offset(center.dx - 45, center.dy), radius, borderPaint);

    // Draw UI Circle (Right)
    canvas.drawCircle(Offset(center.dx + 45, center.dy), radius, uiPaint);
    canvas.drawCircle(Offset(center.dx + 45, center.dy), radius, borderPaint);

    // Labels
    _drawText(canvas, "UX", Offset(center.dx - 70, center.dy - 10));
    _drawText(canvas, "UI", Offset(center.dx + 50, center.dy - 10));
    _drawText(canvas, "Product Design", Offset(center.dx - 35, center.dy + 85), fontSize: 12, isBold: true);
  }

  void _drawText(Canvas canvas, String text, Offset offset, {double fontSize = 16, bool isBold = false}) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
          color: Colors.white,
          fontSize: fontSize,
          fontWeight: isBold ? FontWeight.w800 : FontWeight.w600,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

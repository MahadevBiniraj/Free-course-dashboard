import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../../theme/app_theme.dart';
import '../../widgets/breadcrumb_bar.dart';
import '../../widgets/lesson_widgets.dart';

class WayOfDesignerLesson extends StatelessWidget {
  final bool sidebarCollapsed;
  final VoidCallback onExpandSidebar;
  final ValueChanged<String> onLessonTap;

  const WayOfDesignerLesson({
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
            BreadcrumbItem(label: '2.1 The Way Of The Designer ⭐', isLast: true),
          ],
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(36, 28, 36, 36),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '2.1 The way of the designer 😊',
                  style: AppTextStyles.heading1,
                ),
                const SizedBox(height: 24),
                const Text(
                  "Becoming a successful designer is not just about mastering tools and techniques; it's about adopting a specific mindset and way of approaching problems. This is often referred to as 'design thinking'.",
                  style: AppTextStyles.body,
                ),
                const SizedBox(height: 12),
                const Text(
                  "As a UX/UI designer, you'll be solving complex problems for users while balancing the needs of the business. To do this effectively, you need to understand the core principles that guide the design process.",
                  style: AppTextStyles.body,
                ),
                const SizedBox(height: 48),

                _HexagonDiagramSection(),
                const SizedBox(height: 48),

                _ImageTextRow(
                  title: '1. The design process',
                  text: 'A design process is a structured approach to problem-solving. It provides a framework for understanding users, challenging assumptions, and creating innovative solutions. While every designer and team might have their own variation, most follow a similar path.',
                  painter: _DesignProcessPainter(),
                ),
                const SizedBox(height: 32),

                _ImageTextRow(
                  title: '2. Collaboration',
                  text: "Design is a team sport. You'll work closely with product managers, developers, researchers, and other stakeholders. Effective communication and collaboration are essential for bringing ideas to life.",
                  painter: _CollaborationPainter(),
                  imageRight: true,
                ),
                const SizedBox(height: 32),

                _ImageTextRow(
                  title: '3. Feedback is Essential',
                  text: "Feedback is the fuel for improvement. Learn to give and receive constructive criticism gracefully. It's not about defending your work; it's about making it better.",
                  painter: _VennDiagramPainter(),
                ),
                const SizedBox(height: 48),

                _RolesSection(),
                const SizedBox(height: 48),

                _ImageTextRow(
                  title: '4. Empathy',
                  text: "Empathy is the foundation of user-centric design. It's about putting yourself in the user's shoes, understanding their pain points, and designing solutions that address their real needs.",
                  painter: _EmpathyMapPainter(),
                  imageRight: true,
                ),
                const SizedBox(height: 32),

                _ImageTextRow(
                  title: '5. Iteration',
                  text: "Design is never 'done'. It's a continuous cycle of testing, learning, and refining. Embrace iteration as a natural part of the process.",
                  painter: _MagnifierChartPainter(),
                ),
                const SizedBox(height: 32),

                _ImageTextRow(
                  title: '6. Problem Solving',
                  text: "At its core, design is about solving problems. You'll need to break down complex challenges into manageable pieces and find elegant solutions.",
                  painter: _ProblemSolvingPainter(),
                  imageRight: true,
                ),
                const SizedBox(height: 32),

                _ImageTextRow(
                  title: '7. Business Value',
                  text: "Good design is good for business. You need to understand how your work impacts key business metrics and align your design decisions with the company's goals.",
                  painter: _MindMapPainter(),
                ),
                const SizedBox(height: 48),

                PrevNextBar(
                  prevLabel: '« 02 – UX Fundamentals',
                  nextLabel: '2.2 Your Career »',
                  onPrev: () => onLessonTap('02 – UX Fundamentals'),
                  onNext: () => onLessonTap('2.2 Your Career'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Components
// ─────────────────────────────────────────────────────────────────────────────

class _ImageTextRow extends StatelessWidget {
  final String title;
  final String text;
  final CustomPainter painter;
  final bool imageRight;

  const _ImageTextRow({
    required this.title,
    required this.text,
    required this.painter,
    this.imageRight = false,
  });

  @override
  Widget build(BuildContext context) {
    final imageWidget = Container(
      width: 200,
      height: 160,
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: CustomPaint(painter: painter),
    );

    final textWidget = Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyles.heading3),
          const SizedBox(height: 12),
          Text(text, style: AppTextStyles.body),
        ],
      ),
    );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: imageRight
          ? [textWidget, const SizedBox(width: 32), imageWidget]
          : [imageWidget, const SizedBox(width: 32), textWidget],
    );
  }
}

class _HexagonDiagramSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('The Design Process', style: AppTextStyles.heading2),
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
          decoration: BoxDecoration(
            color: AppColors.cardBackground,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.cardBorder),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _HexNode('EMPATHIZE', AppColors.green),
                  _Arrow(),
                  _HexNode('DEFINE', AppColors.greenLight),
                  _Arrow(),
                  _HexNode('IDEATE', AppColors.green),
                  _Arrow(),
                  _HexNode('PROTOTYPE', AppColors.greenLight),
                  _Arrow(),
                  _HexNode('TEST', AppColors.green),
                ],
              ),
              const SizedBox(height: 24),
              const Text(
                'Stages of design thinking can be carried out in a different order and repeated as needed.',
                style: TextStyle(color: AppColors.greyLight, fontSize: 13, fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _HexNode extends StatelessWidget {
  final String label;
  final Color color;
  const _HexNode(this.label, this.color);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 75,
      height: 85,
      child: CustomPaint(
        painter: _HexShapePainter(color),
        child: Center(
          child: Text(label, style: const TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold, letterSpacing: 0.5)),
        ),
      ),
    );
  }
}

class _HexShapePainter extends CustomPainter {
  final Color color;
  _HexShapePainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final cy = size.height / 2;
    final r = size.width / 2;

    final path = Path();
    for (int i = 0; i < 6; i++) {
      final angle = 2 * math.pi / 6 * i - math.pi / 6;
      final x = cx + r * math.cos(angle);
      final y = cy + r * math.sin(angle);
      if (i == 0) path.moveTo(x, y);
      else path.lineTo(x, y);
    }
    path.close();

    canvas.drawPath(path, Paint()..color = color);
    canvas.drawPath(path, Paint()..color = Colors.white.withOpacity(0.15)..style = PaintingStyle.stroke..strokeWidth = 2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter old) => false;
}

class _Arrow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Container(width: 12, height: 2, color: AppColors.greyLight.withOpacity(0.5)),
          Icon(Icons.arrow_forward_ios, size: 10, color: AppColors.greyLight.withOpacity(0.5)),
        ],
      ),
    );
  }
}

class _RolesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Roles and Responsibilities', style: AppTextStyles.heading2),
        const SizedBox(height: 12),
        const Text(
          "As a designer, you'll collaborate with various roles. Here's a quick overview of who does what:",
          style: AppTextStyles.body,
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            _RoleCard(
              title: 'Product Manager',
              desc: "Defines the 'what' and 'why'.",
              icon: Icons.lightbulb_outline,
              color: AppColors.green,
            ),
            const SizedBox(width: 16),
            _RoleCard(
              title: 'UX Designer',
              desc: "Focuses on the user journey and experience.",
              icon: Icons.route,
              color: AppColors.greenLight,
            ),
            const SizedBox(width: 16),
            _RoleCard(
              title: 'UI Designer',
              desc: "Creates the visual interface and interactive elements.",
              icon: Icons.color_lens,
              color: AppColors.green,
            ),
            const SizedBox(width: 16),
            _RoleCard(
              title: 'Developer',
              desc: "Builds the product and brings the design to life.",
              icon: Icons.code,
              color: AppColors.greenLight,
            ),
          ],
        ),
      ],
    );
  }
}

class _RoleCard extends StatelessWidget {
  final String title;
  final String desc;
  final IconData icon;
  final Color color;

  const _RoleCard({required this.title, required this.desc, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 180,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.cardBorder),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.1),
              blurRadius: 15,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: color, size: 24),
            ),
            const Spacer(),
            Text(title, style: const TextStyle(color: AppColors.white, fontSize: 14, fontWeight: FontWeight.w700)),
            const SizedBox(height: 8),
            Text(desc, style: const TextStyle(color: AppColors.greyLight, fontSize: 12, height: 1.4)),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Custom Painters
// ─────────────────────────────────────────────────────────────────────────────

class _DesignProcessPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    
    canvas.drawRect(Rect.fromCenter(center: center - const Offset(20, 20), width: 40, height: 40), Paint()..color = AppColors.green.withOpacity(0.8));
    canvas.drawCircle(center + const Offset(30, -10), 25, Paint()..color = AppColors.greenLight.withOpacity(0.8));
    canvas.drawRRect(RRect.fromRectAndRadius(Rect.fromCenter(center: center + const Offset(-10, 30), width: 50, height: 30), const Radius.circular(8)), Paint()..color = AppColors.green.withOpacity(0.8));

    final cursorPath = Path()
      ..moveTo(center.dx + 10, center.dy + 10)
      ..lineTo(center.dx + 25, center.dy + 35)
      ..lineTo(center.dx + 18, center.dy + 35)
      ..lineTo(center.dx + 18, center.dy + 45)
      ..lineTo(center.dx + 10, center.dy + 45)
      ..lineTo(center.dx + 10, center.dy + 35)
      ..lineTo(center.dx + 0, center.dy + 35)
      ..close();
    canvas.drawPath(cursorPath, Paint()..color = AppColors.white);
    canvas.drawPath(cursorPath, Paint()..color = Colors.black.withOpacity(0.2)..style = PaintingStyle.stroke..strokeWidth = 2);
  }
  @override
  bool shouldRepaint(covariant CustomPainter old) => false;
}

class _CollaborationPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final cy = size.height / 2;
    
    final p1 = Offset(cx - 30, cy);
    final p2 = Offset(cx + 30, cy);

    canvas.drawLine(p1, p2, Paint()..color = AppColors.cardBorder..strokeWidth = 4);

    canvas.drawCircle(p1, 24, Paint()..color = AppColors.green.withOpacity(0.2));
    canvas.drawCircle(p1, 24, Paint()..color = AppColors.green..style = PaintingStyle.stroke..strokeWidth = 2);
    
    canvas.drawCircle(p2, 24, Paint()..color = AppColors.yellow.withOpacity(0.2));
    canvas.drawCircle(p2, 24, Paint()..color = AppColors.yellow..style = PaintingStyle.stroke..strokeWidth = 2);

    final tp1 = TextPainter(text: const TextSpan(text: '🤝', style: TextStyle(fontSize: 20)), textDirection: TextDirection.ltr)..layout();
    tp1.paint(canvas, p1 - Offset(tp1.width/2, tp1.height/2));
    
    final tp2 = TextPainter(text: const TextSpan(text: '💬', style: TextStyle(fontSize: 20)), textDirection: TextDirection.ltr)..layout();
    tp2.paint(canvas, p2 - Offset(tp2.width/2, tp2.height/2));
  }
  @override
  bool shouldRepaint(covariant CustomPainter old) => false;
}

class _VennDiagramPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final cy = size.height / 2;
    const r = 40.0;
    const dy = 18.0;
    const dx = 22.0;

    final topC = Offset(cx, cy - dy - 5);
    final botL = Offset(cx - dx, cy + dy + 5);
    final botR = Offset(cx + dx, cy + dy + 5);

    void drawCircle(Offset c, Color color) {
      canvas.drawCircle(c, r, Paint()..color = color.withOpacity(0.2)..style = PaintingStyle.fill);
      canvas.drawCircle(c, r, Paint()..color = color.withOpacity(0.8)..style = PaintingStyle.stroke..strokeWidth = 2);
    }

    drawCircle(topC, AppColors.greenLight);
    drawCircle(botL, AppColors.green);
    drawCircle(botR, AppColors.greenLight);

    void drawLabel(String t, Offset pos, Color c) {
      final tp = TextPainter(
        text: TextSpan(text: t, style: TextStyle(fontSize: 9, color: c, fontWeight: FontWeight.w700)),
        textDirection: TextDirection.ltr,
      )..layout();
      tp.paint(canvas, pos - Offset(tp.width / 2, tp.height / 2));
    }

    drawLabel('Desirability', topC - const Offset(0, r + 8), AppColors.greenLight);
    drawLabel('Viability', botL - const Offset(r * 0.8, -r * 0.8), AppColors.green);
    drawLabel('Feasibility', botR + const Offset(r * 0.8, r * 0.8), AppColors.greenLight);
  }
  @override
  bool shouldRepaint(covariant CustomPainter old) => false;
}

class _EmpathyMapPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final cy = size.height / 2;

    final paint = Paint()
      ..color = AppColors.cardBorder
      ..strokeWidth = 2;
    
    canvas.drawLine(Offset(cx, 20), Offset(cx, size.height - 20), paint);
    canvas.drawLine(Offset(20, cy), Offset(size.width - 20, cy), paint);

    canvas.drawCircle(Offset(cx, cy), 18, Paint()..color = AppColors.cardBackground);
    canvas.drawCircle(Offset(cx, cy), 18, paint);
    final iconPaint = TextPainter(
      text: const TextSpan(text: '👤', style: TextStyle(fontSize: 16)),
      textDirection: TextDirection.ltr,
    )..layout();
    iconPaint.paint(canvas, Offset(cx - iconPaint.width/2, cy - iconPaint.height/2));

    void drawText(String t, Offset pos, Color c) {
      final tp = TextPainter(
        text: TextSpan(text: t, style: TextStyle(fontSize: 11, color: c, fontWeight: FontWeight.w800, letterSpacing: 1)),
        textDirection: TextDirection.ltr,
      )..layout();
      tp.paint(canvas, pos - Offset(tp.width / 2, tp.height / 2));
    }

    drawText('SAYS', Offset(cx / 2 + 10, cy / 2 + 10), AppColors.green);
    drawText('THINKS', Offset(cx + cx / 2 - 10, cy / 2 + 10), AppColors.greenLight);
    drawText('DOES', Offset(cx / 2 + 10, cy + cy / 2 - 10), AppColors.green);
    drawText('FEELS', Offset(cx + cx / 2 - 10, cy + cy / 2 - 10), AppColors.greenLight);
  }
  @override
  bool shouldRepaint(covariant CustomPainter old) => false;
}

class _MagnifierChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final cy = size.height / 2;
    
    final barPaint = Paint()..color = AppColors.green.withOpacity(0.5);
    final bars = [0.4, 0.7, 0.5, 0.9, 0.6, 0.8, 0.5];
    const barW = 10.0;
    final startX = cx - (bars.length * (barW + 8)) / 2;
    for (int i = 0; i < bars.length; i++) {
      final bh = bars[i] * 60;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(startX + i * (barW + 8), size.height - 30 - bh, barW, bh),
          const Radius.circular(4),
        ),
        barPaint,
      );
    }

    final magCenter = Offset(cx + 15, cy - 10);
    const magR = 30.0;
    canvas.drawCircle(magCenter, magR, Paint()..color = AppColors.green.withOpacity(0.15));
    canvas.drawCircle(magCenter, magR, Paint()..color = AppColors.green..style = PaintingStyle.stroke..strokeWidth = 3);
    canvas.drawLine(magCenter + const Offset(magR * 0.7, magR * 0.7), magCenter + const Offset(magR * 1.5, magR * 1.5), Paint()..color = AppColors.green..strokeWidth = 5..strokeCap = StrokeCap.round);
  }
  @override
  bool shouldRepaint(covariant CustomPainter old) => false;
}

class _ProblemSolvingPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final cy = size.height / 2;

    final paint = Paint()..color = AppColors.green.withOpacity(0.8);
    
    canvas.drawCircle(Offset(cx, cy - 15), 20, paint);
    canvas.drawRect(Rect.fromCenter(center: Offset(cx, cy + 10), width: 16, height: 12), Paint()..color = AppColors.greyLight);
    
    final rayPaint = Paint()..color = AppColors.greenLight.withOpacity(0.5)..strokeWidth = 3..strokeCap = StrokeCap.round;
    for (int i = 0; i < 5; i++) {
      final angle = -3.14 + (3.14 / 4) * i;
      final start = Offset(cx + 25 * math.cos(angle), cy - 15 + 25 * math.sin(angle));
      final end = Offset(cx + 35 * math.cos(angle), cy - 15 + 35 * math.sin(angle));
      canvas.drawLine(start, end, rayPaint);
    }
  }
  @override
  bool shouldRepaint(covariant CustomPainter old) => false;
}

class _MindMapPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final cy = size.height / 2;

    final center = Offset(cx, cy);
    final nodes = [
      Offset(cx - 35, cy - 25),
      Offset(cx + 35, cy - 25),
      Offset(cx - 25, cy + 35),
      Offset(cx + 35, cy + 25),
    ];

    final linePaint = Paint()..color = AppColors.cardBorder..strokeWidth = 2;
    for (var node in nodes) {
      canvas.drawLine(center, node, linePaint);
      canvas.drawCircle(node, 10, Paint()..color = AppColors.cardBorder);
    }

    canvas.drawCircle(center, 22, Paint()..color = AppColors.green);
    final tp = TextPainter(
      text: const TextSpan(text: 'P-M-F', style: TextStyle(fontSize: 10, color: AppColors.cardBackground, fontWeight: FontWeight.bold)),
      textDirection: TextDirection.ltr,
    )..layout();
    tp.paint(canvas, center - Offset(tp.width/2, tp.height/2));
  }
  @override
  bool shouldRepaint(covariant CustomPainter old) => false;
}


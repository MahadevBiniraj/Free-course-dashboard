import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/breadcrumb_bar.dart';
import '../../widgets/lesson_widgets.dart';

class WayOfDesignerLesson extends StatelessWidget {
  final bool sidebarCollapsed;
  final VoidCallback onExpandSidebar;

  const WayOfDesignerLesson({
    super.key,
    required this.sidebarCollapsed,
    required this.onExpandSidebar,
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
                // ── On this page ─────────────────────────────────────────────
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: AppColors.cardBackground,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: AppColors.cardBorder),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('On this page', style: TextStyle(color: AppColors.greyLight, fontSize: 15)),
                      Icon(Icons.keyboard_arrow_down, color: AppColors.greyLight),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // ── Title ────────────────────────────────────────────────────
                const Text(
                  '2.1 The way of the designer 😊',
                  style: TextStyle(color: AppColors.white, fontSize: 36, fontWeight: FontWeight.w800, letterSpacing: -1.0),
                ),
                const SizedBox(height: 24),

                // ── Success Criteria ──────────────────────────────────────────
                SuccessCriteriaBox(
                  coral: AppColors.coral,
                  onDone: () {},
                ),
                const SizedBox(height: 32),

                // ── Written Lessons row with donut chart ─────────────────────
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                color: AppColors.coralDim,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Text('Written lessons', style: TextStyle(color: AppColors.coral, fontSize: 13, fontWeight: FontWeight.w600)),
                            ),
                          ]),
                          const SizedBox(height: 16),
                          const Text(
                            'As a designer, you occupy a unique space in the world. Every object around you has been shaped by a designer\'s hand — from the mug you drank your morning coffee from, to the chair you\'re sitting on, to the app you used to set your morning alarm.',
                            style: TextStyle(color: AppColors.greyLight, fontSize: 15, height: 1.7),
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            'And as a UX/UI designer, you\'re specifically focused on the digital world. You create the apps, websites, and digital experiences that billions of people use every single day.',
                            style: TextStyle(color: AppColors.greyLight, fontSize: 15, height: 1.7),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 32),
                    // Donut chart
                    SizedBox(
                      width: 140,
                      height: 140,
                      child: CustomPaint(
                        painter: DonutChartPainter(),
                        child: const Center(
                          child: Text('UX/UI\nOpen', textAlign: TextAlign.center,
                            style: TextStyle(color: AppColors.white, fontSize: 12, fontWeight: FontWeight.w700)),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),

                // ── UX Design Hierarchy Tree ──────────────────────────────────
                const UXHierarchyTree(),
                const SizedBox(height: 32),

                // ── Body text + colorful blobs ────────────────────────────────
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'What does a UX/UI designer actually do?',
                            style: TextStyle(color: AppColors.white, fontSize: 22, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(height: 12),
                          Text(
                            'UX designers are problem solvers. They research, ideate, and test solutions. UI designers make those solutions look beautiful and feel intuitive. Most modern designers blend both disciplines.',
                            style: TextStyle(color: AppColors.greyLight, fontSize: 15, height: 1.7),
                          ),
                          SizedBox(height: 12),
                          Text(
                            'The best products are born when empathy meets aesthetics — when designers truly understand the user AND craft something delightful for them to experience.',
                            style: TextStyle(color: AppColors.greyLight, fontSize: 15, height: 1.7),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 24),
                    // Colorful blob illustration
                    SizedBox(
                      width: 160,
                      height: 160,
                      child: CustomPaint(painter: BlobIllustrationPainter()),
                    ),
                  ],
                ),
                const SizedBox(height: 32),

                // ── More body text ───────────────────────────────────────────
                const Text(
                  'About specialization in general',
                  style: TextStyle(color: AppColors.white, fontSize: 22, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 12),
                RichText(
                  text: const TextSpan(
                    style: TextStyle(color: AppColors.greyLight, fontSize: 15, height: 1.7),
                    children: [
                      TextSpan(text: 'While UX/UI is a broad and growing field, many designers eventually specialize. You might become a '),
                      TextSpan(text: 'Product Designer', style: TextStyle(color: AppColors.coral, fontWeight: FontWeight.w600)),
                      TextSpan(text: ', a '),
                      TextSpan(text: 'Motion Designer', style: TextStyle(color: AppColors.coral, fontWeight: FontWeight.w600)),
                      TextSpan(text: ', or an '),
                      TextSpan(text: 'Interaction Designer', style: TextStyle(color: AppColors.coral, fontWeight: FontWeight.w600)),
                      TextSpan(text: '. But early on, it\'s best to stay broad and soak it all in.'),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Your goal right now is to understand the landscape. What excites you? What problems do you want to solve? The answers will naturally guide your specialization over time.',
                  style: TextStyle(color: AppColors.greyLight, fontSize: 15, height: 1.7),
                ),
                const SizedBox(height: 32),

                // ── Figma screenshot banner ──────────────────────────────────
                Container(
                  width: double.infinity,
                  height: 280,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: const LinearGradient(
                      colors: [Color(0xFF1C1C2E), Color(0xFF2D1B4E)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Stack(
                    children: [
                      // Background colored shapes
                      Positioned(top: 20, right: 40, child: Container(width: 80, height: 80,
                        decoration: const BoxDecoration(color: Color(0xFFF24E1E), shape: BoxShape.circle))),
                      Positioned(top: 60, right: 20, child: Container(width: 50, height: 50,
                        decoration: const BoxDecoration(color: Color(0xFFA259FF), shape: BoxShape.circle))),
                      Positioned(bottom: 30, right: 60, child: Container(width: 60, height: 60,
                        decoration: const BoxDecoration(color: Color(0xFF0ACF83), shape: BoxShape.circle))),
                      Positioned(top: 40, left: 40, child: Container(width: 40, height: 40,
                        decoration: const BoxDecoration(color: Color(0xFF1ABCFE), shape: BoxShape.circle))),
                      // Center text
                      const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Where teams', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.w900, letterSpacing: -0.5)),
                            Text('design together', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.w900, letterSpacing: -0.5)),
                            SizedBox(height: 12),
                            Text('figma', style: TextStyle(color: Colors.white70, fontSize: 18, fontWeight: FontWeight.w500, letterSpacing: 2)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),

                // ── Figma Annual orange card ──────────────────────────────────
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(28),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF6A623),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("Figma's Annual", style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.w600, letterSpacing: 0.5)),
                            SizedBox(height: 4),
                            Text('Config 2024', style: TextStyle(color: Colors.black, fontSize: 28, fontWeight: FontWeight.w900, letterSpacing: -0.5)),
                            SizedBox(height: 8),
                            Text('Watch the latest design talks, product announcements, and community sessions from Config.', style: TextStyle(color: Color(0xFF3D2800), fontSize: 14, height: 1.5)),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.black.withAlpha(20),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(Icons.play_circle_filled, color: Colors.black, size: 48),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),

                // ── Design Journal ────────────────────────────────────────────
                const Text('Design Journal', style: TextStyle(color: AppColors.white, fontSize: 22, fontWeight: FontWeight.w700)),
                const SizedBox(height: 12),
                const Text(
                  'One of the best habits you can build as a designer is keeping a design journal. In it, you\'ll collect things that inspire you — screenshots, sketches, color palettes, typography samples.',
                  style: TextStyle(color: AppColors.greyLight, fontSize: 15, height: 1.7),
                ),
                const SizedBox(height: 20),

                // Design journal card with image
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.cardBackground,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.cardBorder),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Image area - colorful gradient
                      Container(
                        height: 200,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFFFFC0CB), Color(0xFFFFD700), Color(0xFF98FB98), Color(0xFF87CEEB)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            // Decorative circles
                            Positioned(top: 20, left: 30, child: Container(width: 60, height: 60, decoration: const BoxDecoration(color: Color(0xFFF24E1E), shape: BoxShape.circle))),
                            Positioned(bottom: 20, right: 40, child: Container(width: 80, height: 80, decoration: const BoxDecoration(color: Color(0xFF0ACF83), shape: BoxShape.circle))),
                            Positioned(top: 40, right: 80, child: Container(width: 45, height: 45, decoration: const BoxDecoration(color: Color(0xFFA259FF), shape: BoxShape.circle))),
                            const Icon(Icons.menu_book, color: Colors.white, size: 48),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Design Journal', style: TextStyle(color: AppColors.white, fontSize: 18, fontWeight: FontWeight.w700)),
                            const SizedBox(height: 8),
                            const Text('Document what inspires you. Save screenshots, write notes, and build your visual vocabulary every day.', style: TextStyle(color: AppColors.greyLight, fontSize: 14, height: 1.5)),
                            const SizedBox(height: 16),
                            Wrap(spacing: 8, runSpacing: 8, children: [
                              _journalLink('ADPList', Icons.people),
                              _journalLink('Dribbble', Icons.brush),
                              _journalLink('Behance', Icons.grid_view),
                              _journalLink('Awwwards', Icons.emoji_events),
                            ]),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),

                // ── Colorful character illustrations row ──────────────────────
                Row(
                  children: [
                    IllustrationCard(color: const Color(0xFFFFF3E0), emoji: '🧑‍💻', label: 'Researcher'),
                    const SizedBox(width: 12),
                    IllustrationCard(color: const Color(0xFFE8F5E9), emoji: '🎨', label: 'Visual Designer'),
                    const SizedBox(width: 12),
                    IllustrationCard(color: const Color(0xFFE3F2FD), emoji: '📐', label: 'UX Designer'),
                    const SizedBox(width: 12),
                    IllustrationCard(color: const Color(0xFFF3E5F5), emoji: '🤝', label: 'Product Lead'),
                  ],
                ),
                const SizedBox(height: 48),

                // ── Prev / Next ───────────────────────────────────────────────
                const PrevNextBar(
                  prevLabel: '« 02 – UX Fundamentals',
                  nextLabel: '2.2 Your Career »',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _journalLink(String label, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.coralDim,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.coral.withAlpha(80)),
      ),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        Icon(icon, color: AppColors.coral, size: 14),
        const SizedBox(width: 6),
        Text(label, style: const TextStyle(color: AppColors.coral, fontSize: 13, fontWeight: FontWeight.w600)),
      ]),
    );
  }
}

class SuccessCriteriaBox extends StatelessWidget {
  final Color coral;
  final VoidCallback onDone;

  const SuccessCriteriaBox({super.key, required this.coral, required this.onDone});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: coral.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: coral.withValues(alpha: 0.4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.flag_rounded, color: coral, size: 20),
              const SizedBox(width: 10),
              Text(
                'SUCCESS CRITERIA',
                style: TextStyle(
                  color: coral,
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.0,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            'By the end of this checkpoint, you should be able to identify the core components of the "Way of the Designer" and explain how a design-first approach differs from a technical-first approach.',
            style: TextStyle(
              color: AppColors.white,
              fontSize: 16,
              height: 1.6,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: onDone,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.white,
              foregroundColor: Colors.black,
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            child: const Text(
              'Mark as done',
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}

class IllustrationCard extends StatelessWidget {
  final Color color;
  final String emoji;
  final String label;
  const IllustrationCard({super.key, required this.color, required this.emoji, required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(12)),
        child: Column(children: [
          Text(emoji, style: const TextStyle(fontSize: 36)),
          const SizedBox(height: 8),
          Text(label, textAlign: TextAlign.center, style: const TextStyle(color: Colors.black87, fontSize: 13, fontWeight: FontWeight.w600)),
        ]),
      ),
    );
  }
}

class UXHierarchyTree extends StatelessWidget {
  const UXHierarchyTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _treeNode('UX Design', AppColors.coral, Colors.white, isRoot: true),
        const SizedBox(height: 8),
        Container(width: 2, height: 20, color: AppColors.cardBorder),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _branchNode('Product\nDesign', const Color(0xFF7B2D8B)),
            _branchNode('Graphic\nDesign', const Color(0xFF1565C0)),
            _branchNode('Interaction\nDesign', const Color(0xFF2E7D32)),
            _branchNode('Motion\nDesign', const Color(0xFF4A148C)),
          ],
        ),
      ],
    );
  }

  Widget _treeNode(String label, Color bg, Color fg, {bool isRoot = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Text(label, style: TextStyle(color: fg, fontSize: isRoot ? 16 : 14, fontWeight: FontWeight.w700)),
    );
  }

  Widget _branchNode(String label, Color color) {
    return Column(
      children: [
        Container(width: 2, height: 20, color: AppColors.cardBorder),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(label, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600)),
        ),
      ],
    );
  }
}

class DonutChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final cy = size.height / 2;
    final outerR = size.width / 2;
    final innerR = outerR * 0.6;

    final segments = [
      (0.35, const Color(0xFFE85D75)),
      (0.25, const Color(0xFF00C853)),
      (0.20, const Color(0xFF2196F3)),
      (0.20, const Color(0xFFFFC107)),
    ];

    double startAngle = -1.5708;
    final paint = Paint()..style = PaintingStyle.stroke..strokeWidth = outerR - innerR;

    for (final seg in segments) {
      paint.color = seg.$2;
      canvas.drawArc(
        Rect.fromCircle(center: Offset(cx, cy), radius: (outerR + innerR) / 2),
        startAngle,
        seg.$1 * 6.2832,
        false,
        paint,
      );
      startAngle += seg.$1 * 6.2832 + 0.04;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class BlobIllustrationPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final blobs = [
      (Offset(40, 40), 38.0, const Color(0xFFFFC0CB)),
      (Offset(100, 30), 28.0, const Color(0xFF87CEEB)),
      (Offset(120, 90), 36.0, const Color(0xFF98FB98)),
      (Offset(50, 110), 32.0, const Color(0xFFFFD700)),
      (Offset(80, 70), 24.0, const Color(0xFFDDA0DD)),
    ];
    for (final b in blobs) {
      canvas.drawCircle(b.$1, b.$2, Paint()..color = b.$3);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

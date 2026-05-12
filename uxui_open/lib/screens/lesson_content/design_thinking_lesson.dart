import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/breadcrumb_bar.dart';
import '../../widgets/lesson_widgets.dart';

class DesignThinkingLesson extends StatelessWidget {
  final bool sidebarCollapsed;
  final VoidCallback onExpandSidebar;

  const DesignThinkingLesson({
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
            BreadcrumbItem(label: '2.3 Design Thinking ⭐', isLast: true),
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
                  '2.3 Design Thinking ⭐',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -1.0,
                  ),
                ),
                const SizedBox(height: 24),

                // ── Success Criteria (Green Theme) ───────────────────────────
                _SuccessCriteriaBox(onDone: () {}),
                const SizedBox(height: 32),

                // ── Body Section ─────────────────────────────────────────────
                const Text(
                  'Design Thinking is a human-centered approach to innovation that draws from the designer\'s toolkit to integrate the needs of people, the possibilities of technology, and the requirements for business success.',
                  style: TextStyle(color: AppColors.greyLight, fontSize: 16, height: 1.7),
                ),
                const SizedBox(height: 16),
                const Text(
                  'It\'s not just about aesthetics; it\'s a methodology for solving complex problems. By focusing on empathy and iteration, we can create solutions that truly resonate with users.',
                  style: TextStyle(color: AppColors.greyLight, fontSize: 16, height: 1.7),
                ),
                const SizedBox(height: 32),

                // ── Design Thinking Process Diagram ──────────────────────────
                const Text(
                  'The Design Thinking Process',
                  style: TextStyle(color: AppColors.white, fontSize: 22, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 24),
                const DesignThinkingDiagram(),
                const SizedBox(height: 32),

                // ── Step 1: Empathize ────────────────────────────────────────
                const Text(
                  'Step 1: Empathize',
                  style: TextStyle(color: AppColors.white, fontSize: 22, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 16),
                const Text(
                  'The first stage of the process is to gain an empathetic understanding of the problem you are trying to solve. This involves consulting experts, observing, engaging and empathizing with people to understand their experiences and motivations.',
                  style: TextStyle(color: AppColors.greyLight, fontSize: 16, height: 1.7),
                ),
                const SizedBox(height: 16),
                buildBulletPoint('Conduct user interviews to gather insights'),
                buildBulletPoint('Create empathy maps to visualize user feelings'),
                buildBulletPoint('Observe users in their natural environment'),
                const SizedBox(height: 32),

                // ── Step 2: Define ──────────────────────────────────────────
                const Text(
                  'Step 2: Define',
                  style: TextStyle(color: AppColors.white, fontSize: 22, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 16),
                const Text(
                  'During the Define stage, you put together the information you have created and gathered during the Empathize stage. This is where you will analyze your observations and synthesize them in order to define the core problems.',
                  style: TextStyle(color: AppColors.greyLight, fontSize: 16, height: 1.7),
                ),
                const SizedBox(height: 24),
                // Placeholder for "Define" illustration
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    color: AppColors.cardBackground,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.cardBorder),
                  ),
                  child: const Center(
                    child: Icon(Icons.psychology, color: AppColors.green, size: 64),
                  ),
                ),
                const SizedBox(height: 32),

                // ── Step 3: Ideate ──────────────────────────────────────────
                const Text(
                  'Step 3: Ideate',
                  style: TextStyle(color: AppColors.white, fontSize: 22, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 16),
                const Text(
                  'During the third stage of the Design Thinking process, designers are ready to start generating ideas. You\'ve grown to understand your users and their needs in the Empathize stage, and you\'ve analyzed and synthesized your observations in the Define stage.',
                  style: TextStyle(color: AppColors.greyLight, fontSize: 16, height: 1.7),
                ),
                const SizedBox(height: 16),
                buildBulletPoint('Brainstorming sessions with the team'),
                buildBulletPoint('Worst Possible Idea technique'),
                buildBulletPoint('Mind mapping and sketching'),
                const SizedBox(height: 32),

                // ── Step 4: Prototype ───────────────────────────────────────
                const Text(
                  'Step 4: Prototype',
                  style: TextStyle(color: AppColors.white, fontSize: 22, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 16),
                const Text(
                  'The design team will now produce a number of inexpensive, scaled down versions of the product or specific features found within the product, so they can investigate the problem solutions generated in the previous stage.',
                  style: TextStyle(color: AppColors.greyLight, fontSize: 16, height: 1.7),
                ),
                const SizedBox(height: 24),
                // Prototype image placeholder
                Container(
                  width: double.infinity,
                  height: 240,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF0F0F0),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.dashboard_customize, color: Colors.grey[800], size: 64),
                        const SizedBox(height: 12),
                        Text('Lo-Fi Prototyping', style: TextStyle(color: Colors.grey[800], fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 32),

                // ── Step 5: Test ────────────────────────────────────────────
                const Text(
                  'Step 5: Test',
                  style: TextStyle(color: AppColors.white, fontSize: 22, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Designers or evaluators rigorously test the complete product using the best solutions identified during the prototyping phase. This is the final stage of the 5 stage-model, but in an iterative process, the results generated during the testing phase are often used to re-define one or more problems.',
                  style: TextStyle(color: AppColors.greyLight, fontSize: 16, height: 1.7),
                ),
                const SizedBox(height: 32),

                // ── Iterative Process ────────────────────────────────────────
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(28),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF1B3A2A), Color(0xFF0D1F16)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.green.withAlpha(50)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Non-Linear and Iterative',
                        style: TextStyle(color: AppColors.green, fontSize: 20, fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'It is important to note that the five stages are not always sequential — they do not have to follow any specific order and they can often occur in parallel and be repeated iteratively. As such, the stages should be understood as different modes that contribute to a project, rather than sequential steps.',
                        style: TextStyle(color: Colors.white70, fontSize: 15, height: 1.6),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 48),

                // ── Mark as Done & Prev/Next ─────────────────────────────────
                const PrevNextBar(
                  prevLabel: '« 2.2 Your Career',
                  nextLabel: '2.4 Understanding Users »',
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _SuccessCriteriaBox extends StatelessWidget {
  final VoidCallback onDone;
  const _SuccessCriteriaBox({required this.onDone});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.greenDim.withAlpha(40),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.green.withAlpha(100)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.flag_rounded, color: AppColors.green, size: 20),
              SizedBox(width: 10),
              Text(
                'SUCCESS CRITERIA',
                style: TextStyle(color: AppColors.green, fontSize: 14, fontWeight: FontWeight.w800, letterSpacing: 1.0),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            'By the end of this checkpoint, you should be able to identify the 5 stages of the Design Thinking process and explain why empathy is the foundation of user-centered design.',
            style: TextStyle(color: AppColors.white, fontSize: 16, height: 1.6, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: onDone,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.green,
              foregroundColor: Colors.black,
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            child: const Text('Mark as done', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 14)),
          ),
        ],
      ),
    );
  }
}

class DesignThinkingDiagram extends StatelessWidget {
  const DesignThinkingDiagram({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              const Text(
                'IDEATE',
                style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w900, letterSpacing: 1.0),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _hexagon('Empathize', const Color(0xFFC5E1A5)),
                  _hexagon('Define', const Color(0xFFC5E1A5)),
                  _hexagon('Ideate', const Color(0xFF8BC34A)),
                  _hexagon('Prototype', const Color(0xFFC5E1A5)),
                  _hexagon('Test', const Color(0xFFC5E1A5)),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'ITERATE',
                style: TextStyle(color: Colors.black54, fontSize: 12, fontWeight: FontWeight.w700),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _hexagon(String label, Color color) {
    return Column(
      children: [
        CustomPaint(
          size: const Size(60, 60),
          painter: HexagonPainter(color: color),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(color: Colors.black, fontSize: 11, fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}

class HexagonPainter extends CustomPainter {
  final Color color;
  HexagonPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color..style = PaintingStyle.fill;
    final path = Path();
    final w = size.width;
    final h = size.height;
    path.moveTo(w * 0.5, 0);
    path.lineTo(w, h * 0.25);
    path.lineTo(w, h * 0.75);
    path.lineTo(w * 0.5, h);
    path.lineTo(0, h * 0.75);
    path.lineTo(0, h * 0.25);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../../theme/app_theme.dart';
import '../../widgets/breadcrumb_bar.dart';
import '../../widgets/lesson_widgets.dart';

// ── Palette ────────────────────────────────────────────────────────────────
const Color kBg = Color(0xFF0F0F11);
const Color kCardBg = Color(0xFF1C1C1E);
const Color kWhite = Color(0xFFFFFFFF);
const Color kDark = Color(0xFFFFFFFF);
const Color kBody = Color(0xFFB3B3B3);
const Color kSub = Color(0xFF888888);
const Color kBorder = Color(0xFF333333);
const Color kOlive = Color(0xFF9DB842);
const Color kOliveBg = Color(0xFF262C18);
const Color kOrange = Color(0xFFE87F3A);
const Color kOrangeBg = Color(0xFF3D2111);
const Color kBlue = Color(0xFF5BA3E8);
const Color kBlueBg = Color(0xFF13283D);
const Color kTeal = Color(0xFF4AC4B2);
const Color kTealBg = Color(0xFF133630);
const Color kPurple = Color(0xFFB181F2);
const Color kPurpleBg = Color(0xFF2D1B42);
const Color kYellow = Color(0xFFFFD12B);
const Color kYellowBg = Color(0xFF3D320A);
const Color kNavBar = Color(0xFF1C1C1E);
const Color kGreen = Color(0xFF39A86A);

// ── Root ──────────────────────────────────────────────────────────────────
class DesignThinkingLesson extends StatelessWidget {
  final bool sidebarCollapsed;
  final VoidCallback onExpandSidebar;
  final ValueChanged<String> onLessonTap;

  const DesignThinkingLesson({
    super.key,
    required this.sidebarCollapsed,
    required this.onExpandSidebar,
    required this.onLessonTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBg,
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(36, 28, 36, 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BreadcrumbBar(
              sidebarCollapsed: sidebarCollapsed,
              onExpandSidebar: onExpandSidebar,
              items: const [
                BreadcrumbItem(label: '02 – UX Fundamentals'),
                BreadcrumbItem(label: '2.3 Design Thinking', isLast: true),
              ],
            ),
            _PageHeader(),
            const SizedBox(height: 16),
            _LearningObjective(),
            const SizedBox(height: 16),
            _NoteBox(),
            const SizedBox(height: 20),
            _IntroText(),
            const SizedBox(height: 24),
            _KeyTermsSection(),
            const SizedBox(height: 28),
            _DesignProcessSection(),
            const SizedBox(height: 28),
            _WhatIsDesignThinkingSection(),
            const SizedBox(height: 28),
            _FiveStepsOverview(),
            const SizedBox(height: 32),
            _Step1Empathize(),
            const SizedBox(height: 32),
            _Step2Define(),
            const SizedBox(height: 32),
            _Step3Ideate(),
            const SizedBox(height: 32),
            _Step4Prototype(),
            const SizedBox(height: 32),
            _Step5Test(),
            const SizedBox(height: 32),
            _SummarySection(),
            const SizedBox(height: 32),
            _AssignmentSection(),
            const SizedBox(height: 48),
            PrevNextBar(
              prevLabel: '« 2.2 Your Career',
              nextLabel: '2.4 Understanding Users »',
              onPrev: () => onLessonTap('2.2 Your Career'),
              onNext: () => onLessonTap('2.4 Understanding Users'),
            ),
          ],
        ),
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════════
// PAGE HEADER
// ══════════════════════════════════════════════════════════════════
class _PageHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Text('2.3 Design Thinking ⭐',
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: kDark,
                  height: 1.2)),
        ),
        ElevatedButton.icon(
          onPressed: () => Navigator.pop(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: kOlive,
            foregroundColor: kWhite,
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          icon: const Icon(Icons.dashboard_outlined, size: 14),
          label: const Text('View Dashboard', style: TextStyle(fontSize: 12)),
        ),
      ],
    );
  }
}

// ══════════════════════════════════════════════════════════════════
// LEARNING OBJECTIVE
// ══════════════════════════════════════════════════════════════════
class _LearningObjective extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: kBlueBg,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: kBlue.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Learning objective',
              style: TextStyle(
                  fontSize: 13, fontWeight: FontWeight.w700, color: kBlue)),
          SizedBox(height: 6),
          Text(
            'By the end of this checkpoint, you will be able to define and explain the design process and advocate for the importance of empathy in design. You will demonstrate an initial ability to empathize with a user by producing two empathy maps.',
            style: TextStyle(fontSize: 12, color: kBody, height: 1.55),
          ),
        ],
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════════
// NOTE BOX
// ══════════════════════════════════════════════════════════════════
class _NoteBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: kYellowBg,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: kYellow.withOpacity(0.5)),
      ),
      child: Row(
        children: [
          const Icon(Icons.info_outline, size: 16, color: Color(0xFFB8860B)),
          const SizedBox(width: 8),
          Expanded(
            child: RichText(
              text: const TextSpan(
                style: TextStyle(fontSize: 12, color: kBody),
                children: [
                  TextSpan(
                      text: 'note\n',
                      style: TextStyle(fontWeight: FontWeight.w700)),
                  TextSpan(text: 'This section includes an Assignment ⭐'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════════
// INTRO TEXT
// ══════════════════════════════════════════════════════════════════
class _IntroText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'In this checkpoint, you will analyze the design thinking process, which refers to the cognitive, strategic, and practical processes that go into developing design concepts.',
          style: TextStyle(fontSize: 13, color: kBody, height: 1.6),
        ),
        SizedBox(height: 10),
        Text(
          'You will explore the process, focusing on the key element of empathy. As you walk through the design process, you will be introduced to many new terms and ideas. The purpose of this checkpoint is to give you an overview of a very complex process. Then, when you learn how to do things later, you will be better equipped to understand how it all relates to the bigger picture. For now, focus on trying to understand the overall flow.',
          style: TextStyle(fontSize: 13, color: kBody, height: 1.6),
        ),
        SizedBox(height: 10),
        Text(
          "At the end of this checkpoint, you'll complete an assignment creating two empathy maps for different user personas, representing your first deliverable as a designer!",
          style: TextStyle(fontSize: 13, color: kBody, height: 1.6),
        ),
      ],
    );
  }
}

// ══════════════════════════════════════════════════════════════════
// KEY TERMS
// ══════════════════════════════════════════════════════════════════
class _KeyTermsSection extends StatelessWidget {
  final _terms = const [
    'Design thinking',
    'Deliverables',
    'Artifacts',
    'Empathy',
    'Persona',
    'Empathy map',
    'Quantitative survey',
    'Problem statement',
    'Competitive analysis report',
  ];

  @override
  Widget build(BuildContext context) {
    return _ContentCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _H2('Key terms'),
          const SizedBox(height: 10),
          ..._terms.map((t) => _BulletItem(t)),
        ],
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════════
// DESIGN THINKING PROCESS DIAGRAM
// ══════════════════════════════════════════════════════════════════
class _DesignProcessSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _H2('The design thinking process'),
        const SizedBox(height: 14),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: kOliveBg,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              // Hexagons row
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    _HexStep('Empathize', kOlive),
                    _HexArrow(),
                    _HexStep('Define', kOlive),
                    _HexArrow(),
                    _HexStep('Ideate', kOlive),
                    _HexArrow(),
                    _HexStep('Prototype', kOlive),
                    _HexArrow(),
                    _HexStep('Test', kOlive),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // Curved back arrow label
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                decoration: BoxDecoration(
                  color: kOlive.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: kOlive.withOpacity(0.35)),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.refresh, size: 12, color: kOlive),
                    SizedBox(width: 6),
                    Text('Iterative — steps can be repeated in any order',
                        style: TextStyle(
                            fontSize: 10,
                            color: kOlive,
                            fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _HexStep extends StatelessWidget {
  final String label;
  final Color color;
  const _HexStep(this.label, this.color);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 68,
      height: 76,
      child: CustomPaint(
        painter: _HexPainter(color),
        child: Center(
          child: Text(label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: kWhite, fontSize: 9, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}

class _HexArrow extends StatelessWidget {
  const _HexArrow();
  @override
  Widget build(BuildContext context) =>
      const Icon(Icons.arrow_forward, size: 14, color: kOlive);
}

class _HexPainter extends CustomPainter {
  final Color color;
  const _HexPainter(this.color);
  @override
  void paint(Canvas canvas, Size size) {
    final p = Paint()..color = color;
    final path = Path();
    final cx = size.width / 2, cy = size.height / 2;
    final r = math.min(cx, cy) * 0.92;
    for (int i = 0; i < 6; i++) {
      final a = math.pi / 3 * i - math.pi / 6;
      final x = cx + r * math.cos(a), y = cy + r * math.sin(a);
      i == 0 ? path.moveTo(x, y) : path.lineTo(x, y);
    }
    path.close();
    canvas.drawPath(path, p);
  }

  @override
  bool shouldRepaint(covariant CustomPainter o) => false;
}

// ══════════════════════════════════════════════════════════════════
// WHAT IS DESIGN THINKING
// ══════════════════════════════════════════════════════════════════
class _WhatIsDesignThinkingSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _H2('What is design thinking?'),
        const SizedBox(height: 12),
        const Text(
          "In design thinking, a UX designer's goal is to understand the user, reframe their problems, and challenge assumptions. They also try to identify alternative design solutions based on the user and their needs. It's a way of thinking, ideating, and producing that includes hands-on methods.",
          style: TextStyle(fontSize: 13, color: kBody, height: 1.6),
        ),
        const SizedBox(height: 10),
        const Text(
          'Design thinking revolves around questioning, understanding, and researching the people the products or services are designed for. You can use this process to help with several key tasks:',
          style: TextStyle(fontSize: 13, color: kBody, height: 1.6),
        ),
        const SizedBox(height: 10),
        // Observing/Engaging/Reframing/Experimenting coloured pill chips
        _ObservingGrid(),
        const SizedBox(height: 14),
        _BulletItem(
            'Observing and developing empathy with your target audience.'),
        _BulletItem(
            'Engaging in the process of questioning: questioning the problem, questioning the assumptions, and questioning the implications.'),
        _BulletItem(
            'Reframing design problems in a human-centric way, so that you ideate with an open mind and adopt a hands-on approach in prototyping and testing.'),
        _BulletItem(
            'Experimenting in fun and experiential ways, such as sketching, prototyping, testing, and trying out concepts and ideas.'),
      ],
    );
  }
}

class _ObservingGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = [
      ('● Observing', kOlive, kOliveBg),
      ('● Engaging', kOrange, kOrangeBg),
      ('● Reframing', kBlue, kBlueBg),
      ('● Experimenting', kPurple, kPurpleBg),
    ];
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: items
          .map((e) => Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                    color: e.$3,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: e.$2.withOpacity(0.4))),
                child: Text(e.$1,
                    style: TextStyle(
                        fontSize: 12,
                        color: e.$2,
                        fontWeight: FontWeight.w600)),
              ))
          .toList(),
    );
  }
}

// ══════════════════════════════════════════════════════════════════
// FIVE STEPS OVERVIEW
// ══════════════════════════════════════════════════════════════════
class _FiveStepsOverview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final steps = [
      (
        'Empathize',
        kOrange,
        'Fully understand, relate to, and share another person\'s expressions, needs, and motivations.'
      ),
      (
        'Define',
        kBlue,
        'Analyze and synthesize your observations in order to identify the core problems that you\'ve uncovered in a human-centered way.'
      ),
      (
        'Ideate',
        kPurple,
        'Generate ideas, including out-of-the-box and creative, unconventional solutions to the problem identified in earlier stages.'
      ),
      (
        'Prototype',
        kTeal,
        'Develop an inexpensive, scaled-down version of a product to be shared with users.'
      ),
      (
        'Test',
        kGreen,
        'Investigate and observe users interacting with the prototype, and adjust or iterate based on user feedback.'
      ),
    ];

    return _ContentCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
              'The five steps for the design thinking process are as follows:',
              style: TextStyle(
                  fontSize: 13, color: kBody, fontWeight: FontWeight.w600)),
          const SizedBox(height: 12),
          ...steps.asMap().entries.map(
              (e) => _StepRow(e.key + 1, e.value.$1, e.value.$2, e.value.$3)),
        ],
      ),
    );
  }
}

class _StepRow extends StatelessWidget {
  final int num;
  final String name, desc;
  final Color color;
  const _StepRow(this.num, this.name, this.color, this.desc);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            alignment: Alignment.center,
            child: Text('$num',
                style: const TextStyle(
                    color: kWhite, fontSize: 11, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: RichText(
              text: TextSpan(
                style:
                    const TextStyle(fontSize: 12, color: kBody, height: 1.55),
                children: [
                  TextSpan(
                      text: '$name: ',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, color: color)),
                  TextSpan(text: desc),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════════
// STEP 1: EMPATHIZE
// ══════════════════════════════════════════════════════════════════
class _Step1Empathize extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _StepHeader(1, 'Empathize', kOrange, kOrangeBg),
        const SizedBox(height: 16),
        const Text(
          'Empathize is perhaps the most crucial and most often overlooked stage in design. In this checkpoint, you\'ll focus mostly on this stage. Later in this program, you\'ll explore the other stages in more detail.',
          style: TextStyle(fontSize: 13, color: kBody, height: 1.6),
        ),
        const SizedBox(height: 20),
        _H3('What exactly is empathy?'),
        const SizedBox(height: 8),
        const Text(
          'Empathy is the ability to fully understand, mirror, then share another person\'s expressions, needs, and motivations. In UX, empathy enables the designer to understand not only the users\' immediate frustrations but also their hopes, fears, abilities, limitations, reasoning, and goals.',
          style: TextStyle(fontSize: 13, color: kBody, height: 1.6),
        ),
        const SizedBox(height: 8),
        const Text(
          'Empathy is one of the many soft skills that a great UX designer should have. Empathizing with users is key to understanding how to solve their problems—and ultimately, to building better products based around usable solutions.',
          style: TextStyle(fontSize: 13, color: kBody, height: 1.6),
        ),
        const SizedBox(height: 8),
        const Text(
          'Empathy helps designers to understand and interpret people\'s emotional and physical needs. Empathic research is primarily concerned with facts about people, their motivations, inspirations, and thoughts.',
          style: TextStyle(fontSize: 13, color: kBody, height: 1.6),
        ),
        const SizedBox(height: 20),
        _H3('Empathy is not pity or sympathy'),
        const SizedBox(height: 8),
        const Text(
          'Empathy requires people to deeply experience what others experience; the same is not necessarily true of sympathy. Sympathy is often associated with a sense of detachment and superiority; when people sympathize, they tend to feel pity and sorrow for another person.',
          style: TextStyle(fontSize: 13, color: kBody, height: 1.6),
        ),
        const SizedBox(height: 8),
        const Text(
          'Sympathy is not just useless in the design thinking process—it can actually be detrimental to good design. Good, user-centered designers are concerned with understanding the people they are designing solutions for, rather than judging them or projecting their own emotions onto their experience.',
          style: TextStyle(fontSize: 13, color: kBody, height: 1.6),
        ),
        const SizedBox(height: 20),
        _H3("Users don't always tell you what they need"),
        const SizedBox(height: 8),
        const Text(
          'As a user-centered designer, you need to develop intuition, imagination, emotional sensitivity, and creativity. With these skills, you can extract the right kinds of insights so as to make more meaningful and usable products. People do not always convey all the details or communicate what they need in a standardized way. You\'ll need to use empathy in order to really understand people.',
          style: TextStyle(fontSize: 13, color: kBody, height: 1.6),
        ),
        const SizedBox(height: 20),
        _H3('Empathy is crucial to business success'),
        const SizedBox(height: 12),
        _VennDiagram(),
        const SizedBox(height: 12),
        const Text(
          'There are three key parameters that define a successful product or service: desirability, feasibility, and viability. Considering these parameters is an important part of empathizing with your users.',
          style: TextStyle(fontSize: 13, color: kBody, height: 1.6),
        ),
        const SizedBox(height: 8),
        const Text(
          'To be successful, a product or service must be technically feasible to create and maintain. It must turn a profit or offer other benefits so that it is viable from a business perspective. And users need to desire it.',
          style: TextStyle(fontSize: 13, color: kBody, height: 1.6),
        ),
        const SizedBox(height: 8),
        const Text(
          'For example, Google Glass was a failure because users didn\'t like the experience. By contrast, the iPod was very successful at not only providing a technological solution but also providing a completely desirable and profitable experience for the user.',
          style: TextStyle(fontSize: 13, color: kBody, height: 1.6),
        ),
        const SizedBox(height: 24),
        _H3('Examples of empathize deliverables'),
        const SizedBox(height: 16),
        _DeliverableCard(
          title: 'Persona',
          color: kOrange,
          icon: Icons.person_outline,
          body:
              'A persona is a fictional user\'s profile, which is used to communicate and summarize user research. Each persona has defined goals and characteristics, which are representative of the needs of a larger group of users. Designers use personas to represent many users at once because designing with an individual composite "person" is easier than trying to design for thousands of different people.',
        ),
        const SizedBox(height: 12),
        _PersonaCards(),
        const SizedBox(height: 16),
        _DeliverableCard(
          title: 'Empathy map',
          color: kOrange,
          icon: Icons.map_outlined,
          body:
              'An empathy map is a graphical tool used to help you imagine things from a user\'s perspective. It usually asks you to answer some questions from a user\'s perspective as they encounter a task: What do they see and hear? What do they think and feel? What do they say and do?',
        ),
        const SizedBox(height: 12),
        _EmpathyMapGraphic(),
        const SizedBox(height: 16),
        _DeliverableCard(
          title: 'Quantitative survey',
          color: kOrange,
          icon: Icons.bar_chart_outlined,
          body:
              'A quantitative survey contains objective questions used to gain detailed insights from respondents about a survey research topic. Results from these surveys are used to gather numerical data and determine statistical results, and the data can share insights about user behavior. Quantitative surveys are also useful for justifying decisions to stakeholders.',
        ),
      ],
    );
  }
}

// ══════════════════════════════════════════════════════════════════
// STEP 2: DEFINE
// ══════════════════════════════════════════════════════════════════
class _Step2Define extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _StepHeader(2, 'Define', kBlue, kBlueBg),
        const SizedBox(height: 16),
        const Text(
          'During the define stage, you connect the dots from the empathize stage. You analyze your observations and describe them so that you can define the core problems that you and your team have identified up to this point.',
          style: TextStyle(fontSize: 13, color: kBody, height: 1.6),
        ),
        const SizedBox(height: 20),
        _H3('Examples of define deliverables'),
        const SizedBox(height: 12),
        _DeliverableCard(
          title: 'Problem statement',
          color: kBlue,
          icon: Icons.lightbulb_outline,
          body:
              'In this stage, you should seek to define the problem in a formal problem statement. The final problem statement is a simple but effective way to bring focus to the insights that you\'ve uncovered with your empathy maps. Ultimately, when you\'re making decisions, you must always return to the question, "Does this solution solve the problem statement?"',
        ),
        const SizedBox(height: 12),
        _HMWWidget(),
        const SizedBox(height: 12),
        _DeliverableCard(
          title: 'Competitive analysis report',
          color: kBlue,
          icon: Icons.compare_outlined,
          body:
              "A competitive analysis report outlines the strengths and weaknesses of your competitors compared to those of your own business. Typically, it contains a description of your business's target market and details about the features of your product compared to your competitor's products.",
        ),
      ],
    );
  }
}

// ══════════════════════════════════════════════════════════════════
// STEP 3: IDEATE
// ══════════════════════════════════════════════════════════════════
class _Step3Ideate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _StepHeader(3, 'Ideate', kPurple, kPurpleBg),
        const SizedBox(height: 16),
        const Text(
          "Ideation is a fancy word for coming up with ideas. By this stage, you've built a solid foundation: you have a clear understanding of who your users are and what they need, what problem you are trying to solve, and what solutions exist out in the world already. Now you can finally start thinking about what you are going to make!",
          style: TextStyle(fontSize: 13, color: kBody, height: 1.6),
        ),
        const SizedBox(height: 20),
        _H3('Some ways to ideate'),
        const SizedBox(height: 12),
        _IdeateMethod(
          title: 'Brainstorming',
          color: kPurple,
          icon: Icons.bolt_outlined,
          body:
              'Most people are familiar with brainstorming. To get the most out of brainstorming, set a time limit. Try to focus on quantity over quality and write down as many ideas as you can think of. Do not worry about whether your ideas are practical, too expensive, or unrealistic. Just try to get down as many ideas as you can without judgment.',
        ),
        const SizedBox(height: 12),
        _BrainstormImage(),
        const SizedBox(height: 16),
        _IdeateMethod(
          title: 'Mind mapping',
          color: kPurple,
          icon: Icons.account_tree_outlined,
          body:
              'A mind map is a visual diagram that represents words, tasks, and ideas associated with a central keyword or idea. Begin with writing one word that summarizes the problem that you want to solve or the idea that you want to build on. Then, from that word, draw lines out and branch off into new words that relate to the core issue.',
        ),
        const SizedBox(height: 12),
        _MindMapGraphic(),
        const SizedBox(height: 20),
        _H3('Examples of ideate deliverables'),
        const SizedBox(height: 12),
        _DeliverableCard(
            title: 'Sketches',
            color: kPurple,
            icon: Icons.draw_outlined,
            body:
                'Sketching is a crucial skill in UX design. If you can sketch simple shapes—like rectangles, squares, circles, lines, and stick figures—then you can quickly communicate concepts and revise them on the fly.'),
        const SizedBox(height: 10),
        _DeliverableCard(
            title: 'User flow',
            color: kPurple,
            icon: Icons.account_tree,
            body:
                'A user flow is the path that a user typically takes on a website or app to complete a task. The flow leads from the entry point, through a series of steps, and toward a final action such as purchasing a product.'),
        const SizedBox(height: 10),
        _DeliverableCard(
            title: 'User stories',
            color: kPurple,
            icon: Icons.article_outlined,
            body:
                'A user story is a written description of how users will perform tasks on your website. Each one is a documentation of a sequence of steps, starting with a user\'s goal and ending when the goal is fulfilled.'),
        const SizedBox(height: 10),
        _DeliverableCard(
            title: 'Storyboards',
            color: kPurple,
            icon: Icons.movie_creation_outlined,
            body:
                'In UX, a storyboard is a tool that visually lays out and explores a user\'s experience with a product—similar to the storyboards that are used in movies. Storyboards provide context about how and why people use products.'),
        const SizedBox(height: 10),
        _DeliverableCard(
            title: 'Mood boards',
            color: kPurple,
            icon: Icons.palette_outlined,
            body:
                'Mood boards communicate the artistic direction of a project. They are created through a collection of images, fonts, interactions, features, icons, and UI elements.'),
      ],
    );
  }
}

// ══════════════════════════════════════════════════════════════════
// STEP 4: PROTOTYPE
// ══════════════════════════════════════════════════════════════════
class _Step4Prototype extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _StepHeader(4, 'Prototype', kTeal, kTealBg),
        const SizedBox(height: 16),
        const Text(
          'In this stage, the design team produces some inexpensive, scaled-down versions of the product. These prototypes are useful for investigating the design solutions generated in the previous stage. This stage helps the design team get a better idea of the challenges and constraints that are present.',
          style: TextStyle(fontSize: 13, color: kBody, height: 1.6),
        ),
        const SizedBox(height: 20),
        _H3('Examples of prototype deliverables'),
        const SizedBox(height: 12),
        _DeliverableCard(
            title: 'Wireframes',
            color: kTeal,
            icon: Icons.web_asset_outlined,
            body:
                'Think of a wireframe as a blueprint that provides the basic framework of a website. Wireframes are valuable because they include enough features to conceptualize what the product will look like and how it will function—without spending too much time on visual details like color and typography.'),
        const SizedBox(height: 10),
        _DeliverableCard(
            title: 'Prototypes',
            color: kTeal,
            icon: Icons.phone_iphone_outlined,
            body:
                'A prototype is a clickable series of connected mockups that simulates how the solution will work when it\'s built. Sometimes it is difficult to explain a concept to team members; a clickable prototype that functions like the real software can help with clarification.'),
      ],
    );
  }
}

// ══════════════════════════════════════════════════════════════════
// STEP 5: TEST
// ══════════════════════════════════════════════════════════════════
class _Step5Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _StepHeader(5, 'Test', kGreen, kTealBg),
        const SizedBox(height: 16),
        const Text(
          'In this stage, designers or evaluators go through the process of real-time testing. Although this can seem like the last stage before a product is sent over to the developers, design thinking is actually an iterative process. The results generated during the testing phase are often used to define pain points in a product\'s design.',
          style: TextStyle(fontSize: 13, color: kBody, height: 1.6),
        ),
        const SizedBox(height: 20),
        _H3('Examples of test deliverables'),
        const SizedBox(height: 12),
        _DeliverableCard(
            title: 'Usability report',
            color: kGreen,
            icon: Icons.assignment_outlined,
            body:
                'A usability report is a document that allows you to gain insight into user expectations and frustrations. It can be crucial in evaluating your product\'s success. It provides insight into user frustrations and behavior, which can provide feedback and improve the product.'),
        const SizedBox(height: 10),
        _DeliverableCard(
            title: 'Analytics report',
            color: kGreen,
            icon: Icons.analytics_outlined,
            body:
                "An analytics report is a custom report with dimensions and metrics that you decide. It's a good way to explore custom information and deeper targeted metrics about your product."),
      ],
    );
  }
}

// ══════════════════════════════════════════════════════════════════
// SUMMARY
// ══════════════════════════════════════════════════════════════════
class _SummarySection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _ContentCard(
      color: kOliveBg,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Summary',
              style: TextStyle(
                  fontSize: 17, fontWeight: FontWeight.bold, color: kOlive)),
          SizedBox(height: 10),
          Text(
            'In this checkpoint, you explored the design thinking process, which consists of the cognitive, strategic, and practical processes that go into developing design concepts.\n\nThroughout this checkpoint, you focused on the key element of empathy. Empathize is the first stage of the design thinking process, but designing with empathy is essential throughout all five steps of the process. Empathy is crucial to a human-centered design process because it helps design thinkers to set aside their own assumptions about the world in order to gain insight into their users and their needs.\n\nAs you learned, UX designers do a lot of different things on a daily basis. In this checkpoint, you also evaluated UX deliverables.',
            style: TextStyle(fontSize: 13, color: kBody, height: 1.6),
          ),
        ],
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════════
// ASSIGNMENT SECTION
// ══════════════════════════════════════════════════════════════════
class _AssignmentSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _ContentCard(
      color: kYellowBg,
      borderColor: kYellow.withOpacity(0.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.star, color: kYellow, size: 18),
              const SizedBox(width: 6),
              const Text('Assignment 3 ⭐',
                  style: TextStyle(
                      fontSize: 17, fontWeight: FontWeight.bold, color: kDark)),
            ],
          ),
          const SizedBox(height: 6),
          const Text('Empathy mapping, mind mapping, and brainstorming',
              style: TextStyle(
                  fontSize: 14, fontWeight: FontWeight.w600, color: kBody)),
          const SizedBox(height: 10),
          const Text(
            'This exercise will demonstrate the value of empathy mapping and understanding different users. For this activity, you are going to make two empathy maps for two personas. These personas represent different people who are purchasing a car.',
            style: TextStyle(fontSize: 13, color: kBody, height: 1.6),
          ),
          const SizedBox(height: 12),
          _PersonaBlock(
            name: 'Maria',
            age: '72',
            desc:
                'Retired woman with an upper-middle-class income. Sometimes cares for her three grandchildren, who are all under the age of eight.',
            color: kOrange,
          ),
          const SizedBox(height: 8),
          _PersonaBlock(
            name: 'Seth',
            age: '23',
            desc:
                'Working-class student who works full time. Attends night classes to work toward his associate\'s degree in music studies.',
            color: kBlue,
          ),
          const SizedBox(height: 14),
          const Text(
            'Fill out the sections and imagine the perspective of each user. Include at least 5–10 items in each box.',
            style: TextStyle(fontSize: 12, color: kBody, height: 1.5),
          ),
          const SizedBox(height: 6),
          ...[
            'What would their fears be? Their concerns?',
            'What would they want as part of their experience?',
            'What would they try to avoid based on their individual sets of circumstances?',
            'How would each user prefer to research their choices? Online? In person?',
            'Which persona is more likely to care about the stereo system? About safety and security?',
          ].map((q) => _BulletItem(q)),
          const SizedBox(height: 14),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: kCardBg,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: kBorder),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Submission',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: kDark)),
                SizedBox(height: 6),
                Text(
                  'Share your excel sheets with us. Paste your link in the slack channel #uxui-assignment03. Don\'t forget to save them in your design journal.',
                  style: TextStyle(fontSize: 12, color: kBody, height: 1.5),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PersonaBlock extends StatelessWidget {
  final String name, age, desc;
  final Color color;
  const _PersonaBlock(
      {required this.name,
      required this.age,
      required this.desc,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.08),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.25)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
              backgroundColor: color,
              radius: 16,
              child: Text(name[0],
                  style: const TextStyle(
                      color: kWhite,
                      fontWeight: FontWeight.bold,
                      fontSize: 14))),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('$name, $age',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: color)),
                const SizedBox(height: 3),
                Text(desc,
                    style: const TextStyle(
                        fontSize: 12, color: kBody, height: 1.45)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════════
// VISUAL COMPONENTS
// ══════════════════════════════════════════════════════════════════

// Venn Diagram
class _VennDiagram extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 220,
      decoration: BoxDecoration(
        color: kCardBg,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: kBorder),
      ),
      child: CustomPaint(painter: _VennPainter()),
    );
  }
}

class _VennPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2, cy = size.height / 2 + 10;
    const r = 60.0, off = 30.0;

    final top = Offset(cx, cy - off - 4);
    final bl = Offset(cx - off, cy + off + 6);
    final br = Offset(cx + off, cy + off + 6);

    void circle(Offset c, Color col) {
      canvas.drawCircle(c, r, Paint()..color = col.withOpacity(0.22));
      canvas.drawCircle(
          c,
          r,
          Paint()
            ..color = col.withOpacity(0.65)
            ..style = PaintingStyle.stroke
            ..strokeWidth = 1.8);
    }

    circle(top, kBlue);
    circle(bl, kOrange);
    circle(br, kOlive);

    // Centre
    canvas.drawCircle(
        Offset(cx, cy + 6), 20, Paint()..color = const Color(0xFF2D5A3D));

    void lbl(String t, Offset pos, Color c, {double size = 9.5}) {
      final tp = TextPainter(
        text: TextSpan(
            text: t,
            style: TextStyle(
                fontSize: size, color: c, fontWeight: FontWeight.bold)),
        textDirection: TextDirection.ltr,
      )..layout();
      tp.paint(canvas, pos - Offset(tp.width / 2, tp.height / 2));
    }

    lbl('Desirability', top - Offset(0, r + 10), kBlue);
    lbl('Feasibility', bl + Offset(-r * 0.4, r * 0.65), kOrange);
    lbl('Viability', br + Offset(r * 0.4, r * 0.65), kOlive);
    lbl('Innovation', Offset(cx, cy + 6), kWhite, size: 8);
  }

  @override
  bool shouldRepaint(covariant CustomPainter o) => false;
}

// Persona Cards
class _PersonaCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cards = [
      ('Renter', kBlue, Icons.home_outlined),
      ('Buyer', Color(0xFF1A5276), Icons.shopping_bag_outlined),
      ('Realtor', kGreen, Icons.handshake_outlined),
      ('Owner', Color(0xFF6E2F0E), Icons.key_outlined),
    ];
    return Row(
      children: cards.map((c) {
        return Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 3),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: c.$2,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                CircleAvatar(
                    backgroundColor: Colors.white24,
                    radius: 14,
                    child: Icon(c.$3, color: kWhite, size: 14)),
                const SizedBox(height: 6),
                Text(c.$1,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: kWhite,
                        fontSize: 10,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

// Empathy Map Graphic
class _EmpathyMapGraphic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final quadrants = [
      ('THINK\n& FEEL', kBlueBg, kBlue),
      ('SEE', kOrangeBg, kOrange),
      ('SAY\n& DO', kTealBg, kTeal),
      ('HEAR', kPurpleBg, kPurple),
    ];
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: kBorder)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Column(
          children: [
            Row(
              children: quadrants
                  .sublist(0, 2)
                  .map((q) => Expanded(child: _EmpMapCell(q.$1, q.$2, q.$3)))
                  .toList(),
            ),
            Row(
              children: quadrants
                  .sublist(2, 4)
                  .map((q) => Expanded(child: _EmpMapCell(q.$1, q.$2, q.$3)))
                  .toList(),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              color: kYellowBg,
              width: double.infinity,
              alignment: Alignment.center,
              child: const Text('PAINS          USER         GAINS',
                  style: TextStyle(
                      fontSize: 10,
                      color: kDark,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1)),
            ),
          ],
        ),
      ),
    );
  }
}

class _EmpMapCell extends StatelessWidget {
  final String label;
  final Color bg, accent;
  const _EmpMapCell(this.label, this.bg, this.accent);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: bg,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(6),
      child: Text(label,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 10, fontWeight: FontWeight.bold, color: accent)),
    );
  }
}

// HMW Widget
class _HMWWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: kBlueBg,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: kBlue.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('How Might We (HMW)',
              style: TextStyle(
                  fontSize: 13, fontWeight: FontWeight.w700, color: kBlue)),
          const SizedBox(height: 10),
          Row(
            children: [
              _HMWPill('How', kBlue),
              const SizedBox(width: 6),
              _HMWPill('Might', kOrange),
              const SizedBox(width: 6),
              _HMWPill('We', kGreen),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            '"How Might We…" questions are short brainstorm launchers. They suggest a solution is possible and we can achieve it together.',
            style: TextStyle(fontSize: 11, color: kBody, height: 1.5),
          ),
        ],
      ),
    );
  }
}

class _HMWPill extends StatelessWidget {
  final String text;
  final Color color;
  const _HMWPill(this.text, this.color);
  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(20)),
        child: Text(text,
            style: const TextStyle(
                color: kWhite, fontWeight: FontWeight.bold, fontSize: 12)),
      );
}

// Brainstorm Image placeholder
class _BrainstormImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 110,
      decoration: BoxDecoration(
        color: const Color(0xFF2C3E2D),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.people, color: Colors.white38, size: 36),
          SizedBox(height: 6),
          Text('Team Brainstorm Session',
              style: TextStyle(color: Colors.white38, fontSize: 11)),
        ],
      ),
    );
  }
}

// Mind Map Graphic
class _MindMapGraphic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 130,
      decoration: BoxDecoration(
        color: const Color(0xFFF8F4EC),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: kBorder),
      ),
      child: CustomPaint(painter: _MindMapPainter()),
    );
  }
}

class _MindMapPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2, cy = size.height / 2;
    final linePaint = Paint()
      ..color = kSub.withOpacity(0.5)
      ..strokeWidth = 1.2;
    final nodes = [
      Offset(cx, cy - 42),
      Offset(cx + 60, cy - 18),
      Offset(cx + 55, cy + 28),
      Offset(cx, cy + 44),
      Offset(cx - 55, cy + 28),
      Offset(cx - 60, cy - 18),
    ];
    for (final n in nodes) {
      canvas.drawLine(Offset(cx, cy), n, linePaint);
    }
    // Centre
    canvas.drawCircle(Offset(cx, cy), 20, Paint()..color = kDark);
    final cp = TextPainter(
      text: const TextSpan(
          text: 'Problem',
          style: TextStyle(
              fontSize: 7.5, color: kWhite, fontWeight: FontWeight.bold)),
      textDirection: TextDirection.ltr,
    )..layout();
    cp.paint(canvas, Offset(cx - cp.width / 2, cy - cp.height / 2));

    // Node labels
    final labels = [
      'Users',
      'Goals',
      'Pain\nPoints',
      'Context',
      'Needs',
      'Ideas'
    ];
    final colors = [kBlue, kOrange, kPurple, kTeal, kGreen, kOlive];
    for (int i = 0; i < nodes.length; i++) {
      canvas.drawCircle(nodes[i], 13, Paint()..color = colors[i]);
      final tp = TextPainter(
        text: TextSpan(
            text: labels[i],
            style: const TextStyle(
                fontSize: 6.5, color: kWhite, fontWeight: FontWeight.bold)),
        textDirection: TextDirection.ltr,
      )..layout();
      tp.paint(canvas, nodes[i] - Offset(tp.width / 2, tp.height / 2));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter o) => false;
}

// ══════════════════════════════════════════════════════════════════
// REUSABLE WIDGETS
// ══════════════════════════════════════════════════════════════════

class _ContentCard extends StatelessWidget {
  final Widget child;
  final Color? color;
  final Color? borderColor;
  const _ContentCard({required this.child, this.color, this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color ?? kCardBg,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: borderColor ?? kBorder),
      ),
      child: child,
    );
  }
}

class _StepHeader extends StatelessWidget {
  final int num;
  final String name;
  final Color color, bg;
  const _StepHeader(this.num, this.name, this.color, this.bg);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            alignment: Alignment.center,
            child: Text('$num',
                style: const TextStyle(
                    color: kWhite, fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Step $num',
                  style: TextStyle(
                      fontSize: 11,
                      color: color,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5)),
              Text(name,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: color,
                      letterSpacing: -0.3)),
            ],
          ),
        ],
      ),
    );
  }
}

class _DeliverableCard extends StatelessWidget {
  final String title, body;
  final Color color;
  final IconData icon;
  const _DeliverableCard(
      {required this.title,
      required this.body,
      required this.color,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: kCardBg,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: kBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 16, color: color),
              const SizedBox(width: 8),
              Text(title,
                  style: TextStyle(
                      fontSize: 13, fontWeight: FontWeight.bold, color: color)),
            ],
          ),
          const SizedBox(height: 8),
          Text(body,
              style: const TextStyle(fontSize: 12, color: kBody, height: 1.55)),
        ],
      ),
    );
  }
}

class _IdeateMethod extends StatelessWidget {
  final String title, body;
  final Color color;
  final IconData icon;
  const _IdeateMethod(
      {required this.title,
      required this.body,
      required this.color,
      required this.icon});

  @override
  Widget build(BuildContext context) =>
      _DeliverableCard(title: title, body: body, color: color, icon: icon);
}

class _H2 extends StatelessWidget {
  final String text;
  const _H2(this.text);
  @override
  Widget build(BuildContext context) => Text(text,
      style: const TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, color: kDark));
}

class _H3 extends StatelessWidget {
  final String text;
  const _H3(this.text);
  @override
  Widget build(BuildContext context) => Text(text,
      style: const TextStyle(
          fontSize: 15, fontWeight: FontWeight.bold, color: kDark));
}

class _BulletItem extends StatelessWidget {
  final String text;
  const _BulletItem(this.text);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 5),
            child: CircleAvatar(radius: 3, backgroundColor: kBody),
          ),
          const SizedBox(width: 8),
          Expanded(
              child: Text(text,
                  style: const TextStyle(
                      fontSize: 12, color: kBody, height: 1.55))),
        ],
      ),
    );
  }
}

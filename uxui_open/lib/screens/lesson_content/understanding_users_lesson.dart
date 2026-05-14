import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../theme/app_theme.dart';

class UnderstandingUsersScreen extends StatelessWidget {
  final bool sidebarCollapsed;
  final VoidCallback onExpandSidebar;
  final ValueChanged<String> onLessonTap;

  const UnderstandingUsersScreen({
    super.key,
    required this.sidebarCollapsed,
    required this.onExpandSidebar,
    required this.onLessonTap,
  });

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.background,
      statusBarIconBrightness: Brightness.light,
    ));

    return Container(
      color: AppColors.background,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top bar with dashboard link
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '2.4 Understanding Users',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.white),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Text(
                        'VIEW DASHBOARD',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: AppColors.green,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Hero / subtitle section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    const Text(
                      'LEARNING OBJECTIVE',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: AppColors.grey,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'By the end of this checkpoint, you will be able to advocate for the value of user research. You will also be able to explain the history of human-centered design and describe how it applies to user research.',
                      style: TextStyle(
                          fontSize: 14, height: 1.4, color: AppColors.white),
                    ),
                    const SizedBox(height: 24),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.greenDim,
                        borderRadius: BorderRadius.circular(12),
                        border:
                            Border.all(color: AppColors.green.withOpacity(0.2)),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'In the previous checkpoint, you completed an empathy mapping project. You sought to understand users, as represented by two personas, and began thinking about solutions. In this checkpoint, you\'ll delve deeper into empathy and complete a design thinking challenge centered around social change.',
                            style: TextStyle(
                                fontSize: 14,
                                height: 1.4,
                                color: AppColors.white),
                          ),
                          SizedBox(height: 12),
                          Text(
                            'You will also look at the value of user research for understanding the user, and you\'ll take a tour of what a user researcher does in their career.',
                            style: TextStyle(
                                fontSize: 14,
                                height: 1.4,
                                color: AppColors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // Key terms section
              Container(
                color: AppColors.cardBackground,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Key terms',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.white),
                    ),
                    SizedBox(height: 12),
                    Wrap(
                      spacing: 24,
                      runSpacing: 8,
                      children: [
                        Text('• Human-centered design (HCD)',
                            style: TextStyle(
                                fontSize: 14, color: AppColors.greyLight)),
                        Text('• User research',
                            style: TextStyle(
                                fontSize: 14, color: AppColors.greyLight)),
                        Text('• Empathy',
                            style: TextStyle(
                                fontSize: 14, color: AppColors.greyLight)),
                        Text('• Empathy mapping',
                            style: TextStyle(
                                fontSize: 14, color: AppColors.greyLight)),
                      ],
                    ),
                  ],
                ),
              ),
              // Human-centered design heading
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Text(
                  'Human-centered design',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Human-centered design (HCD), which is also called user-centered design, is an approach to problem-solving that is commonly used in design frameworks. To create solutions, HCD uses the human perspective in all steps of the problem-solving process.',
                  style: TextStyle(
                      fontSize: 14, height: 1.4, color: AppColors.greyLight),
                ),
              ),
              const SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'How does HCD work in the real world? Typically, you and your team will observe a problem within a particular context, brainstorm and ideate, conceptualize, and develop a solution to implement.',
                  style: TextStyle(
                      fontSize: 14, height: 1.4, color: AppColors.greyLight),
                ),
              ),
              const SizedBox(height: 24),
              // Three phases of HCD
              Container(
                color: AppColors.cardBackground.withOpacity(0.5),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Three phases of HCD:',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.white),
                    ),
                    const SizedBox(height: 16),
                    _buildPhaseCard(
                      title: '1. Inspiration',
                      subtitle: 'I HAVE A DESIGN CHALLENGE.',
                      questions: [
                        'How do I get started?',
                        'How do I conduct an interview?',
                        'How do I stay human-centered?',
                      ],
                    ),
                    const SizedBox(height: 12),
                    _buildPhaseCard(
                      title: '2. Ideation',
                      subtitle: 'I HAVE AN OPPORTUNITY FOR DESIGN.',
                      questions: [
                        'How do I interpret what I\'ve learned?',
                        'How do I turn my insights into ideas?',
                        'How do I make a prototype?',
                      ],
                    ),
                    const SizedBox(height: 12),
                    _buildPhaseCard(
                      title: '3. Implementation',
                      subtitle: 'I HAVE AN INNOVATIVE SOLUTION.',
                      questions: [
                        'How do I make my concept real?',
                        'How do I assess if it\'s working?',
                        'How do I plan for sustainability?',
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // Overview with IDEO style
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Overview',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.white),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: _buildOverviewCard(
                            'INSPIRATION',
                            'I HAVE A DESIGN CHALLENGE.',
                            [
                              'How do I get started?',
                              'How do I conduct an interview?',
                              'How do I stay human-centered?',
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildOverviewCard(
                            'IDEATION',
                            'I HAVE AN OPPORTUNITY FOR DESIGN.',
                            [
                              'How do I interpret what I\'ve learned?',
                              'How do I turn my insights into ideas?',
                              'How do I make a prototype?',
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildOverviewCard(
                            'IMPLEMENTATION',
                            'I HAVE AN INNOVATIVE SOLUTION.',
                            [
                              'How do I make my concept real?',
                              'How do I assess if it\'s working?',
                              'How do I plan for sustainability?',
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // Description of stages
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildStageText(
                        '1. The inspiration stage requires research. In this stage, designers engage directly with the target audience to understand their biggest problems and pain points.'),
                    const SizedBox(height: 12),
                    _buildStageText(
                        '2. The ideation stage is a brainstorming session. It requires designers and researchers to create a long list and tweak it, take good ideas and make them better, and then refine and revise as necessary.'),
                    const SizedBox(height: 12),
                    _buildStageText(
                        '3. The implementation stage is the time to market the product. Using empathy, designers imagine themselves in their users\' shoes and market to them from that point of view.'),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // History of human-centered design
              Container(
                color: AppColors.cardBackground,
                padding: const EdgeInsets.all(16),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'History of human-centered design',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.white),
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Design theorist Horst Rittel defined the term wicked problems to describe complex problems that aren\'t easily solved. He asserted that problem-solving methods should be collaborative, adaptable, and centered on the complexities of human behavior.',
                      style: TextStyle(
                          fontSize: 14,
                          height: 1.4,
                          color: AppColors.greyLight),
                    ),
                  ],
                ),
              ),
              // IDEO.org banner
              Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.cardBackground,
                  border: Border.all(color: AppColors.cardBorder),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    const Text(
                      'Designing for access',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.white),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'IDEO.org is a nonprofit design studio. We design products and services alongside organizations that are committed to creating a more just and inclusive world.',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 14, color: AppColors.greyLight),
                    ),
                    const SizedBox(height: 16),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 10),
                        decoration: BoxDecoration(
                          color: AppColors.green,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text(
                          'SEE OUR WORK',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPhaseCard(
      {required String title,
      required String subtitle,
      required List<String> questions}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: AppColors.white)),
          const SizedBox(height: 4),
          Text(subtitle,
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                  color: AppColors.green)),
          const SizedBox(height: 8),
          ...questions.map((q) => Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Text('• $q',
                    style: const TextStyle(
                        fontSize: 13, color: AppColors.greyLight)),
              )),
        ],
      ),
    );
  }

  Widget _buildOverviewCard(
      String title, String subtitle, List<String> questions) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  color: AppColors.white)),
          const SizedBox(height: 4),
          Text(subtitle,
              style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: AppColors.green)),
          const SizedBox(height: 8),
          ...questions.map((q) => Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: Text('• $q',
                    style: const TextStyle(
                        fontSize: 11, color: AppColors.greyLight)),
              )),
        ],
      ),
    );
  }

  static const _buildStageText = _StageTextWidget.new;

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• ',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.green)),
          Expanded(
              child: Text(text,
                  style: const TextStyle(
                      fontSize: 14, color: AppColors.greyLight))),
        ],
      ),
    );
  }
}

class _StageTextWidget extends StatelessWidget {
  final String text;
  const _StageTextWidget(this.text);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(text,
          style: const TextStyle(
              fontSize: 14, height: 1.4, color: AppColors.greyLight)),
    );
  }
}

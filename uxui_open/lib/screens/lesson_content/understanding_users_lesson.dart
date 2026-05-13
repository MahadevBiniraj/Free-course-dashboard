import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ));

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top bar with dashboard link
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '2.4 Understanding Users',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Text(
                        'VIEW DASHBOARD',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
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
                    Text(
                      'LEARNING OBJECTIVE',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700],
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'By the end of this checkpoint, you will be able to advocate for the value of user research. You will also be able to explain the history of human-centered design and describe how it applies to user research.',
                      style: TextStyle(
                          fontSize: 14, height: 1.4, color: Colors.black87),
                    ),
                    const SizedBox(height: 24),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'In the previous checkpoint, you completed an empathy mapping project. You sought to understand users, as represented by two personas, and began thinking about solutions. In this checkpoint, you\'ll delve deeper into empathy and complete a design thinking challenge centered around social change.',
                            style: TextStyle(
                                fontSize: 14,
                                height: 1.4,
                                color: Colors.black87),
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            'You will also look at the value of user research for understanding the user, and you\'ll take a tour of what a user researcher does in their career.',
                            style: TextStyle(
                                fontSize: 14,
                                height: 1.4,
                                color: Colors.black87),
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
                color: Colors.grey[50],
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Key terms',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 24,
                      runSpacing: 8,
                      children: const [
                        Text('• Human-centered design (HCD)',
                            style: TextStyle(fontSize: 14, color: Colors.black87)),
                        Text('• User research',
                            style: TextStyle(fontSize: 14, color: Colors.black87)),
                        Text('• Empathy',
                            style: TextStyle(fontSize: 14, color: Colors.black87)),
                        Text('• Empathy mapping',
                            style: TextStyle(fontSize: 14, color: Colors.black87)),
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
                      color: Colors.black87),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Human-centered design (HCD), which is also called user-centered design, is an approach to problem-solving that is commonly used in design frameworks. To create solutions, HCD uses the human perspective in all steps of the problem-solving process.',
                  style: TextStyle(
                      fontSize: 14, height: 1.4, color: Colors.grey[800]),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'How does HCD work in the real world? Typically, you and your team will observe a problem within a particular context, brainstorm and ideate, conceptualize, and develop a solution to implement.',
                  style: TextStyle(
                      fontSize: 14, height: 1.4, color: Colors.grey[800]),
                ),
              ),
              const SizedBox(height: 24),
              // Three phases of HCD
              Container(
                color: Colors.grey[100],
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Three phases of HCD:',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
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
                          color: Colors.black87),
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
                        '3. The implementation stage is the time to market the product. Using empathy, designers imagine themselves in their users\' shoes and market to them from that point of view. Designers must keep in mind how they would want to be marketed to if they were the end user.'),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // History of human-centered design
              Container(
                color: Colors.grey[50],
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'History of human-centered design',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Design theorist Horst Rittel defined the term wicked problems to describe complex problems that aren\'t easily solved. He asserted that problem-solving methods should be collaborative, adaptable, and centered on the complexities of human behavior. This concept served as the foundation for human-centered design.',
                      style: TextStyle(
                          fontSize: 14, height: 1.4, color: Colors.grey[800]),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'So, what exactly is human-centered design? Human-centered design is a creative problem-solving process that begins with understanding human needs and ends with innovative solutions. HCD was championed by Nobel Prize laureate Herbert Simon, and it was developed and taught by the Stanford University Design School. It was then leveraged by design firm IDEO.',
                      style: TextStyle(
                          fontSize: 14, height: 1.4, color: Colors.grey[800]),
                    ),
                  ],
                ),
              ),
              // IDEO.org banner
              Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey[300]!),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    const Text(
                      'Designing for access',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'IDEO.org is a nonprofit design studio. We design products and services alongside organizations that are committed to creating a more just and inclusive world.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    ),
                    const SizedBox(height: 16),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text(
                          'SEE OUR WORK',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Image source: IDEO.org',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'IDEO is an innovative design firm. It was one of the first firms to focus on creating experiences beyond the screen, and human experience is at the forefront of every product and service that the firm offers. IDEO popularized human-centered design and applied it along with the design thinking approach.',
                  style: TextStyle(
                      fontSize: 14, height: 1.4, color: Colors.grey[800]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'You may have noticed that IDEO has been mentioned several times already in this program. This is because it has had a big impact on shaping the way that modern product design is done. Using HCD processes, IDEO innovated the first computer mouse, which was used in the Apple iMac and later became a standard input device for many computers.',
                  style: TextStyle(
                      fontSize: 14, height: 1.4, color: Colors.grey[800]),
                ),
              ),
              // User research section
              Container(
                color: Colors.grey[100],
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'User research careers',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'A career in UX research can span a wide range of roles, from conducting interviews and usability testing to analyzing data and developing prototypes. UX researchers are often hired by companies to help them understand how their products are being used by real people.',
                      style: TextStyle(
                          fontSize: 14, height: 1.4, color: Colors.black87),
                    ),
                  ],
                ),
              ),
              // Market research vs UX research
              Container(
                color: Colors.grey[50],
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Market research versus UX research',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Market research is focused on gathering data about the size, growth, and competition of a market. UX research, on the other hand, is focused on understanding how users interact with a product or service.',
                      style: TextStyle(
                          fontSize: 14, height: 1.4, color: Colors.black87),
                    ),
                  ],
                ),
              ),
              // Action plan
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Action plan',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    _buildBulletPoint('1. Gather information about the field of UX research.'),
                    _buildBulletPoint('2. Develop a resume and cover letter.'),
                    _buildBulletPoint('3. Network with other UX researchers.'),
                    _buildBulletPoint('4. Start building your portfolio.'),
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

  Widget _buildPhaseCard({required String title, required String subtitle, required List<String> questions}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black87)),
          const SizedBox(height: 4),
          Text(subtitle, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13, color: Colors.blue)),
          const SizedBox(height: 8),
          ...questions.map((q) => Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Text('• $q', style: const TextStyle(fontSize: 13, color: Colors.black87)),
              )),
        ],
      ),
    );
  }

  Widget _buildOverviewCard(String title, String subtitle, List<String> questions) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.black87)),
          const SizedBox(height: 4),
          Text(subtitle, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: Colors.blue[800])),
          const SizedBox(height: 8),
          ...questions.map((q) => Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: Text('• $q', style: const TextStyle(fontSize: 11, color: Colors.black87)),
              )),
        ],
      ),
    );
  }

  Widget _buildStageText(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(text, style: const TextStyle(fontSize: 14, height: 1.4, color: Colors.black87)),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• ', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black87)),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 14, color: Colors.black87))),
        ],
      ),
    );
  }
}

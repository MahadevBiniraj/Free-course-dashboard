import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/breadcrumb_bar.dart';
import '../../widgets/lesson_widgets.dart';

class ProgramOverviewLesson extends StatelessWidget {
  final bool sidebarCollapsed;
  final VoidCallback onExpandSidebar;
  final ValueChanged<String> onLessonTap;

  const ProgramOverviewLesson({
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
            BreadcrumbItem(label: '01 - Orientation'),
            BreadcrumbItem(label: '1.4 Program Overview ⭐', isLast: true),
          ],
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(36, 28, 36, 36),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '1.4 Program Overview ⭐',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 38,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -1.0,
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Lesson types and assignments',
                  style: TextStyle(
                      color: AppColors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                const Text(
                  'To ensure that you properly engage with your coursework, we alternate heavily between theory, exercises and projects. There are basically five forms of interaction for every user on our platform at Open Bootcamp:',
                  style: TextStyle(
                      color: AppColors.greyLight, fontSize: 16, height: 1.6),
                ),
                const SizedBox(height: 24),
                _bulletItem('1. Reading Lessons',
                    'These act exactly like what you are doing right now. Talk to basically teach you concept about certain topics covered here over our platform.'),
                _bulletItem('2. Activity Lessons 🎯',
                    'Activity lessons are exactly as the name suggests... We\'ll be testing what you\'ve read over reading assignments through short fun activity assignments...'),
                _bulletItem('3. Self Appraised Assignments ⭐',
                    'These assignments are basic assignments... you appraise yourself if you got the answer correctly after clicking on the Mark as Done button...'),
                _bulletItem('4. Student Assignments 🎓',
                    'There are specific assignments that needs to be officially appraised and graded by us to determine if you are ready to move on. These assignments must be submitted to us and will be strictly reviewed and critiqued...'),
                _bulletItem('5. Capstone Projects',
                    'Capstone projects refer to projects that will be used to enhance your resume when you are done with the course...'),
                const SizedBox(height: 32),
                const Text(
                  'Careers course',
                  style: TextStyle(
                      color: AppColors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                const Text(
                  'In addition to the UX/UI content, all Open Bootcamp premium users have access to our Career program.',
                  style: TextStyle(
                      color: AppColors.greyLight, fontSize: 16, height: 1.6),
                ),
                const SizedBox(height: 12),
                RichText(
                  text: const TextSpan(
                    style: TextStyle(
                        color: AppColors.greyLight, fontSize: 16, height: 1.6),
                    children: [
                      TextSpan(text: 'Please note: your job search starts on '),
                      TextSpan(
                          text: 'Day One',
                          style: TextStyle(
                              color: AppColors.green,
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              ' of this program. UX/UI Open is partnered with The Career program provided by '),
                      TextSpan(
                          text: 'Open Bootcamp',
                          style: TextStyle(color: AppColors.green)),
                      TextSpan(
                          text:
                              '. This career program teaches you everything you need to get a job in tech, including:'),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE5F1EB),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'Learn Software Development',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: AppColors.green,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text('Live',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                buildBulletPoint(
                    'How to conduct an effective job search that will result in a tech job that you will genuinely enjoy'),
                buildBulletPoint(
                    'How to build a network of mentors and peers to lean on, learn from, and collaborate with as you progress throughout your new tech career'),
                buildBulletPoint(
                    'How to present yourself through your resume, LinkedIn profile, online portfolio, and other online presence in the best possible light'),
                buildBulletPoint(
                    'How to pass technical screens, take home assignments, and non-technical interviews'),
                buildBulletPoint(
                    'How to negotiate effectively and get paid what you are worth as a professional'),
                const SizedBox(height: 32),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF7F7F7),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'A better way to learn coding',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 28,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Image.network(
                                'https://picsum.photos/400/300?2',
                                fit: BoxFit.cover),
                          ),
                          const SizedBox(width: 24),
                          Expanded(
                            child: Column(
                              children: [
                                _tag('Live'),
                                const SizedBox(height: 12),
                                _tag('Engaging'),
                                const SizedBox(height: 12),
                                _tag('Interactive'),
                                const SizedBox(height: 12),
                                _tag('Project Based'),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'webdevopen.com',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                const Text(
                  'Graduation',
                  style: TextStyle(
                      color: AppColors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                RichText(
                  text: const TextSpan(
                    style: TextStyle(
                        color: AppColors.greyLight, fontSize: 16, height: 1.6),
                    children: [
                      TextSpan(
                          text:
                              'Due to the rigorous and practical nature of this program, completing the requirements for graduation is a major feat. Those who are successful in completing our full rigorous program will be officially recognized as certified '),
                      TextSpan(
                          text: 'Open Bootcamp',
                          style: TextStyle(color: AppColors.green)),
                      TextSpan(text: ' Graduates.'),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                RichText(
                  text: const TextSpan(
                    style: TextStyle(
                        color: AppColors.greyLight, fontSize: 16, height: 1.6),
                    children: [
                      TextSpan(
                          text:
                              'Upon completing your graduation requirements, you will be directed to a checkout process where you can apply your final payment in exchange for your hard-earned UX/UI Certificate. Most users do end up completing the program in less than 4 months and end up spending just a little around '),
                      TextSpan(
                          text: '\$100 - \$200',
                          style: TextStyle(
                              color: AppColors.green,
                              fontWeight: FontWeight.bold)),
                      TextSpan(text: ' for this awesome program.'),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                const Text(
                  'Assignment 1 ⭐',
                  style: TextStyle(
                      color: AppColors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Are you ready for your first assignment? Your assignment is simple: Say Hello to your new community! If you haven\'t yet, join our workspace and head to the #01_introductions channel. We\'d like to hear about the following please:',
                  style: TextStyle(
                      color: AppColors.greyLight, fontSize: 16, height: 1.6),
                ),
                const SizedBox(height: 16),
                buildBulletPoint('Who are you? (Where you are from?)'),
                buildBulletPoint(
                    'Why did you enroll for the program? (Learning goals for this course)'),
                buildBulletPoint('What\'s a fun fact about you? (Optional)'),
                const SizedBox(height: 16),
                const Text(
                  'This will be the standard format for communicating in this course moving forward. And remember, the more you put into this community, the more you get out. Say hi to someone new as you submit this simple assignment.',
                  style: TextStyle(
                      color: AppColors.greyLight, fontSize: 16, height: 1.6),
                ),
                const SizedBox(height: 32),
                const Text(
                  'Submit lesson',
                  style: TextStyle(
                      color: AppColors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                const Text(
                  'If you have fully read and understood the assignment, please mark the assignment as done 🤩 on this screen to confirm you\'ve read these instructions and have officially completed your first lesson.',
                  style: TextStyle(
                      color: AppColors.greyLight, fontSize: 16, height: 1.6),
                ),
                const SizedBox(height: 32),
                const Text(
                  'Ready to Join our design community of 7000+ members? 🤩',
                  style: TextStyle(
                      color: AppColors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                const Text(
                    'If you haven\'t enrolled yet, here is a breakdown of what you\'ll unlock:',
                    style: TextStyle(color: AppColors.greyLight, fontSize: 16)),
                const SizedBox(height: 16),
                buildBulletPoint('Slack community access 💬'),
                buildBulletPoint('Valuable mentorship and feedback 💡'),
                buildBulletPoint('Group and real-life projects 🤝'),
                buildBulletPoint('Peer reviews 🧑‍🏫'),
                buildBulletPoint(
                    'Keep your access over your FULL student period 🤩'),
                buildBulletPoint(
                    'Our course updates you on the new trends etc. ✨'),
                buildBulletPoint('and much more ...'),
                const SizedBox(height: 16),
                const Text('Join us, you wouldn\'t regret your decision 🤝',
                    style: TextStyle(color: AppColors.greyLight, fontSize: 16)),
                const SizedBox(height: 48),
                PrevNextBar(
                  prevLabel: '« 1.3 Slack 🎯',
                  nextLabel: 'Next: 1.5 Your First UI »',
                  onPrev: () => onLessonTap('1.3 Slack 🎯'),
                  onNext: () => onLessonTap('1.5 Your First UI'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _bulletItem(String title, String desc) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                color: AppColors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          Text(
            desc,
            style: const TextStyle(
                color: AppColors.greyLight, fontSize: 16, height: 1.6),
          ),
        ],
      ),
    );
  }

  Widget _tag(String label) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF165C47),
        borderRadius: BorderRadius.circular(4),
      ),
      alignment: Alignment.center,
      child: Text(
        label,
        style: const TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}

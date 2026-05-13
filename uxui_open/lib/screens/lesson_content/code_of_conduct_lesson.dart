import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/breadcrumb_bar.dart';
import '../../widgets/lesson_widgets.dart';

class CodeOfConductLesson extends StatelessWidget {
  final bool sidebarCollapsed;
  final VoidCallback onExpandSidebar;
  final ValueChanged<String> onLessonTap;

  const CodeOfConductLesson({
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
            BreadcrumbItem(label: '1.2 Code of Conduct', isLast: true),
          ],
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(36, 28, 36, 36),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                      Text(
                        'On this page',
                        style: TextStyle(color: AppColors.greyLight, fontSize: 15),
                      ),
                      Icon(Icons.keyboard_arrow_down, color: AppColors.greyLight),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  '1.2 Code of Conduct',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 38,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -1.0,
                  ),
                ),
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFF333333),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.info_outline, color: AppColors.white, size: 20),
                          SizedBox(width: 8),
                          Text(
                            'NOTE',
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.0,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Slack access is a part of our Plus plan 🧡. The Slack section is for those that have upgraded to our Plus plan. We also use slack to submit assignments, get feedback on assignments and earn certificates.',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 15,
                          height: 1.6,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                RichText(
                  text: const TextSpan(
                    style: TextStyle(color: AppColors.greyLight, fontSize: 16, height: 1.6),
                    children: [
                      TextSpan(text: 'It is mandatory to fully respect the requirements of '),
                      TextSpan(text: 'UX/UI Open', style: TextStyle(color: AppColors.coral)),
                      TextSpan(text: ' Code of Conduct to assure the best possible experience for all students.'),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                const Text(
                  'Respect people and guidelines:',
                  style: TextStyle(color: AppColors.white, fontSize: 22, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 16),
                buildBulletPointRich(const [
                  TextSpan(text: 'Abusive behavior towards other students and/or '),
                  TextSpan(text: 'UX/UI Open', style: TextStyle(color: AppColors.coral)),
                  TextSpan(text: ' employees. (Either anywhere online or on our Slack community platform)'),
                ]),
                buildBulletPoint('Avoid breaking national and/or local laws.'),
                buildBulletPoint("Don't express sexism, racism, homophobia, ageism, ableism, or any other behavior deemed inappropriate for a healthy learning environment."),
                buildBulletPoint('Be receptive to feedback and constructive criticism.'),
                buildBulletPoint('Ask for help in our Slack workspace when you need it'),
                const SizedBox(height: 32),
                const Text(
                  'Open Bootcamp Content',
                  style: TextStyle(color: AppColors.white, fontSize: 22, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 16),
                buildBulletPointRich(const [
                  TextSpan(text: 'Students are not allowed to photograph, record, copy nor share content without permission from '),
                  TextSpan(text: 'UX/UI Open', style: TextStyle(color: AppColors.coral)),
                  TextSpan(text: '.'),
                ]),
                buildBulletPointRich(const [
                  TextSpan(text: 'The course material is licensed under '),
                  TextSpan(text: 'Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License', style: TextStyle(color: AppColors.coral)),
                  TextSpan(text: ', which means that you are free to copy and redistribute the material in any medium or format as long as the names of the original authors '),
                  TextSpan(text: 'UX/UI Open', style: TextStyle(color: AppColors.coral)),
                  TextSpan(text: ' and '),
                  TextSpan(text: 'Open Bootcamp', style: TextStyle(color: AppColors.coral)),
                  TextSpan(text: ' along with a link to the sites are not removed. If you remix, transform, or build upon the material, you may '),
                  TextSpan(text: 'not distribute', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.white)),
                  TextSpan(text: ' the modified material. '),
                  TextSpan(text: 'Using the material for commercial purposes is forbidden without permission.', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.white)),
                  TextSpan(text: ' '),
                  TextSpan(text: 'UX/UI Open', style: TextStyle(color: AppColors.coral)),
                  TextSpan(text: ' is powered and managed solely by '),
                  TextSpan(text: 'The Open Bootcamp', style: TextStyle(color: AppColors.coral)),
                  TextSpan(text: '. Please reach out to '),
                  TextSpan(text: 'uxui@theopenbootcamp.com', style: TextStyle(color: AppColors.coral)),
                  TextSpan(text: ' for queries'),
                ]),
                const SizedBox(height: 24),
                Row(
                  children: [
                    _ccIcon(Icons.copyright),
                    _ccIcon(Icons.person),
                    _ccIcon(Icons.money_off),
                    _ccIcon(Icons.block),
                  ],
                ),
                const SizedBox(height: 12),
                RichText(
                  text: TextSpan(
                    style: TextStyle(color: AppColors.greyLight, fontSize: 16, height: 1.6),
                    children: [
                      TextSpan(text: 'This work is licensed under a '),
                      TextSpan(text: 'Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License', style: TextStyle(color: AppColors.coral)),
                      TextSpan(text: '.'),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                RichText(
                  text: TextSpan(
                    style: TextStyle(color: AppColors.white, fontSize: 22, fontWeight: FontWeight.w700),
                    children: [
                      TextSpan(text: 'Using '),
                      TextSpan(text: 'ADPList', style: TextStyle(color: AppColors.coral)),
                      TextSpan(text: ' for FREE mentorship'),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                buildBulletPointRich(const [
                  TextSpan(text: 'We\'re recommending '),
                  TextSpan(text: 'ADPList', style: TextStyle(color: AppColors.coral)),
                  TextSpan(text: ' to get mentored for FREE at our own will. This isn\'t a sponsored text. ADPList is an amazing platform that all designers must leverage to the best. ADPList also comes out regularly with free courses and workshops. '),
                  TextSpan(text: 'UX/UI Open', style: TextStyle(color: AppColors.coral)),
                  TextSpan(text: ' shall not be responsible in any way as to what happens on '),
                  TextSpan(text: 'ADPList', style: TextStyle(color: AppColors.coral)),
                  TextSpan(text: '. Please reach out to the team at '),
                  TextSpan(text: 'ADPList', style: TextStyle(color: AppColors.coral)),
                  TextSpan(text: ' for queries regarding '),
                  TextSpan(text: 'ADPList', style: TextStyle(color: AppColors.coral)),
                  TextSpan(text: '.'),
                ]),
                const SizedBox(height: 48),
                PrevNextBar(
                  prevLabel: '« 1.1 Welcome',
                  nextLabel: '1.3 Slack 🎯 »',
                  onPrev: () => onLessonTap('1.1 Welcome'),
                  onNext: () => onLessonTap('1.3 Slack 🎯'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _ccIcon(IconData icon) {
    return Container(
      margin: const EdgeInsets.only(right: 4),
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(4),
      child: Icon(icon, size: 24, color: Colors.black),
    );
  }
}

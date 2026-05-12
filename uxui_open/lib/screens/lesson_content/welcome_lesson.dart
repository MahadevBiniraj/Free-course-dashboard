import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/breadcrumb_bar.dart';
import '../../widgets/lesson_widgets.dart';

class WelcomeLesson extends StatelessWidget {
  final bool sidebarCollapsed;
  final VoidCallback onExpandSidebar;

  const WelcomeLesson({
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
            BreadcrumbItem(label: '01 - Orientation'),
            BreadcrumbItem(label: '1.1 Welcome', isLast: true),
          ],
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(36, 28, 36, 36),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '1.1 Welcome',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 38,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -1.0,
                  ),
                ),
                const SizedBox(height: 24),
                _paragraph("Welcome to UX/UI Open! It's so great to have you here 🤩"),
                const SizedBox(height: 20),
                _paragraph("Today, you embark on a journey that, with hard work, will result in a new career and trajectory for your life. That's a big deal."),
                const SizedBox(height: 20),
                _paragraph("In this program, you will learn essential skills for your new career. But before you begin, it's helpful to spend a few minutes familiarizing yourself with the major components of your program, the network that's here to assist you, the UX/UI communication platform (Open Bootcamp's Slack workspace for paid users), and some general student expectations and code of conduct."),
                const SizedBox(height: 20),
                _paragraph("Now it's time to dive in!"),
                const SizedBox(height: 48),
                const PrevNextBar(
                  prevLabel: '« 01 - Orientation',
                  nextLabel: '1.2 Code of Conduct »',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _paragraph(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: AppColors.greyLight,
        fontSize: 16,
        height: 1.7,
      ),
    );
  }
}

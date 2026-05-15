import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ActionCardsRow extends StatelessWidget {
  const ActionCardsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Row(
        children: [
          Expanded(
            child: _ActionCard(
              icon: Icons.emoji_events_outlined,
              title: 'My Achievements',
              description: 'Track your badges, certificates and milestones.',
              linkText: 'View Achievements',
              decorationWidget: _TrophyDecoration(),
            ),
          ),
          const SizedBox(width: 24),
          Expanded(
            child: _ActionCard(
              icon: Icons.people_outline,
              title: 'Join Community',
              description:
                  'Connect with learners, get help and share knowledge.',
              linkText: 'Join Now',
              decorationWidget: _PeopleDecoration(),
            ),
          ),
          const SizedBox(width: 24),
          Expanded(
            child: _ActionCard(
              icon: Icons.flash_on_outlined,
              title: 'UX/UI Challenges',
              description: 'Participate in weekly challenges and win rewards.',
              linkText: 'Explore Challenges',
              decorationWidget: _TargetDecoration(),
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final String linkText;
  final Widget decorationWidget;

  const _ActionCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.linkText,
    required this.decorationWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.cardBorder, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          // Background decoration
          Positioned(
            right: -20,
            bottom: -10,
            child: decorationWidget,
          ),
          // Content
          Padding(
            padding: const EdgeInsets.all(28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.greenDim,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(icon, color: AppColors.green, size: 24),
                ),
                const SizedBox(height: 20),
                Text(title, style: AppTextStyles.heading3),
                const SizedBox(height: 8),
                Text(description, style: AppTextStyles.body),
                const Spacer(),
                Row(
                  children: [
                    Text(linkText, style: AppTextStyles.label),
                    const SizedBox(width: 6),
                    const Icon(Icons.arrow_forward,
                        color: AppColors.green, size: 16),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TrophyDecoration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.6,
      child: Container(
        width: 80,
        height: 100,
        child:
            const Icon(Icons.emoji_events, color: Color(0xFF888866), size: 80),
      ),
    );
  }
}

class _PeopleDecoration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.5,
      child: SizedBox(
        width: 80,
        height: 80,
        child: const Icon(Icons.group, color: AppColors.green, size: 70),
      ),
    );
  }
}

class _TargetDecoration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.5,
      child: SizedBox(
        width: 80,
        height: 80,
        child:
            const Icon(Icons.track_changes, color: AppColors.green, size: 70),
      ),
    );
  }
}

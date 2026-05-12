import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Welcome text
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text('WELCOME BACK, ARUN ',
                        style: AppTextStyles.label),
                    const Text('👏', style: TextStyle(fontSize: 16)),
                  ],
                ),
                const SizedBox(height: 16),
                const Text('Continue your learning\njourney.',
                    style: AppTextStyles.heading1),
                const SizedBox(height: 12),
                const Text(
                  'Track your progress, join the community and\nachieve your goals.',
                  style: AppTextStyles.body,
                ),
              ],
            ),
          ),
          const SizedBox(width: 24),
          // Logout button + Stats
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Logout button
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.green,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 14),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    elevation: 0,
                  ),
                  child: const Text('Logout',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),
                ),
                const SizedBox(height: 24),
                // Stats row
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _StatItem(
                          icon: Icons.local_fire_department_outlined,
                          value: '12',
                          label: 'Day Streak'),
                      _divider(),
                      _StatItem(
                          icon: Icons.star_outline,
                          value: '820',
                          label: 'XP Points'),
                      _divider(),
                      _StatItem(
                          icon: Icons.view_module_outlined,
                          value: '4/18',
                          label: 'Modules'),
                      _divider(),
                      _StatItem(
                          icon: Icons.track_changes_outlined,
                          value: '68%',
                          label: 'Course Progress'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _divider() {
    return Container(width: 1, height: 48, color: AppColors.cardBorder);
  }
}

class _StatItem extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const _StatItem(
      {required this.icon, required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: AppColors.green, size: 22),
        const SizedBox(height: 6),
        Text(value, style: AppTextStyles.statNumber),
        const SizedBox(height: 2),
        Text(label, style: AppTextStyles.statLabel),
      ],
    );
  }
}

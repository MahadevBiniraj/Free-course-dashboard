import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class TopNavBar extends StatelessWidget implements PreferredSizeWidget {
  const TopNavBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(72);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      decoration: const BoxDecoration(
        color: AppColors.background, // Matched with background
        border:
            Border(bottom: BorderSide(color: AppColors.cardBorder, width: 1.5)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Row(
        children: [
          // Menu icon
          const Icon(Icons.menu, color: AppColors.greyLight, size: 24),
          const SizedBox(width: 16),
          // Logo
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.green, width: 1.5),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.all_inclusive,
                color: AppColors.green, size: 18),
          ),
          const SizedBox(width: 12),
          const Text('UX/UI Open',
              style: TextStyle(
                  color: AppColors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.2)),
          const Spacer(),
          // Live Chat
          _NavButton(
            icon: Icons.chat_bubble_outline,
            label: 'Live Chat',
            onTap: () {},
          ),
          const SizedBox(width: 12),
          // View Onboarding
          _NavButton(
            icon: Icons.play_circle_outline,
            label: 'View Onboarding',
            onTap: () {},
          ),
          const SizedBox(width: 16),
          // Notification bell
          Stack(
            children: [
              const Icon(Icons.notifications_none,
                  color: AppColors.greyLight, size: 28),
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  width: 16,
                  height: 16,
                  decoration: const BoxDecoration(
                    color: AppColors.green,
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Text('9',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),
          // Avatar
          Container(
            width: 36,
            height: 36,
            decoration: const BoxDecoration(
              color: AppColors.green,
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Text('A',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          const SizedBox(width: 6),
          const Icon(Icons.keyboard_arrow_down,
              color: AppColors.greyLight, size: 20),
        ],
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _NavButton(
      {required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.cardBorder),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(icon, color: AppColors.greyLight, size: 16),
            const SizedBox(width: 6),
            Text(label,
                style: const TextStyle(
                    color: AppColors.greyLight,
                    fontSize: 13,
                    fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}

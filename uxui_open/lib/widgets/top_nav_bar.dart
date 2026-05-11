import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class TopNavBar extends StatelessWidget implements PreferredSizeWidget {
  const TopNavBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        color: Color(0xFF0D0D0D),
        border: Border(bottom: BorderSide(color: AppColors.cardBorder)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          // Menu icon
          const Icon(Icons.menu, color: AppColors.greyLight, size: 22),
          const SizedBox(width: 12),
          // Logo
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.green, width: 1.5),
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Icon(Icons.all_inclusive, color: AppColors.green, size: 16),
          ),
          const SizedBox(width: 8),
          const Text('UX/UI Open',
              style: TextStyle(color: AppColors.white, fontSize: 15, fontWeight: FontWeight.w600)),
          const Spacer(),
          // Live Chat
          _NavButton(
            icon: Icons.chat_bubble_outline,
            label: 'Live Chat',
            onTap: () {},
          ),
          const SizedBox(width: 8),
          // View Onboarding
          _NavButton(
            icon: Icons.play_circle_outline,
            label: 'View Onboarding',
            onTap: () {},
          ),
          const SizedBox(width: 12),
          // Notification bell
          Stack(
            children: [
              const Icon(Icons.notifications_none, color: AppColors.greyLight, size: 24),
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  width: 14,
                  height: 14,
                  decoration: const BoxDecoration(
                    color: AppColors.green,
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Text('9', style: TextStyle(color: Colors.black, fontSize: 9, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 12),
          // Avatar
          Container(
            width: 32,
            height: 32,
            decoration: const BoxDecoration(
              color: AppColors.green,
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Text('A', style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold)),
            ),
          ),
          const SizedBox(width: 4),
          const Icon(Icons.keyboard_arrow_down, color: AppColors.greyLight, size: 18),
        ],
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _NavButton({required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.cardBorder),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          children: [
            Icon(icon, color: AppColors.greyLight, size: 14),
            const SizedBox(width: 5),
            Text(label, style: const TextStyle(color: AppColors.greyLight, fontSize: 12)),
          ],
        ),
      ),
    );
  }
}

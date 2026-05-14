import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  Widget _socialIcon(IconData icon) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.greyDark),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Icon(icon, color: AppColors.greyLight, size: 15),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background, // Matched with dashboard background
      padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 40),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.green, width: 1.5),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(Icons.all_inclusive, color: AppColors.green, size: 18),
                        ),
                        const SizedBox(width: 12),
                        const Text('UX/UI Open',
                            style: TextStyle(color: AppColors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Empowering learners to build\ncareer-ready portfolios and\nreal-world experience.',
                      style: TextStyle(color: AppColors.greyLight, fontSize: 14, height: 1.6),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        _socialIcon(Icons.camera_alt_outlined),
                        const SizedBox(width: 12),
                        _socialIcon(Icons.link),
                        const SizedBox(width: 12),
                        _socialIcon(Icons.play_circle_outline),
                        const SizedBox(width: 12),
                        _socialIcon(Icons.forum_outlined),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: _FooterColumn(
                  title: 'Website',
                  items: [
                    _FooterItem('Bootcamp Curriculum'),
                    _FooterItem('UX/UI Game', badge: 'NEW'),
                    _FooterItem('Free Design Course'),
                    _FooterItem('UX/UI Roadmap 2026'),
                    _FooterItem('UX/UI Resources', badge: 'NEW'),
                    _FooterItem('Alternate Register Link'),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: _FooterColumn(
                  title: 'Other',
                  items: [
                    _FooterItem('Blog'),
                    _FooterItem('Privacy Statement'),
                    _FooterItem('Terms & Conditions'),
                    _FooterItem('Refund Policy'),
                    _FooterItem('Contact Us'),
                    _FooterItem('Learn Web Dev in 2026'),
                    _FooterItem('Live Webinars'),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: _FooterColumn(
                  title: 'Pages',
                  items: [
                    _FooterItem('Design Bootcamp'),
                    _FooterItem('Learn UX/UI Online'),
                    _FooterItem('UX/UI Career Path'),
                    _FooterItem('UX/UI Portfolio'),
                    _FooterItem('Design Trends'),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          const Divider(color: AppColors.cardBorder, height: 1),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('© 2025 The Open Bootcamp. All rights reserved.',
                  style: TextStyle(color: AppColors.grey, fontSize: 13)),
              Row(
                children: const [
                  Text('Made with ', style: TextStyle(color: AppColors.grey, fontSize: 13)),
                  Icon(Icons.favorite, color: AppColors.green, size: 13),
                  Text(' by Open Bootcamp', style: TextStyle(color: AppColors.grey, fontSize: 13)),
                ],
              ),
              const Text('Trusted by 10K+ Students',
                  style: TextStyle(color: AppColors.grey, fontSize: 13)),
            ],
          ),
        ],
      ),
    );
  }
}

class _FooterItem {
  final String text;
  final String? badge;
  _FooterItem(this.text, {this.badge});
}

class _FooterColumn extends StatelessWidget {
  final String title;
  final List<_FooterItem> items;
  const _FooterColumn({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(color: AppColors.white, fontSize: 15, fontWeight: FontWeight.w600)),
        const SizedBox(height: 16),
        ...items.map((item) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                children: [
                  Text(item.text, style: const TextStyle(color: AppColors.greyLight, fontSize: 14)),
                  if (item.badge != null) ...[
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.green),
                        borderRadius: BorderRadius.circular(4),
                        color: AppColors.green.withOpacity(0.1),
                      ),
                      child: Text(item.badge!,
                          style: const TextStyle(color: AppColors.green, fontSize: 10, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ],
              ),
            )),
      ],
    );
  }
}

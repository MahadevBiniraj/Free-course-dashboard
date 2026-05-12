import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class NavButton extends StatelessWidget {
  final String label;
  final TextAlign align;
  const NavButton({super.key, required this.label, required this.align});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Text(
        label,
        textAlign: align,
        style: const TextStyle(
          color: AppColors.greyLight,
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class PrevNextBar extends StatelessWidget {
  final String prevLabel;
  final String nextLabel;

  const PrevNextBar({
    super.key,
    required this.prevLabel,
    required this.nextLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: NavButton(label: prevLabel, align: TextAlign.left),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: NavButton(label: nextLabel, align: TextAlign.right),
        ),
      ],
    );
  }
}

class CardGrid extends StatelessWidget {
  final List<Map<String, String>> cards;
  const CardGrid({super.key, required this.cards});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      final cols = constraints.maxWidth > 520 ? 2 : 1;
      final rows = (cards.length / cols).ceil();

      return Column(
        children: List.generate(rows, (r) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Row(
              children: List.generate(cols, (c) {
                final idx = r * cols + c;
                if (idx >= cards.length) {
                  return const Expanded(child: SizedBox());
                }
                return Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: c == 1 ? 16 : 0),
                    child: LessonCard(data: cards[idx]),
                  ),
                );
              }),
            ),
          );
        }),
      );
    });
  }
}

class LessonCard extends StatelessWidget {
  final Map<String, String> data;
  const LessonCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.insert_drive_file_outlined,
                  color: AppColors.grey, size: 16),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  data['title']!,
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            data['subtitle']!,
            style: const TextStyle(
              color: AppColors.greyLight,
              fontSize: 14,
              height: 1.6,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

Widget buildBulletPoint(String text) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 8, right: 12),
          child: CircleAvatar(backgroundColor: AppColors.greyLight, radius: 3),
        ),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(color: AppColors.greyLight, fontSize: 16, height: 1.6),
          ),
        ),
      ],
    ),
  );
}

Widget buildBulletPointRich(List<TextSpan> spans) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 8, right: 12),
          child: CircleAvatar(backgroundColor: AppColors.greyLight, radius: 3),
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: const TextStyle(color: AppColors.greyLight, fontSize: 16, height: 1.6),
              children: spans,
            ),
          ),
        ),
      ],
    ),
  );
}

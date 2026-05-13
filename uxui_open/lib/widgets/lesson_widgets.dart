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
  final VoidCallback? onPrev;
  final VoidCallback? onNext;

  const PrevNextBar({
    super.key,
    required this.prevLabel,
    required this.nextLabel,
    this.onPrev,
    this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: onPrev,
            borderRadius: BorderRadius.circular(8),
            child: NavButton(label: prevLabel, align: TextAlign.left),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: InkWell(
            onTap: onNext,
            borderRadius: BorderRadius.circular(8),
            child: NavButton(label: nextLabel, align: TextAlign.right),
          ),
        ),
      ],
    );
  }
}

class CardGrid extends StatelessWidget {
  final List<Map<String, String>> cards;
  final ValueChanged<String>? onCardTap;
  const CardGrid({super.key, required this.cards, this.onCardTap});

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
                    child: LessonCard(
                      data: cards[idx],
                      onTap: onCardTap != null ? () => onCardTap!(cards[idx]['title']!) : null,
                    ),
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
  final VoidCallback? onTap;
  const LessonCard({super.key, required this.data, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
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

class LessonTile extends StatelessWidget {
  final String title;
  final bool isActive;
  final VoidCallback? onTap;

  const LessonTile({
    super.key,
    required this.title,
    this.isActive = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          decoration: BoxDecoration(
            color: isActive ? AppColors.greenDim.withAlpha(50) : AppColors.cardBackground,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: isActive ? AppColors.green.withAlpha(120) : AppColors.cardBorder,
              width: isActive ? 1.5 : 1.0,
            ),
          ),
          child: Row(
            children: [
              Icon(
                isActive ? Icons.play_circle_fill : Icons.insert_drive_file_outlined,
                color: isActive ? AppColors.green : AppColors.grey,
                size: 20,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    color: isActive ? AppColors.white : AppColors.greyLight,
                    fontSize: 16,
                    fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
                  ),
                ),
              ),
              if (isActive)
                const Text(
                  'ACTIVE',
                  style: TextStyle(
                    color: AppColors.green,
                    fontSize: 11,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 0.5,
                  ),
                ),
              const SizedBox(width: 8),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: isActive ? AppColors.green : AppColors.greyDark,
                size: 14,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

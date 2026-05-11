import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class FAQSection extends StatefulWidget {
  const FAQSection({super.key});

  @override
  State<FAQSection> createState() => _FAQSectionState();
}

class _FAQSectionState extends State<FAQSection> {
  int? _expandedIndex;

  final List<Map<String, String>> _faqs = [
    {'q': 'How do I do mentor calls ?', 'a': 'You can schedule mentor calls through the dashboard under the mentorship section. Choose your preferred time slot and mentor.'},
    {'q': 'Can I choose my own Mentor ?', 'a': 'Yes! You can browse available mentors by expertise and choose the one that fits your learning goals.'},
    {'q': 'Will the content be available forever?', 'a': 'You will have lifetime access to all the course content once enrolled, including future updates.'},
    {'q': 'Do I need a laptop/desktop to learn ?', 'a': 'While a laptop/desktop is recommended for design tools, you can access most content on mobile or tablet.'},
    {'q': 'How do I get feedback ?', 'a': 'Submit your assignments and projects through the platform. Mentors and peers will review and provide feedback within 48 hours.'},
    {'q': 'What is UX/UI?', 'a': 'UX (User Experience) design focuses on how users interact with products, while UI (User Interface) design focuses on the visual elements and layout.'},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          // Header
          const Text('LEARNER FAQ', style: AppTextStyles.label),
          const SizedBox(height: 8),
          const Text('Frequently Asked Questions',
              style: TextStyle(color: AppColors.white, fontSize: 26, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center),
          const SizedBox(height: 8),
          RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              children: [
                TextSpan(
                    text: "Got more questions? We'd be happy to hear you at\n",
                    style: TextStyle(color: AppColors.grey, fontSize: 13)),
                TextSpan(
                    text: 'uxui@theopenbootcamp.com',
                    style: TextStyle(color: AppColors.green, fontSize: 13)),
              ],
            ),
          ),
          const SizedBox(height: 24),
          // FAQ items
          ...List.generate(_faqs.length, (index) {
            final isExpanded = _expandedIndex == index;
            return Container(
              margin: const EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(
                color: AppColors.cardBackground,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.cardBorder),
              ),
              child: InkWell(
                onTap: () {
                  setState(() {
                    _expandedIndex = isExpanded ? null : index;
                  });
                },
                borderRadius: BorderRadius.circular(8),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            '${(index + 1).toString().padLeft(2, '0')}',
                            style: const TextStyle(color: AppColors.grey, fontSize: 12, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(_faqs[index]['q']!,
                                style: const TextStyle(color: AppColors.white, fontSize: 14)),
                          ),
                          Container(
                            width: 22,
                            height: 22,
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.greyDark),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Icon(
                              isExpanded ? Icons.remove : Icons.add,
                              color: AppColors.greyLight,
                              size: 14,
                            ),
                          ),
                        ],
                      ),
                      if (isExpanded) ...[
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(left: 32),
                          child: Text(_faqs[index]['a']!,
                              style: const TextStyle(color: AppColors.grey, fontSize: 13, height: 1.5)),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}

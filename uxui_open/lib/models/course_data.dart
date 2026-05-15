
class CourseSection {
  final String title;
  final List<String> lessons;
  final bool isPhaseHeader;

  const CourseSection({
    required this.title,
    this.lessons = const [],
    this.isPhaseHeader = false,
  });
}

const List<CourseSection> kSections = [
  CourseSection(title: '01 - Orientation', lessons: [
    '1.1 Welcome',
    '1.2 Code of Conduct',
    '1.3 Slack 🎯',
    '1.4 Program Overview ⭐',
  ]),
  CourseSection(title: '02 – UX Fundamentals', lessons: [
    '2.1 The Way Of The Designer ⭐',
    '2.2 Your Career',
    '2.3 Design Thinking ⭐',
    '2.4 Understanding Users',
    '2.5 The Visuals',
    '2.6 Designing For Everyone',
    '2.7 Design Process 🎉📞',
    '2.8 Design Foundations',
  ]),
  CourseSection(title: '03 – User Centered Design', lessons: [
    '3.1 User Centered Research',
    '3.2 Using Research',
    '3.3 Research Methods',
    '3.4 Insight Translation',
    '3.5 Ongoing Evaluation',
    '3.6 Assignment ⭐',
  ]),
  CourseSection(title: '04 – Visual Design'),
  CourseSection(title: 'UX Intensive Phase 🏛', isPhaseHeader: true),
  CourseSection(title: '05 – Discover'),
  CourseSection(title: '06 – Define'),
  CourseSection(title: '07 – Develop'),
  CourseSection(title: '08 – Deliver'),
  CourseSection(title: 'Team Design Phase 🏛', isPhaseHeader: true),
  CourseSection(title: '09 – Defining A Product'),
  CourseSection(title: '10 – Low Fidelity Prototyping'),
];

const List<Map<String, String>> kCards = [
  {
    'title': '1.1 Welcome',
    'subtitle': "Welcome to UX/UI Open! It's so great to have you here 😄",
  },
  {
    'title': '1.2 Code of Conduct',
    'subtitle': 'Slack access is a part of our Plus plan 🧡. The Slack section is fo...',
  },
  {
    'title': '1.3 Slack 🎯',
    'subtitle': 'By the end of this checkpoint, you should be able to join UX/UI ...',
  },
  {
    'title': '1.4 Program Overview ⭐',
    'subtitle': 'By the end of this checkpoint, you should be able to identify the...',
  },
];

const List<Map<String, String>> kUXFundamentalsCards = [
  {
    'title': '2.1 The Way Of The Designer ⭐',
    'subtitle': 'Understand the mindset, approach, and daily life of a UX/UI designer...',
  },
  {
    'title': '2.2 Your Career',
    'subtitle': 'Explore career paths, job roles, and industry expectations for designers...',
  },
  {
    'title': '2.3 Design Thinking ⭐',
    'subtitle': 'Learn the core design thinking framework used by top companies worldwide...',
  },
  {
    'title': '2.4 Understanding Users',
    'subtitle': 'Deep dive into user research, personas, and empathy mapping techniques...',
  },
  {
    'title': '2.5 The Visuals',
    'subtitle': 'Explore visual hierarchy, color theory, typography and layout principles...',
  },
  {
    'title': '2.6 Designing For Everyone',
    'subtitle': 'Learn accessibility best practices and inclusive design principles...',
  },
  {
    'title': '2.7 Design Process 🎉📞',
    'subtitle': 'Master the end-to-end design process from research to final handoff...',
  },
  {
    'title': '2.8 Design Foundations',
    'subtitle': 'Build a solid foundation in design principles, grids, and systems...',
  },
];

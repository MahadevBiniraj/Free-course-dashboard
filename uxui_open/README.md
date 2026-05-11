# UX/UI Open - Flutter Dashboard

A pixel-perfect Flutter implementation of the UX/UI Open learning platform dashboard.

## Design
- Dark theme with green (#00C853) accent color
- Responsive layout using Flutter Row/Column
- Matching all UI sections from the original design

## Sections Included
1. **Top Navigation Bar** - Logo, Live Chat, Onboarding, Notifications, Avatar
2. **Hero Section** - Welcome message, stats (Day Streak, XP Points, Modules, Course Progress), Logout button
3. **Learning Cards Row** - Start Learning card + View Calendar card with mini calendar
4. **Progress Section** - Circular progress indicator, course progress bar, Next Up widget
5. **Action Cards Row** - My Achievements, Join Community, UX/UI Challenges
6. **FAQ Section** - Expandable FAQ items with numbered list
7. **Footer** - Brand info, social icons, navigation columns, copyright

## Getting Started

### Prerequisites
- Flutter SDK 3.0+
- Dart SDK 3.0+

### Installation

```bash
# Get dependencies
flutter pub get

# Run on web (recommended for desktop-style layout)
flutter run -d chrome

# Run on desktop
flutter run -d macos   # or windows, linux

# Run on mobile
flutter run
```

## Project Structure

```
lib/
  main.dart                    # App entry point
  theme/
    app_theme.dart             # Colors & text styles
  screens/
    dashboard_screen.dart      # Main dashboard screen
  widgets/
    top_nav_bar.dart           # Navigation bar
    hero_section.dart          # Welcome + stats
    learning_cards_row.dart    # Start Learning + Calendar
    progress_section.dart      # Course progress
    action_cards_row.dart      # Achievement/Community/Challenges
    faq_section.dart           # FAQ accordion
    footer_section.dart        # Footer
```

## Dependencies

- `percent_indicator: ^4.2.3` - Circular progress indicators
- `flutter_svg: ^2.0.9` - SVG support
- `google_fonts: ^6.1.0` - Custom fonts

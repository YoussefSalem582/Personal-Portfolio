import 'package:flutter/material.dart';
import 'stats_grid_widget.dart';
import 'resume_card_widget.dart';
import 'social_links_widget.dart';

import '../../theme/app_theme.dart';

/// Widget displaying the statistics and actions section.
///
/// This section contains three main components stacked vertically:
/// 1. Stats grid - Project count, experience, technologies, satisfaction
/// 2. Resume card - Download button for CV/resume
/// 3. Social links - Icons linking to social media profiles
///
/// Used as the right column in desktop layout or below bio in mobile layout.
class StatsSectionWidget extends StatelessWidget {
  const StatsSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        // Statistics grid (2x2 cards)
        StatsGridWidget(),

        SizedBox(height: AppTheme.spacingXL),

        // Resume download card
        ResumeCardWidget(),

        SizedBox(height: AppTheme.spacingXL),

        // Social media links
        SocialLinksWidget(),
      ],
    );
  }
}

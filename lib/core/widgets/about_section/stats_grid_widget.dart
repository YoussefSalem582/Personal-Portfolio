import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../../l10n/app_localizations.dart';
import '../../utils/assets/app_constants.dart';
import 'stat_card_widget.dart';

import '../../theme/app_theme.dart';

/// A 2x2 grid displaying key statistics with staggered animations.
///
/// Features:
/// - Animated entrance with staggered delay
/// - Icons for each statistic
/// - Responsive grid layout
/// - Dynamic stat calculations from portfolio data
///
/// Shows four statistics:
/// - Number of completed projects
/// - Years of experience
/// - Number of technologies/skills
/// - Client satisfaction percentage
///
/// Each statistic is displayed in a StatCardWidget with gradient background,
/// hover effects, and smooth animations.
class StatsGridWidget extends StatelessWidget {
  const StatsGridWidget({
    super.key,
    required this.projectsCount,
    required this.technologiesCount,
  });

  final int projectsCount;
  final int technologiesCount;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;
    final l10n = AppLocalizations.of(context);

    // Define the statistics to display with icons
    final stats = [
      {
        'title': '$projectsCount+',
        'subtitle': l10n.statProjectsCompleted,
        'icon': AppIcons.projects,
      },
      {
        'title': '2+',
        'subtitle': l10n.statYearsExperience,
        'icon': AppIcons.experience,
      },
      {
        'title': '$technologiesCount+',
        'subtitle': l10n.statTechnologies,
        'icon': AppIcons.technology,
      },
      {
        'title': '100%',
        'subtitle': l10n.statClientSatisfaction,
        'icon': AppIcons.featured,
      },
    ];

    return AnimationLimiter(
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: isMobile ? AppTheme.spacingS : AppTheme.spacingM,
          mainAxisSpacing: isMobile ? AppTheme.spacingS : AppTheme.spacingM,
          childAspectRatio: isMobile ? 0.85 : 1.1,
        ),
        itemCount: stats.length,
        itemBuilder: (context, index) {
          final stat = stats[index];
          return AnimationConfiguration.staggeredGrid(
            position: index,
            duration: const Duration(milliseconds: 600),
            columnCount: 2,
            child: SlideAnimation(
              verticalOffset: 50.0,
              child: FadeInAnimation(
                child: StatCardWidget(
                  title: stat['title']! as String,
                  subtitle: stat['subtitle']! as String,
                  icon: stat['icon'] as IconData?,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

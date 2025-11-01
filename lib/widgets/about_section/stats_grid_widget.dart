import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../utils/data/portfolio_data.dart';
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
  const StatsGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    // Define the statistics to display with icons
    final stats = [
      {
        'title': '${PortfolioData.projects.length}+',
        'subtitle': 'Projects Completed',
        'icon': AppIcons.projects,
      },
      {
        'title': '2+',
        'subtitle': 'Years Experience',
        'icon': AppIcons.experience,
      },
      {
        'title': '${PortfolioData.skills.expand((cat) => cat.skills).length}+',
        'subtitle': 'Technologies',
        'icon': AppIcons.technology,
      },
      {
        'title': '100%',
        'subtitle': 'Client Satisfaction',
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

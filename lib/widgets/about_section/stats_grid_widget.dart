import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../utils/data/portfolio_data.dart';
import 'stat_card_widget.dart';

/// A 2x2 grid displaying key statistics.
///
/// Shows four statistics:
/// - Number of completed projects
/// - Years of experience
/// - Number of technologies/skills
/// - Client satisfaction percentage
///
/// Each statistic is displayed in a StatCardWidget with gradient background.
class StatsGridWidget extends StatelessWidget {
  const StatsGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Define the statistics to display
    final stats = [
      {
        'title': '${PortfolioData.projects.length}+',
        'subtitle': 'Projects Completed',
      },
      {
        'title': '2+',
        'subtitle': 'Years Experience',
      },
      {
        'title': '${PortfolioData.skills.expand((cat) => cat.skills).length}+',
        'subtitle': 'Technologies',
      },
      {
        'title': '100%',
        'subtitle': 'Client Satisfaction',
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: AppTheme.spacingM,
        mainAxisSpacing: AppTheme.spacingM,
        childAspectRatio: 1.2,
      ),
      itemCount: stats.length,
      itemBuilder: (context, index) {
        final stat = stats[index];
        return StatCardWidget(
          title: stat['title']!,
          subtitle: stat['subtitle']!,
        );
      },
    );
  }
}

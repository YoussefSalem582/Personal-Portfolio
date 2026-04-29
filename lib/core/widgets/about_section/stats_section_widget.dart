import 'package:flutter/material.dart';
import 'package:youssef_hassan_portfolio/features/contact/domain/entities/contact_entities.dart';
import 'stats_grid_widget.dart';
import 'resume_card_widget.dart';
import 'social_links_widget.dart';

import '../../theme/app_theme.dart';

/// Widget displaying the statistics and actions section.
class StatsSectionWidget extends StatelessWidget {
  const StatsSectionWidget({
    super.key,
    required this.projectsCount,
    required this.technologiesCount,
    required this.resumeUrl,
    required this.socialLinks,
  });

  final int projectsCount;
  final int technologiesCount;
  final String resumeUrl;
  final List<SocialLink> socialLinks;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StatsGridWidget(
          projectsCount: projectsCount,
          technologiesCount: technologiesCount,
        ),
        const SizedBox(height: AppTheme.spacingXL),
        ResumeCardWidget(resumeUrl: resumeUrl),
        const SizedBox(height: AppTheme.spacingXL),
        SocialLinksWidget(links: socialLinks),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import '../../../l10n/app_localizations.dart';
import '../../../utils/assets/app_constants.dart';
import '../../theme/app_theme.dart';

/// Projects View All Section
/// Displays buttons to view all projects or visit GitHub
class ProjectsViewAllSection extends StatelessWidget {
  final VoidCallback onViewAllProjects;
  final VoidCallback onVisitGitHub;

  const ProjectsViewAllSection({
    super.key,
    required this.onViewAllProjects,
    required this.onVisitGitHub,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Column(
      children: [
        Text(
          l10n.projectsSeeMorePrompt,
          style: AppFonts.bodyLarge(),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppTheme.spacingM),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton.icon(
              onPressed: onViewAllProjects,
              icon: const Icon(AppIcons.projects),
              label: Text(l10n.projectsViewAll),
            ),
            const SizedBox(width: AppTheme.spacingM),
            ElevatedButton.icon(
              onPressed: onVisitGitHub,
              icon: const Icon(Icons.code),
              label: Text(l10n.projectsVisitGitHub),
            ),
          ],
        ),
      ],
    );
  }
}

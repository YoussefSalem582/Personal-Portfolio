import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../l10n/app_localizations.dart';
import '../../models/project.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_theme.dart';
import '../../utils/assets/app_constants.dart';
import '../../utils/data/localized/localized_extensions.dart';

/// All Projects Dialog
/// Displays a dialog with all projects in a scrollable list
class AllProjectsDialog extends StatelessWidget {
  final List<Project> projects;

  const AllProjectsDialog({
    super.key,
    required this.projects,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Dialog(
      backgroundColor: AppColors.transparent,
      insetPadding: const EdgeInsets.all(AppTheme.spacingL),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 900, maxHeight: 700),
        decoration: BoxDecoration(
          color: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
          borderRadius: BorderRadius.circular(AppTheme.radiusL),
          border: Border.all(
            color: isDark
                ? AppColors.white.withOpacity(0.1)
                : AppColors.black.withOpacity(0.1),
            width: 1,
          ),
        ),
        child: Column(
          children: [
            // Header
            _buildHeader(context, isDark),

            // Projects list
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(AppTheme.spacingL),
                itemCount: projects.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: AppTheme.spacingM),
                    child: _buildProjectItem(context, projects[index], isDark),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, bool isDark) {
    final l10n = AppLocalizations.of(context);
    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingL),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: isDark
                ? AppColors.white.withOpacity(0.1)
                : AppColors.black.withOpacity(0.1),
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              l10n.allProjectsDialogTitle(projects.length),
              style: AppFonts.h2().copyWith(
                color: isDark
                    ? AppColors.textPrimaryDark
                    : AppColors.textPrimaryLight,
              ),
            ),
          ),
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            tooltip: l10n.tooltipClose,
            icon: Icon(
              AppIcons.close,
              color: isDark
                  ? AppColors.textPrimaryDark
                  : AppColors.textPrimaryLight,
            ),
            style: IconButton.styleFrom(
              backgroundColor: isDark
                  ? AppColors.white.withOpacity(0.05)
                  : AppColors.black.withOpacity(0.05),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectItem(BuildContext context, Project project, bool isDark) {
    return Material(
      color: AppColors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.of(context).pop();
          // Navigate to case study for projects with images
          if (project.imageUrl != null ||
              (project.galleryImages != null &&
                  project.galleryImages!.isNotEmpty)) {
            context.push(AppRoutes.getProjectRoute(project.id));
          }
        },
        borderRadius: BorderRadius.circular(AppTheme.radiusM),
        child: Container(
          padding: const EdgeInsets.all(AppTheme.spacingL),
          decoration: BoxDecoration(
            color: isDark ? AppColors.cardDark : AppColors.white,
            borderRadius: BorderRadius.circular(AppTheme.radiusM),
            border: Border.all(
              color: isDark
                  ? AppColors.white.withOpacity(0.1)
                  : AppColors.black.withOpacity(0.1),
              width: 1,
            ),
          ),
          child: Row(
            children: [
              // Project Image
              _buildProjectImage(project, isDark),

              const SizedBox(width: AppTheme.spacingL),

              // Content
              Expanded(
                child: _buildProjectContent(project, isDark),
              ),

              // Arrow
              Icon(
                AppIcons.arrowRight,
                size: 20,
                color: isDark
                    ? AppColors.textSecondaryDark
                    : AppColors.textSecondaryLight,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProjectImage(Project project, bool isDark) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: (isDark ? AppColors.accentDark : AppColors.accentLight)
            .withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppTheme.radiusS),
        image: project.imageUrl != null
            ? DecorationImage(
                image: NetworkImage(project.imageUrl!),
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: project.imageUrl == null
          ? Icon(
              AppIcons.technology,
              color: isDark ? AppColors.accentDark : AppColors.accentLight,
              size: 28,
            )
          : null,
    );
  }

  Widget _buildProjectContent(Project project, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          project.localizedTitle,
          style: AppFonts.h5().copyWith(
            color:
                isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
            fontWeight: AppFonts.semiBold,
          ),
        ),
        const SizedBox(height: AppTheme.spacingXS),
        Text(
          project.localizedShortDescription,
          style: AppFonts.bodySmall().copyWith(
            color: isDark
                ? AppColors.textSecondaryDark
                : AppColors.textSecondaryLight,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: AppTheme.spacingS),
        Wrap(
          spacing: AppTheme.spacingXS,
          runSpacing: AppTheme.spacingXS,
          children: project.technologies
              .take(3)
              .map<Widget>(
                (tech) => Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: isDark
                        ? AppColors.white.withOpacity(0.1)
                        : AppColors.black.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(AppTheme.radiusS),
                  ),
                  child: Text(
                    tech,
                    style: AppFonts.labelSmall().copyWith(
                      color: isDark
                          ? AppColors.textPrimaryDark
                          : AppColors.textPrimaryLight,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

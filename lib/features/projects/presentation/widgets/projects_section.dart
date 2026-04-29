import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youssef_salem_portfolio/features/projects/data/localized/localized_project_filter.dart';
import '../../domain/entities/project.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/assets/app_constants.dart';
import 'package:youssef_salem_portfolio/features/hero/data/local/personal_info_data.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../../../core/utils/url_helper.dart';
import '../../../../core/widgets/custom_show_more_button.dart';
import '../../../../core/widgets/projects_section/all_projects_dialog.dart';
import '../../../../core/widgets/projects_section/projects_empty_state.dart';
import '../../../../core/widgets/projects_section/projects_filter_tabs.dart';
import '../../../../core/widgets/projects_section/projects_grid.dart';
import '../../../../core/widgets/projects_section/projects_section_header.dart';
import '../../../../core/widgets/projects_section/projects_view_all_section.dart';
import '../bloc/projects_bloc.dart';
import '../bloc/projects_event.dart';
import '../bloc/projects_state.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = ResponsiveHelper.isMobile(screenWidth);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return BlocBuilder<ProjectsBloc, ProjectsState>(
      builder: (context, state) {
        if (state is ProjectsFailure) {
          return Center(child: Text(state.message));
        }
        if (state is! ProjectsReady) {
          return Container(
            width: double.infinity,
            color: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
            padding: const EdgeInsets.symmetric(vertical: AppTheme.spacingXXL),
            child: const Center(child: CircularProgressIndicator()),
          );
        }

        final filteredProjects = state.filteredVisible;

        return Container(
          width: double.infinity,
          color: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
          padding: EdgeInsets.symmetric(
            horizontal: ResponsiveHelper.getHorizontalPadding(screenWidth),
            vertical: AppTheme.spacingXXL,
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: ResponsiveHelper.getMaxWidth(screenWidth),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const ProjectsSectionHeader(),
                const SizedBox(height: AppTheme.spacingXL),
                ProjectsFilterTabs(
                  filters: state.filters,
                  selectedFilter: state.selectedFilter,
                  isMobile: isMobile,
                  onFilterSelected: (filter) {
                    context.read<ProjectsBloc>().add(
                          ProjectsFilterSelected(filter),
                        );
                  },
                ),
                const SizedBox(height: AppTheme.spacingXL),
                if (filteredProjects.isEmpty)
                  ProjectsEmptyState(
                    filterName: localizedProjectFilterLabel(
                      l10n,
                      state.selectedFilter,
                    ),
                  )
                else
                  ProjectsGrid(
                    projects: filteredProjects,
                    screenWidth: screenWidth,
                  ),
                if (state.canShowMore) ...[
                  const SizedBox(height: AppTheme.spacingXL),
                  CustomShowMoreButton(
                    label: l10n.showMore,
                    onPressed: () {
                      context.read<ProjectsBloc>().add(
                            const ProjectsShowMoreTapped(),
                          );
                    },
                  ),
                ],
                const SizedBox(height: AppTheme.spacingXL),
                ProjectsViewAllSection(
                  onViewAllProjects: () => _showAllProjectsDialog(
                    context,
                    state.allProjects,
                  ),
                  onVisitGitHub: _navigateToGitHub,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showAllProjectsDialog(BuildContext context, List<Project> projects) {
    showDialog<void>(
      context: context,
      builder: (context) => AllProjectsDialog(projects: projects),
    );
  }

  void _navigateToGitHub() {
    final githubLink = PersonalInfoData.socialLinks.firstWhere(
      (link) => link.name.toLowerCase() == 'github',
    );
    UrlHelper.launchURL(githubLink.url);
  }
}

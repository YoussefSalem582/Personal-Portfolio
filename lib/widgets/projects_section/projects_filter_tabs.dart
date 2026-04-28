import 'package:flutter/material.dart';
import '../../l10n/app_localizations.dart';
import '../../utils/assets/app_constants.dart';
import 'package:youssef_hassan_portfolio/features/projects/data/localized/localized_project_filter.dart';
import '../../theme/app_theme.dart';

/// Projects Filter Tabs
/// Displays filter chips for project categories
class ProjectsFilterTabs extends StatelessWidget {
  final List<String> filters;
  final String selectedFilter;
  final ValueChanged<String> onFilterSelected;
  final bool isMobile;

  const ProjectsFilterTabs({
    super.key,
    required this.filters,
    required this.selectedFilter,
    required this.onFilterSelected,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    if (isMobile) {
      return SizedBox(
        height: 50,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: filters.length,
          itemBuilder: (context, index) {
            final filter = filters[index];
            return Padding(
              padding: EdgeInsets.only(
                left: index == 0 ? 0 : AppTheme.spacingS,
                right: index == filters.length - 1 ? 0 : AppTheme.spacingS,
              ),
              child: _buildFilterChip(context, filter),
            );
          },
        ),
      );
    } else {
      return Wrap(
        spacing: AppTheme.spacingM,
        runSpacing: AppTheme.spacingM,
        alignment: WrapAlignment.center,
        children:
            filters.map((filter) => _buildFilterChip(context, filter)).toList(),
      );
    }
  }

  Widget _buildFilterChip(BuildContext context, String filter) {
    final isSelected = selectedFilter == filter;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context);
    final label = localizedProjectFilterLabel(l10n, filter);

    return FilterChip(
      label: Text(
        label,
        style: AppFonts.bodyMedium().copyWith(
          color: isSelected
              ? AppColors.white
              : (isDark
                  ? AppColors.textPrimaryDark
                  : AppColors.textPrimaryLight),
          fontWeight: isSelected ? AppFonts.semiBold : AppFonts.regular,
        ),
      ),
      selected: isSelected,
      onSelected: (selected) => onFilterSelected(filter),
      backgroundColor: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
      selectedColor: isDark ? AppColors.accentDark : AppColors.accentLight,
      side: BorderSide(
        color: isSelected
            ? (isDark ? AppColors.accentDark : AppColors.accentLight)
            : (isDark
                    ? AppColors.textSecondaryDark
                    : AppColors.textSecondaryLight)
                .withOpacity(0.3),
      ),
    );
  }
}

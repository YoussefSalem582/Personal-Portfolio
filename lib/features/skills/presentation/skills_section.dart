import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/utils/assets/app_constants.dart';
import '../../../core/utils/responsive_helper.dart';
import '../../../core/widgets/skills_section/skills_grid_widget.dart';
import '../../../core/widgets/skills_section/skills_section_header.dart';
import 'bloc/skills_bloc.dart';
import 'bloc/skills_state.dart';

/// Skills Section - Main Screen
class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = ResponsiveHelper.isMobile(screenWidth);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: isMobile
            ? ResponsiveHelper.getVerticalPadding(screenWidth) * 0.8
            : ResponsiveHelper.getVerticalPadding(screenWidth),
        horizontal: ResponsiveHelper.getHorizontalPadding(screenWidth),
      ),
      decoration: BoxDecoration(
        color: AppColors.getBackground(isDark),
      ),
      child: Column(
        children: [
          SkillsSectionHeader(
            isDark: isDark,
            isMobile: isMobile,
          ),
          SizedBox(
              height: isMobile
                  ? ResponsiveHelper.getSectionSpacing(screenWidth) * 0.4
                  : ResponsiveHelper.getSectionSpacing(screenWidth) * 0.5),
          BlocBuilder<SkillsBloc, SkillsState>(
            builder: (context, state) {
              if (state is SkillsFailure) {
                return Text(state.message);
              }
              if (state is! SkillsLoaded) {
                return const Padding(
                  padding: EdgeInsets.all(24),
                  child: CircularProgressIndicator(),
                );
              }
              return SkillsGridWidget(
                isDark: isDark,
                isMobile: isMobile,
                categories: state.content.skillCategories,
              );
            },
          ),
        ],
      ),
    );
  }
}

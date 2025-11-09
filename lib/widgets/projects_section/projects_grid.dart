import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../utils/responsive_helper.dart';
import '../project_card_advanced.dart';

/// Projects Grid
/// Displays projects in a responsive grid with staggered animations
class ProjectsGrid extends StatelessWidget {
  final List<dynamic> projects;
  final double screenWidth;

  const ProjectsGrid({
    super.key,
    required this.projects,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    final columns = ResponsiveHelper.getProjectGridColumns(screenWidth);
    final isMobile = ResponsiveHelper.isMobile(screenWidth);

    return AnimationLimiter(
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: columns,
          crossAxisSpacing: isMobile ? 12 : 16,
          mainAxisSpacing: isMobile ? 12 : 16,
          childAspectRatio: isMobile ? 0.70 : 0.9,
        ),
        itemCount: projects.length,
        itemBuilder: (context, index) {
          return AnimationConfiguration.staggeredGrid(
            position: index,
            duration: const Duration(milliseconds: 300),
            columnCount: columns,
            child: FadeInAnimation(
              child: ProjectCardAdvanced(
                project: projects[index],
                isCompact: isMobile,
                index: index,
              ),
            ),
          );
        },
      ),
    );
  }
}

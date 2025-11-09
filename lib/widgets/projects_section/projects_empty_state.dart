import 'package:flutter/material.dart';
import '../../utils/assets/app_constants.dart';
import '../common/empty_state.dart';

/// Projects Empty State
/// Displays a message when no projects are found for the selected filter
class ProjectsEmptyState extends StatelessWidget {
  final String filterName;

  const ProjectsEmptyState({
    super.key,
    required this.filterName,
  });

  @override
  Widget build(BuildContext context) {
    return EmptyState(
      icon: AppIcons.search,
      message: 'No projects found for "$filterName"',
    );
  }
}

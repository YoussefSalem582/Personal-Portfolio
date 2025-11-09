import 'package:flutter/material.dart';
import '../common/section_header.dart';

/// Projects Section Header
/// Displays the section title, underline, and description
class ProjectsSectionHeader extends StatelessWidget {
  const ProjectsSectionHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const SectionHeader(
      title: 'My Projects',
      subtitle: 'Here are some of the projects I\'ve worked on',
      dividerWidth: 60,
    );
  }
}

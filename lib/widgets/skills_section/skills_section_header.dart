import 'package:flutter/material.dart';
import '../common/section_header.dart';

/// Skills Section Header Widget
/// Displays the title and description for the skills section
class SkillsSectionHeader extends StatelessWidget {
  final bool isDark;
  final bool isMobile;

  const SkillsSectionHeader({
    super.key,
    required this.isDark,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return SectionHeader(
      title: 'My Tech Stack',
      subtitle:
          'A collection of technologies I am proficient in and enjoy working with.',
      useShaderMask: true,
      isMobile: isMobile,
    );
  }
}

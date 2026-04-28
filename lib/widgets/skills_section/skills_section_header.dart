import 'package:flutter/material.dart';
import '../../l10n/app_localizations.dart';
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
    final l10n = AppLocalizations.of(context);
    return SectionHeader(
      title: l10n.sectionSkillsTitle,
      subtitle: l10n.sectionSkillsSubtitle,
      useShaderMask: true,
      isMobile: isMobile,
    );
  }
}

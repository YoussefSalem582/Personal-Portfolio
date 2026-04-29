import 'package:flutter/material.dart';
import '../../../l10n/app_localizations.dart';
import '../common/section_header.dart';

/// Projects Section Header
/// Displays the section title, underline, and description
class ProjectsSectionHeader extends StatelessWidget {
  const ProjectsSectionHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return SectionHeader(
      title: l10n.sectionProjectsTitle,
      subtitle: l10n.sectionProjectsSubtitle,
      dividerWidth: 60,
    );
  }
}

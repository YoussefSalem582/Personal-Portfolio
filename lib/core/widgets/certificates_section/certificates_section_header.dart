import 'package:flutter/material.dart';
import '../../../l10n/app_localizations.dart';
import '../common/section_header.dart';

/// Certificates Section Header
/// Displays the section title, gradient divider, and subtitle
class CertificatesSectionHeader extends StatelessWidget {
  const CertificatesSectionHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return SectionHeader(
      title: l10n.sectionCertificatesTitle,
      subtitle: l10n.sectionCertificatesSubtitle,
      dividerHeight: 5,
    );
  }
}

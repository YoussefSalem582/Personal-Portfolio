import 'package:flutter/material.dart';
import '../common/section_header.dart';

/// Certificates Section Header
/// Displays the section title, gradient divider, and subtitle
class CertificatesSectionHeader extends StatelessWidget {
  const CertificatesSectionHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const SectionHeader(
      title: 'Certificates & Achievements',
      subtitle:
          'Professional certifications showcasing continuous learning and expertise',
      dividerHeight: 5,
    );
  }
}

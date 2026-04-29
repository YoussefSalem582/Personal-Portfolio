import 'package:flutter/material.dart';
import '../common/info_card.dart';

/// Certificate Dialog Info Card
/// Wrapper for InfoCard with certificate-specific styling
class CertificateDialogInfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String content;
  final Color accentColor;
  final bool isDark;

  const CertificateDialogInfoCard({
    super.key,
    required this.icon,
    required this.title,
    required this.content,
    required this.accentColor,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return InfoCard(
      icon: icon,
      title: title,
      content: content,
      iconColor: accentColor,
    );
  }
}

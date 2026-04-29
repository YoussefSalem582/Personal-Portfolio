import 'package:flutter/material.dart';
import '../../../l10n/app_localizations.dart';
import '../../../models/certificate.dart';
import '../../../utils/assets/app_constants.dart';
import '../../theme/app_theme.dart';

/// Certificate Dialog Image
/// Displays the certificate image with styling
class CertificateDialogImage extends StatelessWidget {
  final Certificate certificate;
  final Color accentColor;
  final bool isDark;

  const CertificateDialogImage({
    super.key,
    required this.certificate,
    required this.accentColor,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    if (certificate.imageUrl == null) return const SizedBox.shrink();

    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(
        maxHeight: 500,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppTheme.radiusL),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            accentColor.withOpacity(0.1),
            accentColor.withOpacity(0.05),
          ],
        ),
        border: Border.all(
          color: accentColor.withOpacity(0.2),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: accentColor.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppTheme.radiusL),
        child: Image.asset(
          certificate.imageUrl!,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) {
            return _buildPlaceholder(context);
          },
        ),
      ),
    );
  }

  Widget _buildPlaceholder(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            AppIcons.certificate,
            size: 80,
            color: accentColor.withOpacity(0.5),
          ),
          const SizedBox(height: AppTheme.spacingM),
          Text(
            l10n.certificateImageUnavailable,
            style: AppFonts.bodyLarge().copyWith(
              color: accentColor,
              fontWeight: AppFonts.semiBold,
            ),
          ),
        ],
      ),
    );
  }
}

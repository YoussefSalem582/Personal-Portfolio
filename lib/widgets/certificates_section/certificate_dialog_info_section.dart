import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../l10n/app_localizations.dart';
import '../../models/certificate.dart';
import '../../utils/assets/app_constants.dart';
import 'package:youssef_hassan_portfolio/features/portfolio/data/localized/localized_extensions.dart';
import '../../theme/app_theme.dart';
import 'certificate_dialog_info_card.dart';

/// Certificate Dialog Info Section
/// Displays issuer, date, description, and verification status
class CertificateDialogInfoSection extends StatelessWidget {
  final Certificate certificate;
  final Color accentColor;
  final bool isDark;

  const CertificateDialogInfoSection({
    super.key,
    required this.certificate,
    required this.accentColor,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Issuer Card
        CertificateDialogInfoCard(
          icon: AppIcons.experience,
          title: l10n.certificateIssuedByLabel,
          content: certificate.localizedIssuer,
          accentColor: accentColor,
          isDark: isDark,
        ),

        const SizedBox(height: AppTheme.spacingM),

        // Date Card
        CertificateDialogInfoCard(
          icon: AppIcons.date,
          title: l10n.certificateIssueDateLabel,
          content: _formatFullDate(context, certificate.issueDate),
          accentColor: accentColor,
          isDark: isDark,
        ),

        const SizedBox(height: AppTheme.spacingM),

        // Description Card
        CertificateDialogInfoCard(
          icon: AppIcons.blog,
          title: l10n.certificateDescriptionLabel,
          content: certificate.localizedDescription,
          accentColor: accentColor,
          isDark: isDark,
        ),

        // Verified Badge
        if (certificate.credentialUrl != null) ...[
          const SizedBox(height: AppTheme.spacingM),
          _buildVerifiedBanner(context),
        ],
      ],
    );
  }

  Widget _buildVerifiedBanner(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingM),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.successLight.withOpacity(0.15),
            AppColors.successLight.withOpacity(0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(AppTheme.radiusM),
        border: Border.all(
          color: AppColors.successLight.withOpacity(0.3),
          width: 2,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.successLight.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              AppIcons.badge,
              color: AppColors.successLight,
              size: 24,
            ),
          ),
          const SizedBox(width: AppTheme.spacingM),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.certificateVerifiedTitle,
                  style: AppFonts.labelLarge().copyWith(
                    color: AppColors.successLight,
                    fontWeight: AppFonts.bold,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  l10n.certificateValidatedOnlineHint,
                  style: AppFonts.bodySmall().copyWith(
                    color: AppColors.successLight.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Month and year in the current locale (e.g. April 2026 / أبريل 2026).
  String _formatFullDate(BuildContext context, DateTime date) {
    final locale = Localizations.localeOf(context).toString();
    return DateFormat.yMMMM(locale).format(date);
  }
}

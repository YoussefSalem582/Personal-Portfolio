import 'package:flutter/material.dart';
import '../../models/certificate.dart';
import '../../utils/assets/app_constants.dart';
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Issuer Card
        CertificateDialogInfoCard(
          icon: AppIcons.experience,
          title: 'Issued by',
          content: certificate.issuer,
          accentColor: accentColor,
          isDark: isDark,
        ),

        const SizedBox(height: AppTheme.spacingM),

        // Date Card
        CertificateDialogInfoCard(
          icon: AppIcons.date,
          title: 'Issue Date',
          content: _formatFullDate(certificate.issueDate),
          accentColor: accentColor,
          isDark: isDark,
        ),

        const SizedBox(height: AppTheme.spacingM),

        // Description Card
        CertificateDialogInfoCard(
          icon: AppIcons.blog,
          title: 'Description',
          content: certificate.description,
          accentColor: accentColor,
          isDark: isDark,
        ),

        // Verified Badge
        if (certificate.credentialUrl != null) ...[
          const SizedBox(height: AppTheme.spacingM),
          _buildVerifiedBanner(),
        ],
      ],
    );
  }

  Widget _buildVerifiedBanner() {
    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingM),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.successLight.withValues(alpha: 0.15),
            AppColors.successLight.withValues(alpha: 0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(AppTheme.radiusM),
        border: Border.all(
          color: AppColors.successLight.withValues(alpha: 0.3),
          width: 2,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.successLight.withValues(alpha: 0.2),
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
                  'Verified Certificate',
                  style: AppFonts.labelLarge().copyWith(
                    color: AppColors.successLight,
                    fontWeight: AppFonts.bold,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'This certificate can be validated online',
                  style: AppFonts.bodySmall().copyWith(
                    color: AppColors.successLight.withValues(alpha: 0.8),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Formats date to "Month YYYY" format
  String _formatFullDate(DateTime date) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return '${months[date.month - 1]} ${date.year}';
  }
}

import 'package:flutter/material.dart';
import '../../../l10n/app_localizations.dart';
import '../../../models/certificate.dart';
import '../../../utils/assets/app_constants.dart';
import '../../../utils/responsive_helper.dart';
import '../../../utils/url_helper.dart';
import '../../theme/app_theme.dart';

/// Certificate Dialog Actions
/// Action buttons section (PDF and Verify)
class CertificateDialogActions extends StatelessWidget {
  final Certificate certificate;
  final Color accentColor;
  final bool isDark;

  const CertificateDialogActions({
    super.key,
    required this.certificate,
    required this.accentColor,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = ResponsiveHelper.isMobile(screenWidth);
    final l10n = AppLocalizations.of(context);

    return Container(
      padding: EdgeInsets.all(isMobile ? AppTheme.spacingM : AppTheme.spacingL),
      decoration: BoxDecoration(
        color:
            isDark ? AppColors.surfaceDark.withOpacity(0.3) : AppColors.gray50,
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(AppTheme.radiusXL + 4),
        ),
        border: Border(
          top: BorderSide(
            color: isDark
                ? AppColors.textSecondaryDark.withOpacity(0.1)
                : AppColors.gray200,
            width: 1,
          ),
        ),
      ),
      child: isMobile ? _buildMobileLayout(l10n) : _buildDesktopLayout(l10n),
    );
  }

  Widget _buildMobileLayout(AppLocalizations l10n) {
    return Column(
      children: [
        if (certificate.pdfUrl != null) _buildPDFButton(l10n, true),
        if (certificate.pdfUrl != null && certificate.credentialUrl != null)
          const SizedBox(height: AppTheme.spacingM),
        if (certificate.credentialUrl != null) _buildVerifyButton(l10n, true),
      ],
    );
  }

  Widget _buildDesktopLayout(AppLocalizations l10n) {
    return Row(
      children: [
        if (certificate.pdfUrl != null)
          Expanded(child: _buildPDFButton(l10n, false)),
        if (certificate.pdfUrl != null && certificate.credentialUrl != null)
          const SizedBox(width: AppTheme.spacingM),
        if (certificate.credentialUrl != null)
          Expanded(child: _buildVerifyButton(l10n, false)),
      ],
    );
  }

  Widget _buildPDFButton(AppLocalizations l10n, bool fullWidth) {
    return SizedBox(
      width: fullWidth ? double.infinity : null,
      child: ElevatedButton.icon(
        onPressed: () {
          if (certificate.pdfUrl != null) {
            UrlHelper.openFile(certificate.pdfUrl!);
          }
        },
        icon: const Icon(AppIcons.pdf, size: 22),
        label: Text(l10n.certificateViewPdf),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.errorLight,
          foregroundColor: AppColors.white,
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 24,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppTheme.radiusM),
          ),
          elevation: 0,
          shadowColor: AppColors.errorLight.withOpacity(0.3),
        ).copyWith(
          elevation: WidgetStateProperty.resolveWith<double>(
            (states) => states.contains(WidgetState.hovered) ? 8 : 0,
          ),
        ),
      ),
    );
  }

  Widget _buildVerifyButton(AppLocalizations l10n, bool fullWidth) {
    return SizedBox(
      width: fullWidth ? double.infinity : null,
      child: OutlinedButton.icon(
        onPressed: () {
          if (certificate.credentialUrl != null) {
            UrlHelper.launchURL(certificate.credentialUrl!);
          }
        },
        icon: const Icon(AppIcons.badge, size: 22),
        label: Text(l10n.certificateVerify),
        style: OutlinedButton.styleFrom(
          foregroundColor: accentColor,
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 24,
          ),
          side: BorderSide(color: accentColor, width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppTheme.radiusM),
          ),
        ).copyWith(
          backgroundColor: WidgetStateProperty.resolveWith<Color>(
            (states) => states.contains(WidgetState.hovered)
                ? accentColor.withOpacity(0.1)
                : AppColors.transparent,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../l10n/app_localizations.dart';
import '../../models/certificate.dart';
import '../../utils/assets/app_constants.dart';
import '../../utils/data/localized/localized_extensions.dart';
import '../../utils/responsive_helper.dart';
import '../../theme/app_theme.dart';

/// Certificate Card Info Section
/// Displays certificate title, issuer, and duration
class CertificateCardInfo extends StatelessWidget {
  final Certificate certificate;
  final Color accentColor;
  final bool isDark;

  const CertificateCardInfo({
    super.key,
    required this.certificate,
    required this.accentColor,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = ResponsiveHelper.isMobile(screenWidth);
    final isSmallMobile = ResponsiveHelper.isSmallMobile(screenWidth);

    return Padding(
      padding: EdgeInsets.all(isMobile ? AppTheme.spacingS : AppTheme.spacingM),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Certificate Title
          _buildTitle(isMobile, isSmallMobile),

          SizedBox(height: isMobile ? 4 : AppTheme.spacingS),

          // Issuer with Icon
          _buildIssuer(isMobile, isSmallMobile),

          const Spacer(),

        // Duration and Action Row
        _buildBottomRow(context, isMobile, isSmallMobile),
        ],
      ),
    );
  }

  Widget _buildTitle(bool isMobile, bool isSmallMobile) {
    return Text(
      certificate.localizedTitle,
      style: AppFonts.h4().copyWith(
        fontSize: isSmallMobile ? 13 : (isMobile ? 14 : null),
        fontWeight: AppFonts.bold,
        height: 1.2,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildIssuer(bool isMobile, bool isSmallMobile) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(isMobile ? 4 : 6),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                accentColor.withOpacity(0.15),
                accentColor.withOpacity(0.05),
              ],
            ),
            borderRadius: BorderRadius.circular(isMobile ? 6 : 8),
          ),
          child: Icon(
            AppIcons.experience,
            size: isMobile ? 12 : 14,
            color: accentColor,
          ),
        ),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            certificate.localizedIssuer,
            style: AppFonts.labelMedium().copyWith(
              fontSize: isSmallMobile ? 11 : (isMobile ? 12 : null),
              color: accentColor,
              fontWeight: AppFonts.bold,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildBottomRow(
      BuildContext context, bool isMobile, bool isSmallMobile) {
    final duration = _extractDuration();
    final l10n = AppLocalizations.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Duration Badge (if available)
        if (duration != null)
          Flexible(
            child: _buildDurationBadge(duration, isMobile, isSmallMobile),
          ),

        if (!isMobile && duration != null) const SizedBox(width: 8),

        // View Details Button
        _buildViewButton(context, isMobile, l10n),
      ],
    );
  }

  Widget _buildDurationBadge(
      String duration, bool isMobile, bool isSmallMobile) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 6 : 10,
        vertical: isMobile ? 4 : 6,
      ),
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : AppColors.gray100,
        borderRadius: BorderRadius.circular(isMobile ? 8 : 10),
        border: Border.all(
          color: isDark
              ? AppColors.textSecondaryDark.withOpacity(0.2)
              : AppColors.gray300,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            AppIcons.date,
            size: isMobile ? 10 : 12,
            color: isDark
                ? AppColors.textSecondaryDark
                : AppColors.textSecondaryLight,
          ),
          SizedBox(width: isMobile ? 4 : 6),
          Flexible(
            child: Text(
              duration,
              style: AppFonts.bodySmall().copyWith(
                fontSize: isSmallMobile ? 9 : (isMobile ? 10 : null),
                color: isDark
                    ? AppColors.textSecondaryDark
                    : AppColors.textSecondaryLight,
                fontWeight: AppFonts.semiBold,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildViewButton(
      BuildContext context, bool isMobile, AppLocalizations l10n) {
    return Tooltip(
      message: l10n.tooltipCertificateOpenDetails,
      child: Container(
        padding: EdgeInsets.all(isMobile ? 6 : 8),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [accentColor, accentColor.withOpacity(0.8)],
          ),
          borderRadius: BorderRadius.circular(isMobile ? 8 : 10),
          boxShadow: [
            BoxShadow(
              color: accentColor.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Icon(
          AppIcons.arrowRight,
          size: isMobile ? 14 : 18,
          color: AppColors.white,
        ),
      ),
    );
  }

  /// Extracts duration information from certificate description
  String? _extractDuration() {
    final description = certificate.description;
    final durationRegex = RegExp(
      r'(?:Duration|المدة):\s*(.+?)(?:\n|$)',
      multiLine: true,
    );
    final match = durationRegex.firstMatch(description);

    if (match != null && match.groupCount > 0) {
      return match.group(1)?.trim();
    }
    return null;
  }
}

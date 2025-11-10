import 'package:flutter/material.dart';
import '../../models/certificate.dart';
import '../../utils/assets/app_constants.dart';
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
          _buildBottomRow(isMobile, isSmallMobile),
        ],
      ),
    );
  }

  Widget _buildTitle(bool isMobile, bool isSmallMobile) {
    return Text(
      certificate.title,
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
                accentColor.withValues(alpha: 0.15),
                accentColor.withValues(alpha: 0.05),
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
            certificate.issuer,
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

  Widget _buildBottomRow(bool isMobile, bool isSmallMobile) {
    final duration = _extractDuration();

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
        _buildViewButton(isMobile),
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
              ? AppColors.textSecondaryDark.withValues(alpha: 0.2)
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

  Widget _buildViewButton(bool isMobile) {
    return Container(
      padding: EdgeInsets.all(isMobile ? 6 : 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [accentColor, accentColor.withValues(alpha: 0.8)],
        ),
        borderRadius: BorderRadius.circular(isMobile ? 8 : 10),
        boxShadow: [
          BoxShadow(
            color: accentColor.withValues(alpha: 0.3),
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
    );
  }

  /// Extracts duration information from certificate description
  String? _extractDuration() {
    final description = certificate.description;
    final durationRegex = RegExp(r'Duration:\s*(.+?)(?:\n|$)', multiLine: true);
    final match = durationRegex.firstMatch(description);

    if (match != null && match.groupCount > 0) {
      return match.group(1)?.trim();
    }
    return null;
  }
}

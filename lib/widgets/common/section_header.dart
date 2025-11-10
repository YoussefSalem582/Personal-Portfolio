import 'package:flutter/material.dart';
import '../../utils/assets/app_constants.dart';
import '../../theme/app_theme.dart';

/// Common Section Header Widget
/// Reusable header for all sections with title, gradient divider, and subtitle
class SectionHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final double? dividerWidth;
  final double? dividerHeight;
  final bool useShaderMask;
  final TextAlign textAlign;
  final EdgeInsets? padding;
  final bool isMobile;

  const SectionHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.dividerWidth,
    this.dividerHeight,
    this.useShaderMask = false,
    this.textAlign = TextAlign.center,
    this.padding,
    this.isMobile = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallMobile = screenWidth < 375;

    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: textAlign == TextAlign.center
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        children: [
          // Title
          _buildTitle(isDark, isSmallMobile),

          SizedBox(height: isMobile ? AppTheme.spacingS : AppTheme.spacingM),

          // Gradient Divider
          _buildGradientDivider(isDark, isSmallMobile),

          if (subtitle != null) ...[
            SizedBox(height: isMobile ? AppTheme.spacingM : AppTheme.spacingL),
            _buildSubtitle(isDark, isSmallMobile),
          ],
        ],
      ),
    );
  }

  Widget _buildTitle(bool isDark, bool isSmallMobile) {
    final titleWidget = Text(
      title,
      style: isMobile
          ? AppFonts.h3().copyWith(
              fontSize: isSmallMobile ? 28 : 32,
              fontWeight: AppFonts.extraBold,
              letterSpacing: -0.5,
            )
          : AppFonts.h1().copyWith(
              fontWeight: AppFonts.black,
              letterSpacing: -0.5,
            ),
      textAlign: textAlign,
    );

    if (useShaderMask) {
      return ShaderMask(
        shaderCallback: (bounds) => LinearGradient(
          colors: isDark
              ? [AppColors.primaryLight, AppColors.accentLight]
              : [AppColors.accentLight, AppColors.primaryLight],
        ).createShader(bounds),
        child: Text(
          title,
          style: isMobile
              ? AppFonts.h3(color: AppColors.white).copyWith(
                  fontSize: isSmallMobile ? 28 : 32,
                  fontWeight: AppFonts.extraBold,
                  letterSpacing: -0.5,
                )
              : AppFonts.h2(color: AppColors.white).copyWith(
                  fontWeight: AppFonts.extraBold,
                  letterSpacing: -1,
                ),
          textAlign: textAlign,
        ),
      );
    }

    return titleWidget;
  }

  Widget _buildGradientDivider(bool isDark, bool isSmallMobile) {
    final width =
        dividerWidth ?? (isMobile ? (isSmallMobile ? 50.0 : 60.0) : 80.0);
    final height = dividerHeight ?? (isMobile ? 3.0 : 4.0);

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: isDark
            ? AppColors.primaryGradientDark
            : AppColors.primaryGradientLight,
        borderRadius: BorderRadius.circular(height / 2),
        boxShadow: [
          BoxShadow(
            color: (isDark ? AppColors.accentDark : AppColors.accentLight)
                .withValues(alpha: 0.3),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
    );
  }

  Widget _buildSubtitle(bool isDark, bool isSmallMobile) {
    return Container(
      constraints: BoxConstraints(maxWidth: isMobile ? double.infinity : 700),
      child: Text(
        subtitle!,
        style: AppFonts.bodyLarge().copyWith(
          color: isDark
              ? AppColors.textSecondaryDark
              : AppColors.textSecondaryLight,
          fontSize: isMobile ? (isSmallMobile ? 14 : 15) : null,
          height: 1.5,
          letterSpacing: 0.2,
        ),
        textAlign: textAlign,
      ),
    );
  }
}

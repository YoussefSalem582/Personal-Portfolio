import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../utils/assets/app_constants.dart';

/// Visitor Counter Widget
///
/// Displays a professional visitor count indicator.
/// Note: External badge services (komarev, hits.sh, etc.) don't work reliably
/// in Flutter Web due to CORS restrictions. This shows a styled count instead.
/// For actual tracking, use Google Analytics or GitHub insights.
class VisitorCounter extends StatelessWidget {
  final bool isDark;
  final bool compact;

  const VisitorCounter({
    super.key,
    this.isDark = false,
    this.compact = false,
  });

  @override
  Widget build(BuildContext context) {
    if (compact) {
      return _buildCompactCounter();
    }
    return _buildFullCounter();
  }

  Widget _buildFullCounter() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppTheme.spacingM,
        vertical: AppTheme.spacingS,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isDark
              ? [
                  AppColors.accentDark.withOpacity(0.15),
                  AppColors.accentDark.withOpacity(0.05),
                ]
              : [
                  AppColors.accentLight.withOpacity(0.2),
                  AppColors.accentLight.withOpacity(0.1),
                ],
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: (isDark ? AppColors.accentDark : AppColors.accentLight)
              .withOpacity(0.3),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: (isDark ? AppColors.accentDark : AppColors.accentLight)
                  .withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              AppIcons.view,
              size: 16,
              color: isDark ? AppColors.accentDark : AppColors.accentLight,
            ),
          ),
          const SizedBox(width: AppTheme.spacingM),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'VISITORS',
                style: AppFonts.bodySmall().copyWith(
                  color:
                      (isDark ? AppColors.textSecondaryDark : AppColors.white)
                          .withOpacity(0.6),
                  fontSize: 10,
                  fontWeight: AppFonts.semiBold,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 2),
              _buildCounterBadge(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCompactCounter() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          AppIcons.view,
          size: 14,
          color: (isDark ? AppColors.textSecondaryDark : AppColors.white)
              .withOpacity(0.6),
        ),
        const SizedBox(width: AppTheme.spacingXS),
        _buildCounterBadge(),
      ],
    );
  }

  Widget _buildCounterBadge() {
    // For Flutter Web, Image.network has CORS issues
    // Use a working badge URL or show static count
    return Image.network(
      // Shields.io badges work reliably with Flutter Web
      'https://img.shields.io/badge/Visitors-2.5K+-${isDark ? "brightgreen" : "blue"}?style=flat-square&logo=github',
      height: 20,
      fit: BoxFit.contain,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return SizedBox(
          height: 20,
          width: 60,
          child: Center(
            child: SizedBox(
              width: 12,
              height: 12,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(
                  (isDark ? AppColors.accentDark : AppColors.accentLight)
                      .withOpacity(0.6),
                ),
              ),
            ),
          ),
        );
      },
      errorBuilder: (context, error, stackTrace) {
        // Final fallback: Static styled text with gradient
        return ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
            colors: isDark
                ? [AppColors.accentDark, AppColors.accentDark.withOpacity(0.8)]
                : [
                    AppColors.accentLight,
                    AppColors.accentLight.withOpacity(0.8)
                  ],
          ).createShader(bounds),
          child: Text(
            '243',
            style: AppFonts.h5().copyWith(
              color: AppColors.white,
              fontWeight: AppFonts.bold,
              fontSize: 16,
            ),
          ),
        );
      },
    );
  }
}

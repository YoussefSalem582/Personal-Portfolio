import 'package:flutter/material.dart';
import '../../utils/app_constants.dart';
import '../../utils/url_helper.dart';

import '../../theme/app_theme.dart';

/// Action buttons section with modern design
class ActionButtonsWidget extends StatelessWidget {
  final String? liveUrl;
  final String? githubUrl;

  const ActionButtonsWidget({
    super.key,
    this.liveUrl,
    this.githubUrl,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingXL),
      decoration: BoxDecoration(
        gradient: isDark
            ? LinearGradient(
                colors: [
                  AppColors.cardDark,
                  AppColors.cardDark.withValues(alpha: 0.5),
                ],
              )
            : LinearGradient(
                colors: [
                  AppColors.gray50,
                  AppColors.white,
                ],
              ),
        borderRadius: BorderRadius.circular(AppTheme.radiusL),
        border: Border.all(
          color: (isDark ? AppColors.accentDark : AppColors.accentLight)
              .withValues(alpha: 0.2),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: (isDark ? AppColors.black : AppColors.gray300)
                .withValues(alpha: 0.1),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          // Call to action text
          Text(
            'Want to learn more?',
            style: AppFonts.h5(
              color: isDark
                  ? AppColors.textPrimaryDark
                  : AppColors.textPrimaryLight,
            ).copyWith(
              fontWeight: AppFonts.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppTheme.spacingM),
          Text(
            'Explore the full case study or check out the source code',
            style: AppFonts.bodyMedium().copyWith(
              color: isDark
                  ? AppColors.textSecondaryDark
                  : AppColors.textSecondaryLight,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppTheme.spacingXL),

          // View Case Study button
          if (liveUrl != null)
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => UrlHelper.launchURL(liveUrl!),
                icon: const Icon(AppIcons.blog, size: 22),
                label: const Text('View Full Case Study'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  backgroundColor:
                      isDark ? AppColors.accentDark : AppColors.accentLight,
                  foregroundColor: AppColors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  elevation: 0,
                  shadowColor:
                      (isDark ? AppColors.accentDark : AppColors.accentLight)
                          .withValues(alpha: 0.5),
                  textStyle: AppFonts.labelLarge().copyWith(
                    fontWeight: AppFonts.bold,
                    letterSpacing: 0.3,
                  ),
                ),
              ),
            ),

          if (liveUrl != null && githubUrl != null)
            const SizedBox(height: AppTheme.spacingM),

          // View Code button
          if (githubUrl != null)
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () => UrlHelper.launchURL(githubUrl!),
                icon: const Icon(AppIcons.github, size: 22),
                label: const Text('View Source Code'),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  side: BorderSide(
                    color:
                        isDark ? AppColors.accentDark : AppColors.accentLight,
                    width: 2,
                  ),
                  foregroundColor:
                      isDark ? AppColors.accentDark : AppColors.accentLight,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  textStyle: AppFonts.labelLarge().copyWith(
                    fontWeight: AppFonts.bold,
                    letterSpacing: 0.3,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

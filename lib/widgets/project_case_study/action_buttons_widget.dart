import 'package:flutter/material.dart';
import '../../utils/assets/app_constants.dart';
import '../../utils/url_helper.dart';

import '../../theme/app_theme.dart';

/// Action buttons section with modern design
class ActionButtonsWidget extends StatelessWidget {
  final String? liveUrl;
  final String? githubUrl;
  final String? videoUrl;
  final String? shortVideoUrl;
  final bool isMobile;
  final bool isSmallMobile;

  const ActionButtonsWidget({
    super.key,
    this.liveUrl,
    this.githubUrl,
    this.videoUrl,
    this.shortVideoUrl,
    this.isMobile = false,
    this.isSmallMobile = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding:
          EdgeInsets.all(isMobile ? AppTheme.spacingL : AppTheme.spacingXL),
      decoration: BoxDecoration(
        gradient: isDark
            ? LinearGradient(
                colors: [
                  AppColors.cardDark,
                  AppColors.cardDark.withOpacity(0.5),
                ],
              )
            : const LinearGradient(
                colors: [
                  AppColors.gray50,
                  AppColors.white,
                ],
              ),
        borderRadius: BorderRadius.circular(
            isMobile ? AppTheme.radiusM : AppTheme.radiusL),
        border: Border.all(
          color: (isDark ? AppColors.accentDark : AppColors.accentLight)
              .withOpacity(0.2),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color:
                (isDark ? AppColors.black : AppColors.gray300).withOpacity(0.1),
            blurRadius: isMobile ? 12 : 20,
            offset: Offset(0, isMobile ? 4 : 8),
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
              fontSize: isMobile ? (isSmallMobile ? 18 : 20) : 24,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: isMobile ? AppTheme.spacingS : AppTheme.spacingM),
          Text(
            'Explore the full case study or check out the source code',
            style: AppFonts.bodyMedium().copyWith(
              color: isDark
                  ? AppColors.textSecondaryDark
                  : AppColors.textSecondaryLight,
              fontSize: isMobile ? (isSmallMobile ? 13 : 14) : 15,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: isMobile ? AppTheme.spacingL : AppTheme.spacingXL),

          // Watch Demo Video button
          if (videoUrl != null)
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => UrlHelper.launchURL(videoUrl!),
                icon: Icon(Icons.play_circle_outline, size: isMobile ? 20 : 24),
                label: const Text('Watch Demo Video'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    vertical: isMobile ? (isSmallMobile ? 14 : 16) : 20,
                  ),
                  backgroundColor:
                      isDark ? AppColors.accentDark : AppColors.accentLight,
                  foregroundColor: AppColors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(isMobile ? 10 : 14),
                  ),
                  elevation: 0,
                  shadowColor:
                      (isDark ? AppColors.accentDark : AppColors.accentLight)
                          .withOpacity(0.5),
                  textStyle: AppFonts.labelLarge().copyWith(
                    fontWeight: AppFonts.bold,
                    letterSpacing: 0.3,
                    fontSize: isMobile ? (isSmallMobile ? 14 : 15) : 16,
                  ),
                ),
              ),
            ),

          if (videoUrl != null && (liveUrl != null || githubUrl != null))
            SizedBox(height: isMobile ? AppTheme.spacingS : AppTheme.spacingM),

          // Watch Short Video button
          if (shortVideoUrl != null)
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => UrlHelper.launchURL(shortVideoUrl!),
                icon: Icon(Icons.video_library_outlined,
                    size: isMobile ? 20 : 24),
                label: const Text('Watch Short Video'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    vertical: isMobile ? (isSmallMobile ? 14 : 16) : 20,
                  ),
                  backgroundColor: isDark
                      ? AppColors.accentDark.withOpacity(0.8)
                      : AppColors.accentLight.withOpacity(0.8),
                  foregroundColor: AppColors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(isMobile ? 10 : 14),
                  ),
                  elevation: 0,
                  textStyle: AppFonts.labelLarge().copyWith(
                    fontWeight: AppFonts.bold,
                    letterSpacing: 0.3,
                    fontSize: isMobile ? (isSmallMobile ? 14 : 15) : 16,
                  ),
                ),
              ),
            ),

          if (shortVideoUrl != null && (liveUrl != null || githubUrl != null))
            SizedBox(height: isMobile ? AppTheme.spacingS : AppTheme.spacingM),

          // View Case Study button
          if (liveUrl != null)
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => UrlHelper.launchURL(liveUrl!),
                icon: Icon(AppIcons.blog, size: isMobile ? 18 : 22),
                label: const Text('View Full Case Study'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    vertical: isMobile ? (isSmallMobile ? 14 : 16) : 20,
                  ),
                  backgroundColor:
                      isDark ? AppColors.accentDark : AppColors.accentLight,
                  foregroundColor: AppColors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(isMobile ? 10 : 14),
                  ),
                  elevation: 0,
                  shadowColor:
                      (isDark ? AppColors.accentDark : AppColors.accentLight)
                          .withOpacity(0.5),
                  textStyle: AppFonts.labelLarge().copyWith(
                    fontWeight: AppFonts.bold,
                    letterSpacing: 0.3,
                    fontSize: isMobile ? (isSmallMobile ? 14 : 15) : 16,
                  ),
                ),
              ),
            ),

          if (liveUrl != null && githubUrl != null)
            SizedBox(height: isMobile ? AppTheme.spacingS : AppTheme.spacingM),

          // View Code button
          if (githubUrl != null)
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () => UrlHelper.launchURL(githubUrl!),
                icon: Icon(Icons.code, size: isMobile ? 18 : 22),
                label: const Text('View Source Code'),
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    vertical: isMobile ? (isSmallMobile ? 14 : 16) : 20,
                  ),
                  side: BorderSide(
                    color:
                        isDark ? AppColors.accentDark : AppColors.accentLight,
                    width: 2,
                  ),
                  foregroundColor:
                      isDark ? AppColors.accentDark : AppColors.accentLight,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(isMobile ? 10 : 14),
                  ),
                  textStyle: AppFonts.labelLarge().copyWith(
                    fontWeight: AppFonts.bold,
                    letterSpacing: 0.3,
                    fontSize: isMobile ? (isSmallMobile ? 14 : 15) : 16,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

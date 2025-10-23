import 'package:flutter/material.dart';
import '../../utils/app_constants.dart';
import '../../utils/data/portfolio_data.dart';
import '../../utils/url_helper.dart';

import '../../theme/app_theme.dart';

/// A prominent card with a button to download the resume/CV.
///
/// Features:
/// - Gradient background for visual prominence
/// - Download icon
/// - Clear call-to-action text
/// - Button that triggers resume download
///
/// The resume URL is retrieved from PortfolioData and downloaded using UrlHelper.
class ResumeCardWidget extends StatelessWidget {
  const ResumeCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Card(
      elevation: 4,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(AppTheme.spacingL),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppTheme.radiusL),
          gradient: isDark
              ? AppColors.primaryGradientDark
              : AppColors.primaryGradientLight,
        ),
        child: Column(
          children: [
            // Download icon
            const Icon(
              Icons.download_rounded,
              size: 40,
              color: AppColors.white,
            ),

            const SizedBox(height: AppTheme.spacingM),

            // Card title
            Text(
              'Download Resume',
              style: (isDark ? AppFonts.h3() : AppFonts.h3()).copyWith(
                color: AppColors.white,
                fontWeight: AppFonts.bold,
              ),
            ),

            const SizedBox(height: AppTheme.spacingS),

            // Card description
            Text(
              'Get a copy of my detailed CV',
              style: (isDark ? AppFonts.bodyMedium() : AppFonts.bodyMedium())
                  .copyWith(
                color: AppColors.white.withOpacity(0.95),
                fontWeight: AppFonts.medium,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: AppTheme.spacingL),

            // Download/Open button
            ElevatedButton(
              onPressed: () => UrlHelper.openFile(PortfolioData.resumeUrl),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.white,
                foregroundColor:
                    isDark ? AppColors.primaryLight : AppColors.accentLight,
                elevation: 2,
                padding: const EdgeInsets.symmetric(
                  horizontal: AppTheme.spacingL,
                  vertical: AppTheme.spacingM,
                ),
              ),
              child: Text(
                'View Resume',
                style:
                    AppFonts.button().copyWith(fontWeight: AppFonts.semiBold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

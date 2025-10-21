import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../utils/data/portfolio_data.dart';
import '../../utils/url_helper.dart';

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
          gradient:
              isDark ? AppTheme.darkPrimaryGradient : AppTheme.primaryGradient,
        ),
        child: Column(
          children: [
            // Download icon
            const Icon(
              Icons.download_rounded,
              size: 40,
              color: Colors.white,
            ),

            const SizedBox(height: AppTheme.spacingM),

            // Card title
            Text(
              'Download Resume',
              style: (isDark
                      ? AppTheme.headingSmallForTheme(context)
                      : AppTheme.headingSmall)
                  .copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),

            const SizedBox(height: AppTheme.spacingS),

            // Card description
            Text(
              'Get a copy of my detailed CV',
              style: (isDark
                      ? AppTheme.bodyMediumForTheme(context)
                      : AppTheme.bodyMedium)
                  .copyWith(
                color: Colors.white.withOpacity(0.95),
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: AppTheme.spacingL),

            // Download/Open button
            ElevatedButton(
              onPressed: () => UrlHelper.openFile(PortfolioData.resumeUrl),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor:
                    isDark ? AppTheme.primaryColor : AppTheme.accentColor,
                elevation: 2,
                padding: const EdgeInsets.symmetric(
                  horizontal: AppTheme.spacingL,
                  vertical: AppTheme.spacingM,
                ),
              ),
              child: const Text(
                'View Resume',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

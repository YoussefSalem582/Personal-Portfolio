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
    return Card(
      elevation: 4,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(AppTheme.spacingL),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppTheme.radiusL),
          gradient: AppTheme.primaryGradient,
        ),
        child: Column(
          children: [
            // Download icon
            const Icon(
              Icons.download_rounded,
              size: 40,
              color: AppTheme.surfaceColor,
            ),

            const SizedBox(height: AppTheme.spacingM),

            // Card title
            Text(
              'Download Resume',
              style: AppTheme.headingSmall.copyWith(
                color: AppTheme.surfaceColor,
              ),
            ),

            const SizedBox(height: AppTheme.spacingS),

            // Card description
            Text(
              'Get a copy of my detailed CV',
              style: AppTheme.bodyMedium.copyWith(
                color: AppTheme.surfaceColor.withValues(alpha: 0.9),
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: AppTheme.spacingL),

            // Download/Open button
            ElevatedButton(
              onPressed: () => UrlHelper.openFile(PortfolioData.resumeUrl),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.surfaceColor,
                foregroundColor: AppTheme.primaryColor,
              ),
              child: const Text('View Resume'),
            ),
          ],
        ),
      ),
    );
  }
}

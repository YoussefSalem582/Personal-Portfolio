import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../utils/url_helper.dart';

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
                  AppTheme.darkCardColor,
                  AppTheme.darkCardColor.withValues(alpha: 0.5),
                ],
              )
            : LinearGradient(
                colors: [
                  Colors.grey.shade50,
                  Colors.white,
                ],
              ),
        borderRadius: BorderRadius.circular(AppTheme.radiusL),
        border: Border.all(
          color: (isDark ? AppTheme.darkAccentColor : AppTheme.accentColor)
              .withValues(alpha: 0.2),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: (isDark ? Colors.black : Colors.grey.shade300)
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
            style: AppTheme.headingMedium.copyWith(
              color: isDark ? AppTheme.darkTextPrimary : AppTheme.textPrimary,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppTheme.spacingM),
          Text(
            'Explore the full case study or check out the source code',
            style: AppTheme.bodyMedium.copyWith(
              color:
                  isDark ? AppTheme.darkTextSecondary : AppTheme.textSecondary,
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
                icon: const Icon(Icons.description_rounded, size: 22),
                label: const Text('View Full Case Study'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  backgroundColor:
                      isDark ? AppTheme.darkAccentColor : AppTheme.accentColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  elevation: 0,
                  shadowColor:
                      (isDark ? AppTheme.darkAccentColor : AppTheme.accentColor)
                          .withValues(alpha: 0.5),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
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
                icon: const Icon(Icons.code_rounded, size: 22),
                label: const Text('View Source Code'),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  side: BorderSide(
                    color: isDark
                        ? AppTheme.darkAccentColor
                        : AppTheme.accentColor,
                    width: 2,
                  ),
                  foregroundColor:
                      isDark ? AppTheme.darkAccentColor : AppTheme.accentColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
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

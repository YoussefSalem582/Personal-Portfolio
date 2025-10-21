import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

/// A single statistic card widget.
///
/// Displays a large title (number/percentage) and subtitle (description)
/// with a gradient background for visual appeal.
///
/// Examples:
/// - Title: "10+", Subtitle: "Projects Completed"
/// - Title: "2+", Subtitle: "Years Experience"
/// - Title: "100%", Subtitle: "Client Satisfaction"
class StatCardWidget extends StatelessWidget {
  /// The main statistic value (e.g., "10+", "2+", "100%")
  final String title;

  /// The description of the statistic (e.g., "Projects Completed")
  final String subtitle;

  const StatCardWidget({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Container(
        padding: const EdgeInsets.all(AppTheme.spacingM),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppTheme.radiusL),
          // Subtle gradient background
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppTheme.accentColor.withValues(alpha: 0.1),
              AppTheme.primaryColor.withValues(alpha: 0.05),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Large title with accent color (stat value)
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  title,
                  style: AppTheme.headingMedium.copyWith(
                    color: AppTheme.accentColor,
                    fontSize: 22,
                  ),
                ),
              ),

              const SizedBox(height: 4),

              // Smaller subtitle (stat description)
              Flexible(
                child: Text(
                  subtitle,
                  style: AppTheme.bodySmall.copyWith(
                    color: AppTheme.textSecondary,
                    fontWeight: FontWeight.w500,
                    fontSize: 11,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

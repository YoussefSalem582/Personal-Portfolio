import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

/// Technical stack section widget
///
/// Displays the technologies used in the project as styled chips.
/// Features:
/// - Gradient-enhanced chips with borders and shadows
/// - Theme-aware color scheme
/// - Responsive wrap layout
/// - Icon-enhanced section title
/// - Gradient underline accent
class TechnicalStackWidget extends StatelessWidget {
  /// List of technology names to display
  final List<String> technologies;

  const TechnicalStackWidget({
    super.key,
    required this.technologies,
  });

  @override
  Widget build(BuildContext context) {
    // Detect current theme mode for styling
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Title with icon and gradient underline
        Row(
          children: [
            // Gradient icon container with code icon
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                gradient: isDark
                    ? AppTheme.darkPrimaryGradient
                    : AppTheme.primaryGradient,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: (isDark
                            ? AppTheme.darkAccentColor
                            : AppTheme.accentColor)
                        .withValues(alpha: 0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Icon(
                Icons.code_rounded,
                color: Colors.white,
                size: 24,
              ),
            ),
            const SizedBox(width: AppTheme.spacingM),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Technical Stack',
                    style: AppTheme.headingLarge.copyWith(
                      color: isDark
                          ? AppTheme.darkTextPrimary
                          : AppTheme.textPrimary,
                      fontWeight: FontWeight.w800,
                      fontSize: 28,
                    ),
                  ),
                  Container(
                    height: 3,
                    width: 60,
                    margin: const EdgeInsets.only(top: 8),
                    decoration: BoxDecoration(
                      gradient: isDark
                          ? AppTheme.darkPrimaryGradient
                          : AppTheme.primaryGradient,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        const SizedBox(height: AppTheme.spacingXL),

        // Technology Chips - Responsive wrap layout
        Wrap(
          spacing: 12, // Horizontal spacing between chips
          runSpacing: 12, // Vertical spacing between rows
          children: technologies.map((tech) {
            return Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20, // Horizontal padding inside chip
                vertical: 12, // Vertical padding inside chip
              ),
              // Gradient-enhanced chip styling
              decoration: BoxDecoration(
                // Theme-aware gradient background
                gradient: LinearGradient(
                  colors: isDark
                      ? [
                          AppTheme.darkAccentColor.withValues(alpha: 0.2),
                          AppTheme.darkPrimaryColor.withValues(alpha: 0.2),
                        ]
                      : [
                          AppTheme.accentColor.withValues(alpha: 0.15),
                          AppTheme.primaryColor.withValues(alpha: 0.15),
                        ],
                ),
                borderRadius: BorderRadius.circular(AppTheme.radiusM),
                // Colored border for accent
                border: Border.all(
                  color:
                      (isDark ? AppTheme.darkAccentColor : AppTheme.accentColor)
                          .withValues(alpha: 0.4),
                  width: 1.5,
                ),
                // Subtle shadow for depth
                boxShadow: [
                  BoxShadow(
                    color: (isDark
                            ? AppTheme.darkAccentColor
                            : AppTheme.accentColor)
                        .withValues(alpha: 0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              // Technology name text
              child: Text(
                tech,
                style: AppTheme.bodyMedium.copyWith(
                  color:
                      isDark ? AppTheme.darkAccentColor : AppTheme.accentColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                  letterSpacing: 0.3,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

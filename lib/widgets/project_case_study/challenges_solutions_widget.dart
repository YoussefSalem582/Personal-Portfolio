import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

/// Challenges and solutions section widget
///
/// Displays project challenges and their solutions in numbered card format.
/// Features:
/// - Numbered badges with gradient backgrounds
/// - Card-based layout with elevation
/// - Theme-aware styling
/// - Icon-enhanced section title
/// - Responsive text layout
class ChallengesSolutionsWidget extends StatelessWidget {
  /// List of challenges with title and description
  /// Each map should contain 'title' and 'description' keys
  final List<Map<String, String>> challenges;

  const ChallengesSolutionsWidget({
    super.key,
    required this.challenges,
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
            // Gradient icon container with lightbulb icon (represents problem-solving)
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
                Icons.lightbulb_rounded,
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
                    'Challenges & Solutions',
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

        // Challenge Cards - Map through challenges with index
        ...challenges.asMap().entries.map((entry) {
          final index = entry.key; // Challenge number
          final challenge = entry.value; // Challenge data

          return Container(
            margin: const EdgeInsets.only(
                bottom: AppTheme.spacingL), // Space between cards
            padding:
                const EdgeInsets.all(AppTheme.spacingXL), // Internal padding
            // Card styling with theme-aware colors
            decoration: BoxDecoration(
              color: isDark ? AppTheme.darkCardColor : Colors.white,
              borderRadius: BorderRadius.circular(AppTheme.radiusL),
              border: Border.all(
                color:
                    (isDark ? AppTheme.darkAccentColor : AppTheme.accentColor)
                        .withValues(alpha: 0.2),
                width: 1.5,
              ),
              // Card elevation shadow
              boxShadow: [
                BoxShadow(
                  color: (isDark ? Colors.black : Colors.grey.shade300)
                      .withValues(alpha: 0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 8), // Shadow offset downwards
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Number Badge - Shows challenge number (1, 2, 3, etc.)
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    // Gradient background for visual appeal
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
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      '${index + 1}', // Display 1-indexed number
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w900, // Extra bold
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: AppTheme.spacingL),

                // Content - Challenge title and description
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Challenge title
                      Text(
                        challenge['title']!, // Get title from map
                        style: AppTheme.headingMedium.copyWith(
                          color: isDark
                              ? AppTheme.darkAccentColor
                              : AppTheme.accentColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: AppTheme.spacingM),

                      // Challenge description/solution
                      Text(
                        challenge['description']!, // Get description from map
                        style: AppTheme.bodyMedium.copyWith(
                          height:
                              1.7, // Comfortable line height for readability
                          fontSize: 15,
                          color: isDark
                              ? AppTheme.darkTextSecondary
                              : AppTheme.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import '../../../../../utils/assets/app_constants.dart';

import '../../../../../theme/app_theme.dart';

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
  final bool isMobile;
  final bool isSmallMobile;

  const ChallengesSolutionsWidget({
    super.key,
    required this.challenges,
    this.isMobile = false,
    this.isSmallMobile = false,
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
              padding: EdgeInsets.all(isMobile ? 10 : 12),
              decoration: BoxDecoration(
                gradient: isDark
                    ? AppColors.primaryGradientDark
                    : AppColors.primaryGradientLight,
                borderRadius: BorderRadius.circular(isMobile ? 10 : 12),
                boxShadow: [
                  BoxShadow(
                    color:
                        (isDark ? AppColors.accentDark : AppColors.accentLight)
                            .withOpacity(0.3),
                    blurRadius: isMobile ? 8 : 12,
                    offset: Offset(0, isMobile ? 2 : 4),
                  ),
                ],
              ),
              child: Icon(
                AppIcons.help,
                color: AppColors.white,
                size: isMobile ? 20 : 24,
              ),
            ),
            SizedBox(width: isMobile ? AppTheme.spacingS : AppTheme.spacingM),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Challenges & Solutions',
                    style: TextStyle(
                      fontSize: isMobile ? (isSmallMobile ? 20 : 22) : 28,
                      fontWeight: AppFonts.extraBold,
                      color: isDark
                          ? AppColors.textPrimaryDark
                          : AppColors.textPrimaryLight,
                    ),
                  ),
                  Container(
                    height: isMobile ? 2 : 3,
                    width: isMobile ? 45 : 60,
                    margin: EdgeInsets.only(top: isMobile ? 6 : 8),
                    decoration: BoxDecoration(
                      gradient: isDark
                          ? AppColors.primaryGradientDark
                          : AppColors.primaryGradientLight,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        SizedBox(height: isMobile ? AppTheme.spacingL : AppTheme.spacingXL),

        // Challenge Cards - Map through challenges with index
        ...challenges.asMap().entries.map((entry) {
          final index = entry.key; // Challenge number
          final challenge = entry.value; // Challenge data

          return Container(
            margin: EdgeInsets.only(
                bottom: isMobile
                    ? AppTheme.spacingM
                    : AppTheme.spacingL), // Space between cards
            padding: EdgeInsets.all(isMobile
                ? AppTheme.spacingL
                : AppTheme.spacingXL), // Internal padding
            // Card styling with theme-aware colors
            decoration: BoxDecoration(
              color: isDark ? AppColors.cardDark : AppColors.white,
              borderRadius: BorderRadius.circular(
                  isMobile ? AppTheme.radiusM : AppTheme.radiusL),
              border: Border.all(
                color: (isDark ? AppColors.accentDark : AppColors.accentLight)
                    .withOpacity(0.2),
                width: 1.5,
              ),
              // Card elevation shadow
              boxShadow: [
                BoxShadow(
                  color: (isDark ? AppColors.black : AppColors.gray300)
                      .withOpacity(0.1),
                  blurRadius: isMobile ? 12 : 20,
                  offset:
                      Offset(0, isMobile ? 4 : 8), // Shadow offset downwards
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Number Badge - Shows challenge number (1, 2, 3, etc.)
                Container(
                  width: isMobile ? (isSmallMobile ? 40 : 44) : 48,
                  height: isMobile ? (isSmallMobile ? 40 : 44) : 48,
                  decoration: BoxDecoration(
                    // Gradient background for visual appeal
                    gradient: isDark
                        ? AppColors.primaryGradientDark
                        : AppColors.primaryGradientLight,
                    borderRadius: BorderRadius.circular(isMobile ? 10 : 12),
                    boxShadow: [
                      BoxShadow(
                        color: (isDark
                                ? AppColors.accentDark
                                : AppColors.accentLight)
                            .withOpacity(0.3),
                        blurRadius: isMobile ? 6 : 8,
                        offset: Offset(0, isMobile ? 1 : 2),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      '${index + 1}', // Display 1-indexed number
                      style: TextStyle(
                        fontSize: isMobile ? (isSmallMobile ? 18 : 20) : 22,
                        fontWeight: AppFonts.black,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                    width: isMobile ? AppTheme.spacingM : AppTheme.spacingL),

                // Content - Challenge title and description
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Challenge title
                      Text(
                        challenge['title']!, // Get title from map
                        style: TextStyle(
                          fontSize: isMobile ? (isSmallMobile ? 16 : 17) : 20,
                          fontWeight: AppFonts.bold,
                          color: isDark
                              ? AppColors.accentDark
                              : AppColors.accentLight,
                        ),
                      ),
                      SizedBox(
                          height:
                              isMobile ? AppTheme.spacingS : AppTheme.spacingM),

                      // Challenge description/solution
                      Text(
                        challenge['description']!, // Get description from map
                        style: TextStyle(
                          fontSize: isMobile ? (isSmallMobile ? 13 : 14) : 15,
                          height:
                              1.7, // Comfortable line height for readability
                          color: isDark
                              ? AppColors.textSecondaryDark
                              : AppColors.textSecondaryLight,
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

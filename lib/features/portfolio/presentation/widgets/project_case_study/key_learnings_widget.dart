import 'package:flutter/material.dart';
import '../../../../../utils/assets/app_constants.dart';

import '../../../../../theme/app_theme.dart';

/// Key learnings section with modern list design
class KeyLearningsWidget extends StatelessWidget {
  final List<String> lessons;
  final bool isMobile;
  final bool isSmallMobile;

  const KeyLearningsWidget({
    super.key,
    required this.lessons,
    this.isMobile = false,
    this.isSmallMobile = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Title
        Row(
          children: [
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
                AppIcons.education,
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
                    'Key Learnings',
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

        // Learning Items
        Container(
          padding:
              EdgeInsets.all(isMobile ? AppTheme.spacingL : AppTheme.spacingXL),
          decoration: BoxDecoration(
            color: isDark ? AppColors.cardDark : AppColors.white,
            borderRadius: BorderRadius.circular(
                isMobile ? AppTheme.radiusM : AppTheme.radiusL),
            border: Border.all(
              color: (isDark ? AppColors.accentDark : AppColors.accentLight)
                  .withOpacity(0.2),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: (isDark ? AppColors.black : AppColors.gray300)
                    .withOpacity(0.1),
                blurRadius: isMobile ? 12 : 20,
                offset: Offset(0, isMobile ? 4 : 8),
              ),
            ],
          ),
          child: Column(
            children: lessons.asMap().entries.map((entry) {
              final index = entry.key;
              final lesson = entry.value;
              final isLast = index == lessons.length - 1;

              return Padding(
                padding: EdgeInsets.only(
                  bottom: isLast
                      ? 0
                      : (isMobile ? AppTheme.spacingM : AppTheme.spacingL),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Check icon
                    Container(
                      margin: EdgeInsets.only(top: isMobile ? 1 : 2),
                      padding: EdgeInsets.all(isMobile ? 5 : 6),
                      decoration: BoxDecoration(
                        gradient: isDark
                            ? AppColors.primaryGradientDark
                            : AppColors.primaryGradientLight,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: (isDark
                                    ? AppColors.accentDark
                                    : AppColors.accentLight)
                                .withOpacity(0.3),
                            blurRadius: isMobile ? 4 : 6,
                            offset: Offset(0, isMobile ? 1 : 2),
                          ),
                        ],
                      ),
                      child: Icon(
                        AppIcons.success,
                        color: AppColors.white,
                        size: isMobile ? (isSmallMobile ? 14 : 15) : 16,
                      ),
                    ),
                    SizedBox(
                        width:
                            isMobile ? AppTheme.spacingS : AppTheme.spacingM),

                    // Text
                    Expanded(
                      child: Text(
                        lesson,
                        style: TextStyle(
                          fontSize: isMobile ? (isSmallMobile ? 13 : 14) : 15,
                          height: 1.7,
                          color: isDark
                              ? AppColors.textSecondaryDark
                              : AppColors.textSecondaryLight,
                          fontWeight: AppFonts.regular,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

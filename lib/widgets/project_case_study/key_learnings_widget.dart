import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

/// Key learnings section with modern list design
class KeyLearningsWidget extends StatelessWidget {
  final List<String> lessons;

  const KeyLearningsWidget({
    super.key,
    required this.lessons,
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
                Icons.school_rounded,
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
                    'Key Learnings',
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

        // Learning Items
        Container(
          padding: const EdgeInsets.all(AppTheme.spacingXL),
          decoration: BoxDecoration(
            color: isDark ? AppTheme.darkCardColor : Colors.white,
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
            children: lessons.asMap().entries.map((entry) {
              final index = entry.key;
              final lesson = entry.value;
              final isLast = index == lessons.length - 1;

              return Padding(
                padding: EdgeInsets.only(
                  bottom: isLast ? 0 : AppTheme.spacingL,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Check icon
                    Container(
                      margin: const EdgeInsets.only(top: 2),
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        gradient: isDark
                            ? AppTheme.darkPrimaryGradient
                            : AppTheme.primaryGradient,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: (isDark
                                    ? AppTheme.darkAccentColor
                                    : AppTheme.accentColor)
                                .withValues(alpha: 0.3),
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.check_rounded,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                    const SizedBox(width: AppTheme.spacingM),

                    // Text
                    Expanded(
                      child: Text(
                        lesson,
                        style: AppTheme.bodyMedium.copyWith(
                          height: 1.7,
                          fontSize: 15,
                          color: isDark
                              ? AppTheme.darkTextSecondary
                              : AppTheme.textSecondary,
                          fontWeight: FontWeight.w400,
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

import 'package:flutter/material.dart';
import '../../utils/assets/app_constants.dart';

import '../../theme/app_theme.dart';

/// A reusable widget that displays a single contact information item.
///
/// This widget shows an icon, title, and value (e.g., "Email: john@example.com").
/// If [onTap] is provided, the item becomes clickable and shows an arrow indicator.
/// Used for displaying email, phone, and location information in the contact section.
class ContactItemWidget extends StatelessWidget {
  /// The icon to display on the left side (e.g., Icons.email_outlined)
  final IconData icon;

  /// The label/title of the contact item (e.g., "Email", "Phone")
  final String title;

  /// The actual contact information value (e.g., "john@example.com")
  final String value;

  /// Optional callback when the item is tapped. If null, item is not clickable.
  /// Used for actions like launching email client or phone dialer.
  final VoidCallback? onTap;

  const ContactItemWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // Get theme-specific colors
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final accentColor = isDark ? AppColors.accentDark : AppColors.accentLight;

    return MouseRegion(
      cursor:
          onTap != null ? SystemMouseCursors.click : SystemMouseCursors.basic,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppTheme.radiusM),
        hoverColor: accentColor.withOpacity(0.05),
        splashColor: accentColor.withOpacity(0.1),
        child: Container(
          padding: const EdgeInsets.all(AppTheme.spacingM),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: isDark
                  ? [
                      AppColors.cardDark.withOpacity(0.5),
                      AppColors.surfaceDark.withOpacity(0.3),
                    ]
                  : [
                      AppColors.white,
                      AppColors.surfaceLight.withOpacity(0.5),
                    ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(AppTheme.radiusM),
            border: Border.all(
              color: isDark
                  ? AppColors.white.withOpacity(0.05)
                  : AppColors.black.withOpacity(0.05),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: isDark
                    ? AppColors.black.withOpacity(0.2)
                    : AppColors.black.withOpacity(0.03),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              // Icon container with gradient and glow effect
              Container(
                padding: const EdgeInsets.all(AppTheme.spacingM),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      accentColor,
                      accentColor.withOpacity(0.8),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(AppTheme.radiusS),
                  boxShadow: [
                    BoxShadow(
                      color: accentColor.withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Icon(
                  icon,
                  size: 20,
                  color: AppColors.white,
                ),
              ),
              const SizedBox(width: AppTheme.spacingM),
              // Title and value column
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Contact item title (e.g., "Email")
                    Text(
                      title,
                      style: AppFonts.labelMedium().copyWith(
                        color: isDark
                            ? AppColors.textSecondaryDark
                            : AppColors.textSecondaryLight,
                        fontWeight: AppFonts.semiBold,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 4),
                    // Contact item value (e.g., "john@example.com")
                    Text(
                      value,
                      style: AppFonts.bodyMedium().copyWith(
                        fontWeight: AppFonts.bold,
                        color: onTap != null
                            ? accentColor
                            : (isDark
                                ? AppColors.textPrimaryDark
                                : AppColors.textPrimaryLight),
                      ),
                    ),
                  ],
                ),
              ),
              // Show arrow indicator only for clickable items
              if (onTap != null)
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: accentColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    AppIcons.openExternal,
                    size: 18,
                    color: accentColor,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

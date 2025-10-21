import 'package:flutter/material.dart';
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
    final accentColor =
        isDark ? AppTheme.darkAccentColor : AppTheme.accentColor;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppTheme.radiusS),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppTheme.spacingS),
        child: Row(
          children: [
            // Icon container with accent color background
            Container(
              padding: const EdgeInsets.all(AppTheme.spacingS),
              decoration: BoxDecoration(
                color: accentColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(AppTheme.radiusS),
              ),
              child: Icon(icon, size: 20, color: accentColor),
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
                    style: (isDark
                            ? AppTheme.bodySmallForTheme(context)
                            : AppTheme.bodySmall)
                        .copyWith(
                      color: isDark
                          ? AppTheme.darkTextSecondary
                          : AppTheme.textSecondary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 2),
                  // Contact item value (e.g., "john@example.com")
                  // Color changes to accent if clickable
                  Text(
                    value,
                    style: (isDark
                            ? AppTheme.bodyMediumForTheme(context)
                            : AppTheme.bodyMedium)
                        .copyWith(
                      fontWeight: FontWeight.w600,
                      color: onTap != null
                          ? accentColor // Accent color for clickable items
                          : (isDark
                              ? AppTheme.darkTextPrimary
                              : AppTheme.textPrimary),
                    ),
                  ),
                ],
              ),
            ),
            // Show arrow indicator only for clickable items
            if (onTap != null)
              Icon(Icons.arrow_outward, size: 16, color: accentColor),
          ],
        ),
      ),
    );
  }
}

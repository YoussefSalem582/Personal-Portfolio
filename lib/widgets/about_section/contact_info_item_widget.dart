import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

/// A single contact information item widget.
///
/// Displays an icon, label, and value in a consistent format.
/// If [onTap] is provided, the item becomes clickable with underlined text.
///
/// Examples:
/// - Email: Icon + "Email" label + email address (clickable)
/// - Location: Icon + "Location" label + location text (non-clickable)
/// - Website: Icon + "Portfolio" label + "View Online" (clickable)
class ContactInfoItemWidget extends StatelessWidget {
  /// The icon to display (e.g., Icons.email_outlined)
  final IconData icon;

  /// The label text (e.g., "Email", "Location")
  final String label;

  /// The value text (e.g., email address, location name)
  final String value;

  /// Optional callback when tapped. If null, item is not interactive.
  final VoidCallback? onTap;

  const ContactInfoItemWidget({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppTheme.radiusS),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppTheme.spacingXS),
        child: Row(
          children: [
            // Icon with accent color
            Icon(
              icon,
              size: 20,
              color: isDark ? AppTheme.primaryColor : AppTheme.accentColor,
            ),

            const SizedBox(width: AppTheme.spacingM),

            // Label and value column
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Label text (smaller, secondary color)
                Text(
                  label,
                  style: (isDark
                          ? AppTheme.bodySmallForTheme(context)
                          : AppTheme.bodySmall)
                      .copyWith(
                    color: isDark ? Colors.grey.shade400 : Colors.grey.shade600,
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),

                // Value text (larger, clickable items get accent color and underline)
                Text(
                  value,
                  style: (isDark
                          ? AppTheme.bodyMediumForTheme(context)
                          : AppTheme.bodyMedium)
                      .copyWith(
                    color: onTap != null
                        ? (isDark
                            ? AppTheme.primaryColor
                            : AppTheme.accentColor)
                        : (isDark
                            ? Colors.grey.shade300
                            : Colors.grey.shade800),
                    decoration: onTap != null ? TextDecoration.underline : null,
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

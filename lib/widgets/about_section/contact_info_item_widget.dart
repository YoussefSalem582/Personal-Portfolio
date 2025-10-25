import 'package:flutter/material.dart';
import '../../utils/assets/app_constants.dart';

import '../../theme/app_theme.dart';

/// A single contact information item widget.
///
/// Displays an icon, label, and value in a consistent format with enhanced dark mode visibility.
/// If [onTap] is provided, the item becomes clickable with hover effects and underlined text.
///
/// Examples:
/// - Email: Icon + "Email" label + email address (clickable)
/// - Location: Icon + "Location" label + location text (non-clickable)
/// - Website: Icon + "Portfolio" label + "View Online" (clickable)
class ContactInfoItemWidget extends StatefulWidget {
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
  State<ContactInfoItemWidget> createState() => _ContactInfoItemWidgetState();
}

class _ContactInfoItemWidgetState extends State<ContactInfoItemWidget> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isClickable = widget.onTap != null;

    return MouseRegion(
      onEnter: isClickable ? (_) => setState(() => _isHovered = true) : null,
      onExit: isClickable ? (_) => setState(() => _isHovered = false) : null,
      cursor: isClickable ? SystemMouseCursors.click : SystemMouseCursors.basic,
      child: InkWell(
        onTap: widget.onTap,
        borderRadius: BorderRadius.circular(AppTheme.radiusM),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(AppTheme.spacingS),
          decoration: BoxDecoration(
            color: _isHovered && isClickable
                ? (isDark
                    ? AppColors.primaryLight.withValues(alpha: 0.1)
                    : AppColors.accentLight.withValues(alpha: 0.05))
                : AppColors.transparent,
            borderRadius: BorderRadius.circular(AppTheme.radiusM),
            border: Border.all(
              color: _isHovered && isClickable
                  ? (isDark ? AppColors.primaryLight : AppColors.accentLight)
                      .withValues(alpha: 0.3)
                  : AppColors.transparent,
            ),
          ),
          child: Row(
            children: [
              // Icon with gradient background
              Container(
                padding: const EdgeInsets.all(AppTheme.spacingS),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: isDark
                        ? [
                            AppColors.primaryLight.withValues(alpha: 0.2),
                            AppColors.accentDark.withValues(alpha: 0.1),
                          ]
                        : [
                            AppColors.primaryLight.withValues(alpha: 0.15),
                            AppColors.accentLight.withValues(alpha: 0.1),
                          ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(AppTheme.radiusS),
                  border: Border.all(
                    color: isDark
                        ? AppColors.primaryLight.withValues(alpha: 0.3)
                        : AppColors.accentLight.withValues(alpha: 0.2),
                  ),
                ),
                child: Icon(
                  widget.icon,
                  size: 20,
                  color: AppColors.accentLight,
                ),
              ),

              const SizedBox(width: AppTheme.spacingM),

              // Label and value column
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Label text (smaller, secondary color with better contrast)
                    Text(
                      widget.label,
                      style:
                          (isDark ? AppFonts.bodySmall() : AppFonts.bodySmall())
                              .copyWith(
                        color:
                            isDark ? AppColors.accentLight : AppColors.gray600,
                        fontWeight: AppFonts.semiBold,
                        letterSpacing: 0.5,
                      ),
                    ),

                    const SizedBox(height: 2),

                    // Value text (larger, clickable items get accent color and underline)
                    Text(
                      widget.value,
                      style: (isDark
                              ? AppFonts.bodyMedium()
                              : AppFonts.bodyMedium())
                          .copyWith(
                        color: isClickable
                            ? (isDark
                                ? AppColors.gray100
                                : AppColors.accentLight)
                            : (isDark ? AppColors.gray100 : AppColors.gray900),
                        decoration: isClickable && _isHovered
                            ? TextDecoration.underline
                            : null,
                        decorationColor: isDark
                            ? AppColors.primaryLight
                            : AppColors.accentLight,
                        fontWeight:
                            isClickable ? AppFonts.semiBold : AppFonts.medium,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),

              // Arrow icon for clickable items
              if (isClickable)
                AnimatedRotation(
                  duration: const Duration(milliseconds: 200),
                  turns: _isHovered ? 0.125 : 0, // 45 degrees when hovered
                  child: Icon(
                    Icons.arrow_forward_rounded,
                    size: 18,
                    color: isDark
                        ? AppColors.primaryLight.withValues(alpha: 0.7)
                        : AppColors.accentLight.withValues(alpha: 0.7),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

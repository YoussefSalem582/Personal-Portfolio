import 'package:flutter/material.dart';
import '../../utils/assets/app_constants.dart';
import '../../theme/app_theme.dart';
import 'common_widgets.dart';

/// Interactive List Item with Icon, Label, Value
/// Reusable for contact info, details, links, etc.
class InteractiveListItem extends StatefulWidget {
  final IconData icon;
  final String label;
  final String value;
  final VoidCallback? onTap;
  final bool showArrow;
  final double iconSize;
  final Color? iconColor;
  final EdgeInsets? padding;

  const InteractiveListItem({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    this.onTap,
    this.showArrow = true,
    this.iconSize = 20,
    this.iconColor,
    this.padding,
  });

  @override
  State<InteractiveListItem> createState() => _InteractiveListItemState();
}

class _InteractiveListItemState extends State<InteractiveListItem> {
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
          padding: widget.padding ?? const EdgeInsets.all(AppTheme.spacingS),
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
              IconContainer(
                icon: widget.icon,
                iconSize: widget.iconSize,
                size: widget.iconSize + 20,
                iconColor: widget.iconColor ?? AppColors.accentLight,
                gradientColors: isDark
                    ? [
                        AppColors.primaryLight.withValues(alpha: 0.2),
                        AppColors.accentDark.withValues(alpha: 0.1),
                      ]
                    : [
                        AppColors.primaryLight.withValues(alpha: 0.15),
                        AppColors.accentLight.withValues(alpha: 0.1),
                      ],
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(AppTheme.radiusS),
              ),

              const SizedBox(width: AppTheme.spacingM),

              // Label and value column
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Label text
                    Text(
                      widget.label,
                      style: AppFonts.bodySmall().copyWith(
                        color:
                            isDark ? AppColors.accentLight : AppColors.gray600,
                        fontWeight: AppFonts.semiBold,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 2),

                    // Value text
                    Text(
                      widget.value,
                      style: AppFonts.bodyMedium().copyWith(
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
              if (isClickable && widget.showArrow)
                AnimatedRotation(
                  duration: const Duration(milliseconds: 200),
                  turns: _isHovered ? 0.125 : 0,
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

/// Simplified version for non-interactive items
class ListItemDisplay extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final double iconSize;

  const ListItemDisplay({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    this.iconSize = 20,
  });

  @override
  Widget build(BuildContext context) {
    return InteractiveListItem(
      icon: icon,
      label: label,
      value: value,
      iconSize: iconSize,
      showArrow: false,
    );
  }
}

import 'package:flutter/material.dart';
import '../../utils/assets/app_constants.dart';
import '../../theme/app_theme.dart';

/// Common Empty State Widget
/// Reusable empty state for displaying "no content" messages
class EmptyState extends StatelessWidget {
  final IconData icon;
  final String message;
  final String? subtitle;
  final double? height;
  final double iconSize;
  final VoidCallback? onActionPressed;
  final String? actionLabel;

  const EmptyState({
    super.key,
    required this.icon,
    required this.message,
    this.subtitle,
    this.height,
    this.iconSize = 64,
    this.onActionPressed,
    this.actionLabel,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor =
        isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight;

    return SizedBox(
      height: height ?? 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Icon
          Icon(
            icon,
            size: iconSize,
            color: textColor.withValues(alpha: 0.5),
          ),

          const SizedBox(height: AppTheme.spacingM),

          // Message
          Text(
            message,
            style: AppFonts.bodyLarge().copyWith(color: textColor),
            textAlign: TextAlign.center,
          ),

          // Subtitle (optional)
          if (subtitle != null) ...[
            const SizedBox(height: AppTheme.spacingS),
            Text(
              subtitle!,
              style: AppFonts.bodyMedium().copyWith(
                color: textColor.withValues(alpha: 0.7),
              ),
              textAlign: TextAlign.center,
            ),
          ],

          // Action button (optional)
          if (onActionPressed != null && actionLabel != null) ...[
            const SizedBox(height: AppTheme.spacingL),
            OutlinedButton(
              onPressed: onActionPressed,
              child: Text(actionLabel!),
            ),
          ],
        ],
      ),
    );
  }
}

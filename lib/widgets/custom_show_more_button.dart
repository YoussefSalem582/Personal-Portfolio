import 'package:flutter/material.dart';
import '../utils/assets/app_constants.dart';

/// Custom Show More Button
/// Reusable button widget for loading more content
class CustomShowMoreButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final IconData icon;
  final double iconSize;
  final EdgeInsets? padding;
  final double borderRadius;
  final double borderWidth;

  const CustomShowMoreButton({
    super.key,
    required this.onPressed,
    this.label = 'Show More',
    this.icon = AppIcons.arrowDown,
    this.iconSize = 20,
    this.padding,
    this.borderRadius = 12,
    this.borderWidth = 2,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final accentColor = isDark ? AppColors.accentDark : AppColors.accentLight;

    return Center(
      child: OutlinedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, size: iconSize),
        label: Text(label),
        style: OutlinedButton.styleFrom(
          foregroundColor: accentColor,
          side: BorderSide(color: accentColor, width: borderWidth),
          padding: padding ??
              const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 16,
              ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../utils/assets/app_constants.dart';

/// Common Icon Badge Widget
/// Reusable badge with icon and label (like PDF, Verified, etc.)
class IconBadge extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color backgroundColor;
  final Color? iconColor;
  final Color? textColor;
  final double iconSize;
  final EdgeInsets? padding;
  final double borderRadius;

  const IconBadge({
    super.key,
    required this.label,
    required this.icon,
    required this.backgroundColor,
    this.iconColor,
    this.textColor,
    this.iconSize = 14,
    this.padding,
    this.borderRadius = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          padding ?? const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: backgroundColor.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: iconSize,
            color: iconColor ?? AppColors.white,
          ),
          const SizedBox(width: 4),
          Text(
            label,
            style: AppFonts.bodyXS().copyWith(
              color: textColor ?? AppColors.white,
              fontWeight: AppFonts.bold,
            ),
          ),
        ],
      ),
    );
  }
}

/// Positioned Badge Wrapper
/// Wraps IconBadge with positioning
class PositionedBadge extends StatelessWidget {
  final IconBadge badge;
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;

  const PositionedBadge({
    super.key,
    required this.badge,
    this.top,
    this.bottom,
    this.left,
    this.right,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: badge,
    );
  }
}

import 'package:flutter/material.dart';
import '../../utils/assets/app_constants.dart';

/// Common Gradient Container Widget
/// Reusable container with gradient background and styling
class GradientContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  final List<Color>? gradientColors;
  final AlignmentGeometry? gradientBegin;
  final AlignmentGeometry? gradientEnd;
  final Border? border;
  final List<BoxShadow>? boxShadow;
  final bool useDarkGradient;

  const GradientContainer({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.borderRadius,
    this.gradientColors,
    this.gradientBegin,
    this.gradientEnd,
    this.border,
    this.boxShadow,
    this.useDarkGradient = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Default gradient based on theme
    final defaultGradient = useDarkGradient || isDark
        ? AppColors.primaryGradientDark
        : AppColors.primaryGradientLight;

    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        gradient: gradientColors != null
            ? LinearGradient(
                colors: gradientColors!,
                begin: gradientBegin ?? Alignment.topLeft,
                end: gradientEnd ?? Alignment.bottomRight,
              )
            : defaultGradient,
        borderRadius: borderRadius ?? BorderRadius.circular(12),
        border: border,
        boxShadow: boxShadow,
      ),
      child: child,
    );
  }
}

/// Gradient Divider Widget
/// Reusable gradient divider for sections
class GradientDivider extends StatelessWidget {
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  final List<BoxShadow>? boxShadow;

  const GradientDivider({
    super.key,
    this.width,
    this.height,
    this.borderRadius,
    this.boxShadow,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final accentColor = isDark ? AppColors.accentDark : AppColors.accentLight;

    return Container(
      width: width ?? 80,
      height: height ?? 4,
      decoration: BoxDecoration(
        gradient: isDark
            ? AppColors.primaryGradientDark
            : AppColors.primaryGradientLight,
        borderRadius: borderRadius ?? BorderRadius.circular(2),
        boxShadow: boxShadow ??
            [
              BoxShadow(
                color: accentColor.withValues(alpha: 0.3),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
      ),
    );
  }
}

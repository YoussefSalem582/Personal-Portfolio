import 'package:flutter/material.dart';
import '../../utils/assets/app_constants.dart';

/// Common Icon Container Widget
/// Reusable container for icons with gradient background
class IconContainer extends StatelessWidget {
  final IconData icon;
  final Color? iconColor;
  final Color? backgroundColor;
  final List<Color>? gradientColors;
  final double size;
  final double iconSize;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;
  final BoxShape shape;
  final Border? border;

  const IconContainer({
    super.key,
    required this.icon,
    this.iconColor,
    this.backgroundColor,
    this.gradientColors,
    this.size = 44,
    this.iconSize = 22,
    this.padding,
    this.borderRadius,
    this.shape = BoxShape.circle,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final defaultIconColor =
        iconColor ?? (isDark ? AppColors.accentDark : AppColors.accentLight);

    final defaultGradient = gradientColors ??
        [
          defaultIconColor.withValues(alpha: 0.15),
          defaultIconColor.withValues(alpha: 0.05),
        ];

    return Container(
      width: size,
      height: size,
      padding: padding ?? const EdgeInsets.all(10),
      decoration: BoxDecoration(
        gradient: backgroundColor == null
            ? LinearGradient(colors: defaultGradient)
            : null,
        color: backgroundColor,
        shape: shape,
        borderRadius: shape == BoxShape.rectangle ? borderRadius : null,
        border: border,
      ),
      child: Icon(
        icon,
        size: iconSize,
        color: defaultIconColor,
      ),
    );
  }
}

/// Gradient Text Widget
/// Text with shader mask gradient effect
class GradientText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final List<Color>? gradientColors;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  const GradientText({
    super.key,
    required this.text,
    this.style,
    this.gradientColors,
    this.textAlign,
    this.maxLines,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final defaultGradient = gradientColors ??
        (isDark
            ? [AppColors.accentDark, AppColors.accentDark.withValues(alpha: 0.8)]
            : [AppColors.accentLight, AppColors.primaryLight]);

    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        colors: defaultGradient,
      ).createShader(bounds),
      child: Text(
        text,
        style: (style ?? const TextStyle()).copyWith(color: AppColors.white),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      ),
    );
  }
}

/// Responsive Spacing Widget
/// Returns spacing based on screen size
class ResponsiveSpacing extends StatelessWidget {
  final double mobile;
  final double? tablet;
  final double? desktop;
  final bool isHorizontal;

  const ResponsiveSpacing({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
    this.isHorizontal = false,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    double spacing;

    if (screenWidth < 768) {
      spacing = mobile;
    } else if (screenWidth < 1024) {
      spacing = tablet ?? mobile * 1.5;
    } else {
      spacing = desktop ?? mobile * 2;
    }

    return SizedBox(
      width: isHorizontal ? spacing : null,
      height: isHorizontal ? null : spacing,
    );
  }
}

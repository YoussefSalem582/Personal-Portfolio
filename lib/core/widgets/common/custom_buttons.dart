import 'package:flutter/material.dart';
import '../../../utils/assets/app_constants.dart';

/// Common Primary Button with Gradient Background
/// Used for main CTAs across the app
class PrimaryGradientButton extends StatelessWidget {
  final String label;
  final IconData? icon;
  final VoidCallback onPressed;
  final bool isMobile;
  final double? fontSize;
  final EdgeInsets? padding;
  final Size? minimumSize;

  const PrimaryGradientButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.isMobile = false,
    this.fontSize,
    this.padding,
    this.minimumSize,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final buttonPadding = padding ??
        EdgeInsets.symmetric(
          horizontal: isMobile ? 20 : 24,
          vertical: isMobile ? 14 : 16,
        );
    final buttonSize =
        minimumSize ?? Size(isMobile ? 140 : 160, isMobile ? 48 : 52);

    return Container(
      decoration: BoxDecoration(
        gradient: isDark
            ? AppColors.primaryGradientDark
            : AppColors.primaryGradientLight,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: (isDark ? AppColors.accentDark : AppColors.accentLight)
                .withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: icon != null
          ? ElevatedButton.icon(
              onPressed: onPressed,
              icon: Icon(icon, size: isMobile ? 18 : 20),
              label: Text(
                label,
                style: AppFonts.button().copyWith(
                  fontWeight: AppFonts.semiBold,
                  fontSize: fontSize ?? (isMobile ? 14 : 15),
                ),
              ),
              style: _buttonStyle(buttonPadding, buttonSize),
            )
          : ElevatedButton(
              onPressed: onPressed,
              style: _buttonStyle(buttonPadding, buttonSize),
              child: Text(
                label,
                style: AppFonts.button().copyWith(
                  fontWeight: AppFonts.semiBold,
                  fontSize: fontSize ?? (isMobile ? 14 : 15),
                ),
              ),
            ),
    );
  }

  ButtonStyle _buttonStyle(EdgeInsets buttonPadding, Size buttonSize) {
    return ElevatedButton.styleFrom(
      backgroundColor: AppColors.transparent,
      foregroundColor: AppColors.white,
      shadowColor: AppColors.transparent,
      padding: buttonPadding,
      minimumSize: buttonSize,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}

/// Common Outlined Button
/// Used for secondary CTAs
class SecondaryOutlinedButton extends StatelessWidget {
  final String label;
  final IconData? icon;
  final VoidCallback onPressed;
  final bool isMobile;
  final double? fontSize;
  final EdgeInsets? padding;
  final Size? minimumSize;
  final Color? customColor;

  const SecondaryOutlinedButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.isMobile = false,
    this.fontSize,
    this.padding,
    this.minimumSize,
    this.customColor,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final accentColor =
        customColor ?? (isDark ? AppColors.accentDark : AppColors.accentLight);
    final buttonPadding = padding ??
        EdgeInsets.symmetric(
          horizontal: isMobile ? 20 : 24,
          vertical: isMobile ? 14 : 16,
        );
    final buttonSize =
        minimumSize ?? Size(isMobile ? 140 : 160, isMobile ? 48 : 52);

    return icon != null
        ? OutlinedButton.icon(
            onPressed: onPressed,
            icon: Icon(icon, size: isMobile ? 18 : 20),
            label: Text(
              label,
              style: AppFonts.button().copyWith(
                color: accentColor,
                fontWeight: AppFonts.medium,
                fontSize: fontSize ?? (isMobile ? 14 : 15),
              ),
            ),
            style: _buttonStyle(accentColor, buttonPadding, buttonSize),
          )
        : OutlinedButton(
            onPressed: onPressed,
            style: _buttonStyle(accentColor, buttonPadding, buttonSize),
            child: Text(
              label,
              style: AppFonts.button().copyWith(
                color: accentColor,
                fontWeight: AppFonts.medium,
                fontSize: fontSize ?? (isMobile ? 14 : 15),
              ),
            ),
          );
  }

  ButtonStyle _buttonStyle(
      Color accentColor, EdgeInsets buttonPadding, Size buttonSize) {
    return OutlinedButton.styleFrom(
      foregroundColor: accentColor,
      side: BorderSide(
        color: accentColor.withOpacity(0.5),
        width: 1.5,
      ),
      padding: buttonPadding,
      minimumSize: buttonSize,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}

/// Icon Button with Hover Effect
/// Used for action buttons in cards and dialogs
class IconButtonWithHover extends StatefulWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final String? tooltip;
  final double size;
  final Color? iconColor;
  final Color? hoverColor;

  const IconButtonWithHover({
    super.key,
    required this.icon,
    required this.onPressed,
    this.tooltip,
    this.size = 24,
    this.iconColor,
    this.hoverColor,
  });

  @override
  State<IconButtonWithHover> createState() => _IconButtonWithHoverState();
}

class _IconButtonWithHoverState extends State<IconButtonWithHover> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final defaultColor = widget.iconColor ??
        (isDark ? AppColors.accentDark : AppColors.accentLight);
    final hoverColor = widget.hoverColor ?? defaultColor.withOpacity(0.7);

    final button = MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: IconButton(
        icon: Icon(widget.icon),
        iconSize: widget.size,
        color: _isHovered ? hoverColor : defaultColor,
        onPressed: widget.onPressed,
      ),
    );

    return widget.tooltip != null
        ? Tooltip(message: widget.tooltip!, child: button)
        : button;
  }
}

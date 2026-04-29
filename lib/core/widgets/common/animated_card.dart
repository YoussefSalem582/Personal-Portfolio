import 'package:flutter/material.dart';
import '../../../utils/assets/app_constants.dart';
import '../../theme/app_theme.dart';

/// Common Animated Card Widget
/// Reusable card with hover effects and animations
class AnimatedCard extends StatefulWidget {
  final Widget child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double borderRadius;
  final bool enableHoverEffect;
  final bool enableScaleAnimation;
  final double scaleAmount;
  final Duration animationDuration;
  final List<Color>? gradientColors;
  final Color? hoverBorderColor;
  final double elevation;
  final double hoverElevation;
  final VoidCallback? onTap;

  const AnimatedCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.borderRadius = AppTheme.radiusL,
    this.enableHoverEffect = true,
    this.enableScaleAnimation = true,
    this.scaleAmount = 1.05,
    this.animationDuration = const Duration(milliseconds: 200),
    this.gradientColors,
    this.hoverBorderColor,
    this.elevation = 3,
    this.hoverElevation = 8,
    this.onTap,
  });

  @override
  State<AnimatedCard> createState() => _AnimatedCardState();
}

class _AnimatedCardState extends State<AnimatedCard>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: widget.scaleAmount)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    Widget cardWidget = Card(
      margin: widget.margin,
      elevation: _isHovered ? widget.hoverElevation : widget.elevation,
      shadowColor: isDark
          ? AppColors.accentDark.withOpacity(0.3)
          : AppColors.accentLight.withOpacity(0.2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(widget.borderRadius),
      ),
      child: AnimatedContainer(
        duration: widget.animationDuration,
        padding: widget.padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          gradient: widget.gradientColors != null
              ? LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: widget.gradientColors!,
                )
              : null,
          border: Border.all(
            color: _isHovered && widget.hoverBorderColor != null
                ? widget.hoverBorderColor!
                : AppColors.transparent,
            width: 1.5,
          ),
        ),
        child: widget.child,
      ),
    );

    if (widget.onTap != null) {
      cardWidget = InkWell(
        onTap: widget.onTap,
        borderRadius: BorderRadius.circular(widget.borderRadius),
        child: cardWidget,
      );
    }

    if (!widget.enableHoverEffect) {
      return cardWidget;
    }

    cardWidget = MouseRegion(
      onEnter: (_) {
        setState(() => _isHovered = true);
        if (widget.enableScaleAnimation) {
          _controller.forward();
        }
      },
      onExit: (_) {
        setState(() => _isHovered = false);
        if (widget.enableScaleAnimation) {
          _controller.reverse();
        }
      },
      child: cardWidget,
    );

    if (widget.enableScaleAnimation) {
      cardWidget = AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: child,
          );
        },
        child: cardWidget,
      );
    }

    return cardWidget;
  }
}

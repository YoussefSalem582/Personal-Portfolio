import 'package:flutter/material.dart';
import '../../utils/assets/app_constants.dart';

import '../../theme/app_theme.dart';

/// A single statistic card widget with enhanced UI/UX.
///
/// Features:
/// - Hover effects with scale animation
/// - Dynamic gradient backgrounds based on theme
/// - Icon support for visual enhancement
/// - Smooth transitions and shadows
/// - Theme-aware colors
///
/// Examples:
/// - Title: "10+", Subtitle: "Projects Completed"
/// - Title: "2+", Subtitle: "Years Experience"
/// - Title: "100%", Subtitle: "Client Satisfaction"
class StatCardWidget extends StatefulWidget {
  /// The main statistic value (e.g., "10+", "2+", "100%")
  final String title;

  /// The description of the statistic (e.g., "Projects Completed")
  final String subtitle;

  /// Optional icon to display above the stat
  final IconData? icon;

  const StatCardWidget({
    super.key,
    required this.title,
    required this.subtitle,
    this.icon,
  });

  @override
  State<StatCardWidget> createState() => _StatCardWidgetState();
}

class _StatCardWidgetState extends State<StatCardWidget>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return MouseRegion(
      onEnter: (_) {
        setState(() => _isHovered = true);
        _controller.forward();
      },
      onExit: (_) {
        setState(() => _isHovered = false);
        _controller.reverse();
      },
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Card(
              elevation: _isHovered ? 8 : 3,
              shadowColor: isDark
                  ? AppColors.accentDark.withOpacity(0.3)
                  : AppColors.accentLight.withOpacity(0.2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppTheme.radiusL),
              ),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppTheme.radiusL),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: _isHovered
                        ? (isDark
                            ? [
                                AppColors.accentDark.withOpacity(0.2),
                                AppColors.primaryDark.withOpacity(0.15),
                              ]
                            : [
                                AppColors.accentLight.withOpacity(0.15),
                                AppColors.primaryLight.withOpacity(0.1),
                              ])
                        : (isDark
                            ? [
                                AppColors.cardDark,
                                AppColors.cardDark,
                              ]
                            : [
                                AppColors.surfaceLight,
                                AppColors.surfaceLight.withOpacity(0.95),
                              ]),
                  ),
                  border: Border.all(
                    color: _isHovered
                        ? (isDark
                            ? AppColors.accentDark.withOpacity(0.5)
                            : AppColors.accentLight.withOpacity(0.3))
                        : AppColors.transparent,
                    width: 1.5,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppTheme.spacingM,
                    vertical: AppTheme.spacingL,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Optional icon
                      if (widget.icon != null) ...[
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: isDark
                                  ? [
                                      AppColors.accentDark
                                          .withOpacity(0.2),
                                      AppColors.accentDark
                                          .withOpacity(0.1),
                                    ]
                                  : [
                                      AppColors.accentLight
                                          .withOpacity(0.2),
                                      AppColors.primaryLight
                                          .withOpacity(0.1),
                                    ],
                            ),
                          ),
                          child: Icon(
                            widget.icon,
                            size: 24,
                            color: isDark
                                ? AppColors.accentDark
                                : AppColors.accentLight,
                          ),
                        ),
                        const SizedBox(height: AppTheme.spacingM),
                      ],

                      // Large title with accent color (stat value)
                      ShaderMask(
                        shaderCallback: (bounds) => LinearGradient(
                          colors: isDark
                              ? [
                                  AppColors.accentDark,
                                  AppColors.accentDark.withOpacity(0.8),
                                ]
                              : [
                                  AppColors.accentLight,
                                  AppColors.primaryLight,
                                ],
                        ).createShader(bounds),
                        child: Text(
                          widget.title,
                          style: AppFonts.h1().copyWith(
                            color: AppColors.white,
                            fontWeight: AppFonts.extraBold,
                            letterSpacing: -0.5,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),

                      const SizedBox(height: AppTheme.spacingS),

                      // Divider line
                      Container(
                        width: 40,
                        height: 3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          gradient: LinearGradient(
                            colors: isDark
                                ? [
                                    AppColors.accentDark,
                                    AppColors.transparent,
                                  ]
                                : [
                                    AppColors.accentLight,
                                    AppColors.transparent,
                                  ],
                          ),
                        ),
                      ),

                      const SizedBox(height: AppTheme.spacingS),

                      // Subtitle (stat description)
                      Text(
                        widget.subtitle,
                        style: (isDark
                                ? AppFonts.bodyMedium()
                                : AppFonts.bodyMedium())
                            .copyWith(
                          color: isDark ? AppColors.gray300 : AppColors.gray700,
                          fontWeight: AppFonts.semiBold,
                          letterSpacing: 0.5,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

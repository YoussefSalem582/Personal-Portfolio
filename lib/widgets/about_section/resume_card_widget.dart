import 'package:flutter/material.dart';
import '../../utils/assets/app_constants.dart';
import '../../utils/data/portfolio_data.dart';
import '../../utils/url_helper.dart';

import '../../theme/app_theme.dart';

/// A prominent card with a button to view the resume/CV.
///
/// Features:
/// - Modern gradient background with glassmorphism
/// - Animated GIF icon
/// - Hover effects and animations
/// - Professional styling
///
/// The resume URL is retrieved from PortfolioData and opened using UrlHelper.
class ResumeCardWidget extends StatefulWidget {
  const ResumeCardWidget({super.key});

  @override
  State<ResumeCardWidget> createState() => _ResumeCardWidgetState();
}

class _ResumeCardWidgetState extends State<ResumeCardWidget>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat(reverse: true);

    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        transform: Matrix4.identity()
          ..translateByDouble(0.0, _isHovered ? -12.0 : 0.0, 0.0, 1.0)
          ..scaleByDouble(
              _isHovered ? 1.02 : 1.0, _isHovered ? 1.02 : 1.0, 1.0, 1.0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppTheme.radiusXL),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: isDark
                  ? [
                      AppColors.primaryLight,
                      AppColors.accentDark,
                      AppColors.primaryDark,
                    ]
                  : [
                      AppColors.primaryLight,
                      AppColors.accentLight,
                      AppColors.primaryLight.withValues(alpha: 0.8),
                    ],
            ),
            boxShadow: [
              BoxShadow(
                color: (isDark ? AppColors.primaryLight : AppColors.accentLight)
                    .withValues(alpha: _isHovered ? 0.5 : 0.3),
                blurRadius: _isHovered ? 32 : 20,
                offset: Offset(0, _isHovered ? 16 : 10),
              ),
            ],
          ),
          child: Stack(
            children: [
              // Animated decorative circles
              Positioned(
                top: -20,
                right: -20,
                child: AnimatedBuilder(
                  animation: _pulseAnimation,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _pulseAnimation.value,
                      child: Container(
                        width: 140,
                        height: 140,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: RadialGradient(
                            colors: [
                              AppColors.white.withValues(alpha: 0.15),
                              AppColors.white.withValues(alpha: 0.05),
                              AppColors.transparent,
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Positioned(
                bottom: -30,
                left: -30,
                child: AnimatedBuilder(
                  animation: _pulseAnimation,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: 2 - _pulseAnimation.value, // Opposite animation
                      child: Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: RadialGradient(
                            colors: [
                              AppColors.white.withValues(alpha: 0.12),
                              AppColors.white.withValues(alpha: 0.04),
                              AppColors.transparent,
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Main content
              Padding(
                padding: const EdgeInsets.all(AppTheme.spacingXL),
                child: Column(
                  children: [
                    // Animated GIF icon
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: _isHovered ? 110 : 100,
                      height: _isHovered ? 110 : 100,
                      decoration: BoxDecoration(
                        color: AppColors.white.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(AppTheme.radiusXL),
                        border: Border.all(
                          color: AppColors.white.withValues(alpha: 0.3),
                          width: 2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.white.withValues(alpha: 0.2),
                            blurRadius: _isHovered ? 20 : 12,
                            spreadRadius: _isHovered ? 2 : 0,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.circular(AppTheme.radiusXL - 2),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Image.asset(
                            'assets/icons/cv.gif',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: AppTheme.spacingL),

                    // Title with animation
                    AnimatedDefaultTextStyle(
                      duration: const Duration(milliseconds: 300),
                      style: AppFonts.h3().copyWith(
                        color: AppColors.white,
                        fontWeight: AppFonts.bold,
                        fontSize: _isHovered ? 26 : 24,
                        letterSpacing: 0.5,
                      ),
                      child: const Text(
                        'View My Resume',
                        textAlign: TextAlign.center,
                      ),
                    ),

                    const SizedBox(height: AppTheme.spacingS),

                    // Description
                    Text(
                      'Explore my professional journey,\nskills, and achievements',
                      style: AppFonts.bodyMedium().copyWith(
                        color: AppColors.white.withValues(alpha: 0.92),
                        fontWeight: AppFonts.medium,
                        height: 1.6,
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: AppTheme.spacingXL),

                    // View button with enhanced animation
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: InkWell(
                        onTap: () =>
                            UrlHelper.openFile(PortfolioData.resumeUrl),
                        borderRadius: BorderRadius.circular(AppTheme.radiusL),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          padding: EdgeInsets.symmetric(
                            horizontal: _isHovered
                                ? AppTheme.spacingXL + 4
                                : AppTheme.spacingXL,
                            vertical: AppTheme.spacingM + 4,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius:
                                BorderRadius.circular(AppTheme.radiusL),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.black
                                    .withValues(alpha: _isHovered ? 0.3 : 0.2),
                                blurRadius: _isHovered ? 16 : 12,
                                offset: Offset(0, _isHovered ? 6 : 4),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                AppIcons.view,
                                color: isDark
                                    ? AppColors.primaryLight
                                    : AppColors.accentLight,
                                size: 22,
                              ),
                              const SizedBox(width: AppTheme.spacingS),
                              Text(
                                'Open Resume',
                                style: AppFonts.button().copyWith(
                                  color: isDark
                                      ? AppColors.primaryLight
                                      : AppColors.accentLight,
                                  fontWeight: AppFonts.bold,
                                  fontSize: 16,
                                  letterSpacing: 0.5,
                                ),
                              ),
                              const SizedBox(width: AppTheme.spacingS),
                              AnimatedRotation(
                                duration: const Duration(milliseconds: 300),
                                turns: _isHovered ? 0.125 : 0, // 45 degrees
                                child: Icon(
                                  Icons.arrow_forward_rounded,
                                  color: isDark
                                      ? AppColors.primaryLight
                                      : AppColors.accentLight,
                                  size: 22,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../utils/assets/app_constants.dart';
import '../../utils/responsive_helper.dart';
import '../../theme/app_theme.dart';
import '../../widgets/hero_section/hero_text_widget.dart';
import '../../widgets/hero_section/profile_image_widget.dart';
import '../../widgets/hero_section/hero_action_buttons_widget.dart';

class HeroSection extends StatelessWidget {
  final Function(int)? onNavigateToSection;

  const HeroSection({
    super.key,
    this.onNavigateToSection,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isMobile = ResponsiveHelper.isMobile(screenWidth);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        minHeight: screenHeight - 80, // Minus navigation height
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isDark
              ? [AppColors.backgroundDark, AppColors.gray900]
              : [AppColors.backgroundLight, AppColors.gray50],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: ResponsiveHelper.getHorizontalPadding(screenWidth),
          vertical: AppTheme.spacingXL,
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: ResponsiveHelper.getMaxWidth(screenWidth),
          ),
          child: isMobile
              ? _buildMobileLayout(context)
              : _buildDesktopLayout(context),
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return AnimationLimiter(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Left side - Text content
          Expanded(
            flex: 6,
            child: AnimationConfiguration.staggeredList(
              position: 0,
              duration: const Duration(milliseconds: 1000),
              child: SlideAnimation(
                horizontalOffset: -50.0,
                child: FadeInAnimation(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const HeroTextWidget(),
                      const SizedBox(height: AppTheme.spacingXXL),
                      HeroActionButtonsWidget(
                        onNavigateToSection: onNavigateToSection,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(width: AppTheme.spacingXXL * 1.5),

          // Right side - Profile image with decorative elements
          Expanded(
            flex: 5,
            child: AnimationConfiguration.staggeredList(
              position: 1,
              duration: const Duration(milliseconds: 1000),
              child: SlideAnimation(
                horizontalOffset: 50.0,
                child: FadeInAnimation(
                  child: _buildProfileImageWithDecoration(context),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return AnimationLimiter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: AnimationConfiguration.toStaggeredList(
          duration: const Duration(milliseconds: 375),
          childAnimationBuilder: (widget) => SlideAnimation(
            verticalOffset: 50.0,
            child: FadeInAnimation(child: widget),
          ),
          children: [
            const SizedBox(height: AppTheme.spacingL),
            _buildProfileImageWithDecoration(context),
            const SizedBox(height: AppTheme.spacingXXL),
            const HeroTextWidget(),
            const SizedBox(height: AppTheme.spacingXL),
            HeroActionButtonsWidget(
              onNavigateToSection: onNavigateToSection,
            ),
            const SizedBox(height: AppTheme.spacingL),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileImageWithDecoration(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = ResponsiveHelper.isMobile(screenWidth);

    return Stack(
      alignment: Alignment.center,
      children: [
        // Decorative background circles
        if (!isMobile) ...[
          Positioned(
            top: -30,
            right: -30,
            child: Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    (isDark ? AppColors.accentDark : AppColors.accentLight)
                        .withValues(alpha: 0.1),
                    (isDark ? AppColors.accentDark : AppColors.accentLight)
                        .withValues(alpha: 0.05),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -40,
            left: -40,
            child: Container(
              width: 220,
              height: 220,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    (isDark ? AppColors.primaryDark : AppColors.primaryLight)
                        .withValues(alpha: 0.1),
                    (isDark ? AppColors.primaryDark : AppColors.primaryLight)
                        .withValues(alpha: 0.05),
                  ],
                ),
              ),
            ),
          ),
        ],

        // Animated floating dots
        if (!isMobile) ...[
          Positioned(
            top: 50,
            left: 20,
            child: _buildFloatingDot(isDark, delay: 0),
          ),
          Positioned(
            bottom: 80,
            right: 40,
            child: _buildFloatingDot(isDark, delay: 1000),
          ),
          Positioned(
            top: 180,
            right: 10,
            child: _buildFloatingDot(isDark, delay: 2000, size: 12),
          ),
        ],

        // Main profile image
        Container(
          padding: const EdgeInsets.all(20),
          child: const ProfileImageWidget(),
        ),
      ],
    );
  }

  Widget _buildFloatingDot(bool isDark, {int delay = 0, double size = 16}) {
    return TweenAnimationBuilder(
      duration: const Duration(seconds: 3),
      tween: Tween<double>(begin: 0, end: 20),
      builder: (context, double value, child) {
        return Transform.translate(
          offset: Offset(0, value),
          child: child,
        );
      },
      onEnd: () {},
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [
              isDark ? AppColors.accentDark : AppColors.accentLight,
              (isDark ? AppColors.primaryDark : AppColors.primaryLight)
                  .withValues(alpha: 0.8),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: (isDark ? AppColors.accentDark : AppColors.accentLight)
                  .withValues(alpha: 0.4),
              blurRadius: 12,
              spreadRadius: 2,
            ),
          ],
        ),
      ),
    );
  }
}

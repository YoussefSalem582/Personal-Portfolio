import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../utils/assets/app_constants.dart';
import '../../utils/responsive_helper.dart';
import '../../theme/app_theme.dart';
import '../../widgets/hero_section/hero_text_widget.dart';
import '../../widgets/hero_section/profile_image_widget.dart';
import '../../widgets/hero_section/hero_action_buttons_widget.dart';
import '../../widgets/about_section/social_links_widget.dart';

class HeroSection extends StatefulWidget {
  final Function(int)? onNavigateToSection;

  const HeroSection({
    super.key,
    this.onNavigateToSection,
  });

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with TickerProviderStateMixin {
  late List<AnimationController> _dotControllers;

  @override
  void initState() {
    super.initState();
    // Create 8 animation controllers for the floating dots
    _dotControllers = List.generate(
      8,
      (index) => AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 2500 + (index * 200)),
      )..repeat(reverse: true),
    );
  }

  @override
  void dispose() {
    for (var controller in _dotControllers) {
      controller.dispose();
    }
    super.dispose();
  }

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
      child: Stack(
        children: [
          // Background decorative circles throughout the section
          Positioned.fill(
            child: _buildBackgroundDecoration(isDark, isMobile, screenHeight),
          ),

          // Main content
          Center(
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
          ),
        ],
      ),
    );
  }

  Widget _buildBackgroundDecoration(
      bool isDark, bool isMobile, double screenHeight) {
    return Stack(
      children: [
        // Large decorative circles
        Positioned(
          top: -100,
          right: -100,
          child: Container(
            width: 400,
            height: 400,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  (isDark ? AppColors.accentDark : AppColors.accentLight)
                      .withOpacity(0.15),
                  (isDark ? AppColors.accentDark : AppColors.accentLight)
                      .withOpacity(0.05),
                  AppColors.transparent,
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: -150,
          left: -150,
          child: Container(
            width: 500,
            height: 500,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  (isDark ? AppColors.primaryLight : AppColors.primaryLight)
                      .withOpacity(0.12),
                  (isDark ? AppColors.primaryLight : AppColors.primaryLight)
                      .withOpacity(0.06),
                  AppColors.transparent,
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: screenHeight * 0.3,
          left: -80,
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  (isDark ? AppColors.accentDark : AppColors.accentLight)
                      .withOpacity(0.1),
                  (isDark ? AppColors.accentDark : AppColors.accentLight)
                      .withOpacity(0.03),
                  AppColors.transparent,
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: screenHeight * 0.2,
          right: isMobile ? -50 : 100,
          child: Container(
            width: 250,
            height: 250,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  (isDark ? AppColors.primaryDark : AppColors.primaryLight)
                      .withOpacity(0.08),
                  (isDark ? AppColors.primaryDark : AppColors.primaryLight)
                      .withOpacity(0.02),
                  AppColors.transparent,
                ],
              ),
            ),
          ),
        ),

        // Animated floating dots scattered throughout
        if (!isMobile) ...[
          Positioned(
            top: 80,
            left: 60,
            child: _buildFloatingDot(isDark, controllerIndex: 0),
          ),
          Positioned(
            top: 200,
            right: 150,
            child: _buildFloatingDot(isDark, controllerIndex: 1, size: 14),
          ),
          Positioned(
            bottom: 150,
            left: 200,
            child: _buildFloatingDot(isDark, controllerIndex: 2, size: 12),
          ),
          Positioned(
            bottom: 100,
            right: 80,
            child: _buildFloatingDot(isDark, controllerIndex: 3),
          ),
          Positioned(
            top: screenHeight * 0.4,
            left: 100,
            child: _buildFloatingDot(isDark, controllerIndex: 4, size: 10),
          ),
          Positioned(
            top: screenHeight * 0.5,
            right: 200,
            child: _buildFloatingDot(isDark, controllerIndex: 5, size: 18),
          ),
          Positioned(
            top: 140,
            right: 300,
            child: _buildFloatingDot(isDark, controllerIndex: 6, size: 8),
          ),
          Positioned(
            bottom: 250,
            left: 150,
            child: _buildFloatingDot(isDark, controllerIndex: 7, size: 15),
          ),
        ],
      ],
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
                        onNavigateToSection: widget.onNavigateToSection,
                      ),
                      const SizedBox(height: AppTheme.spacingXL),
                      const SocialLinksWidget(),
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
              onNavigateToSection: widget.onNavigateToSection,
            ),
            const SizedBox(height: AppTheme.spacingXL),
            const SocialLinksWidget(),
            const SizedBox(height: AppTheme.spacingL),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileImageWithDecoration(BuildContext context) {
    return const ProfileImageWidget();
  }

  Widget _buildFloatingDot(bool isDark,
      {required int controllerIndex, double size = 16}) {
    return AnimatedBuilder(
      animation: _dotControllers[controllerIndex],
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(
            0,
            _dotControllers[controllerIndex].value * 20 - 10,
          ),
          child: child,
        );
      },
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [
              isDark ? AppColors.accentDark : AppColors.accentLight,
              (isDark ? AppColors.primaryDark : AppColors.primaryLight)
                  .withOpacity(0.8),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: (isDark ? AppColors.accentDark : AppColors.accentLight)
                  .withOpacity(0.5),
              blurRadius: 15,
              spreadRadius: 3,
            ),
          ],
        ),
      ),
    );
  }
}

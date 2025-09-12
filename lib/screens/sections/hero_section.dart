import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../theme/app_theme.dart';
import '../../utils/responsive_helper.dart';
import '../../utils/portfolio_data.dart';
import '../../utils/url_helper.dart';
import '../../widgets/project_card.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isMobile = ResponsiveHelper.isMobile(screenWidth);

    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        minHeight: screenHeight - 80, // Minus navigation height
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppTheme.backgroundColor, Color(0xFFF0F2F5)],
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
            child: AnimationConfiguration.staggeredList(
              position: 0,
              duration: const Duration(milliseconds: 1000),
              child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildHeroText(),
                      const SizedBox(height: AppTheme.spacingXL),
                      _buildActionButtons(context),
                    ],
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(width: AppTheme.spacingXXL),

          // Right side - Profile image and featured projects
          Expanded(
            child: AnimationConfiguration.staggeredList(
              position: 1,
              duration: const Duration(milliseconds: 1000),
              child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(
                  child: Column(
                    children: [
                      _buildProfileImage(),
                      const SizedBox(height: AppTheme.spacingXL),
                      _buildFeaturedProjects(context),
                    ],
                  ),
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
            const SizedBox(height: AppTheme.spacingXL),
            _buildProfileImage(),
            const SizedBox(height: AppTheme.spacingXL),
            _buildHeroText(),
            const SizedBox(height: AppTheme.spacingXL),
            _buildActionButtons(context),
            const SizedBox(height: AppTheme.spacingXXL),
            _buildFeaturedProjects(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Greeting
        Text(
          'Hello, I\'m',
          style: AppTheme.bodyLarge.copyWith(
            color: AppTheme.accentColor,
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: AppTheme.spacingS),

        // Name
        Text(
          PortfolioData.fullName,
          style: AppTheme.headingLarge.copyWith(fontSize: 42),
        ),

        const SizedBox(height: AppTheme.spacingM),

        // Animated role text
        Row(
          children: [
            Text(
              'A ',
              style: AppTheme.headingMedium.copyWith(
                color: AppTheme.textSecondary,
                fontSize: 28,
              ),
            ),
            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  'Flutter Developer',
                  textStyle: AppTheme.headingMedium.copyWith(
                    color: AppTheme.accentColor,
                    fontSize: 28,
                  ),
                  speed: const Duration(milliseconds: 100),
                ),
                TypewriterAnimatedText(
                  'Mobile App Developer',
                  textStyle: AppTheme.headingMedium.copyWith(
                    color: AppTheme.accentColor,
                    fontSize: 28,
                  ),
                  speed: const Duration(milliseconds: 100),
                ),
                TypewriterAnimatedText(
                  'AI Enthusiast',
                  textStyle: AppTheme.headingMedium.copyWith(
                    color: AppTheme.accentColor,
                    fontSize: 28,
                  ),
                  speed: const Duration(milliseconds: 100),
                ),
              ],
              repeatForever: true,
              pause: const Duration(milliseconds: 2000),
            ),
          ],
        ),

        const SizedBox(height: AppTheme.spacingL),

        // Bio
        Text(
          PortfolioData.bio,
          style: AppTheme.bodyLarge,
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget _buildProfileImage() {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: AppTheme.primaryGradient,
        boxShadow: [
          BoxShadow(
            color: AppTheme.accentColor.withOpacity(0.3),
            blurRadius: 20,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Container(
        margin: const EdgeInsets.all(4),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppTheme.surfaceColor,
        ),
        child: ClipOval(
          child: Image.asset(
            'assets/profile.jpeg',
            width: 192,
            height: 192,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                width: 192,
                height: 192,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppTheme.accentColor.withOpacity(0.1),
                ),
                child: Icon(
                  Icons.person,
                  size: 80,
                  color: AppTheme.accentColor,
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Wrap(
      spacing: AppTheme.spacingM,
      runSpacing: AppTheme.spacingM,
      children: [
        ElevatedButton(
          onPressed: () => _scrollToSection(context, 4), // Contact section
          child: const Text('Get In Touch'),
        ),
        OutlinedButton(
          onPressed: () => UrlHelper.downloadFile(PortfolioData.resumeUrl),
          child: const Text('Download CV'),
        ),
        OutlinedButton(
          onPressed: () => _scrollToSection(context, 2), // Projects section
          child: const Text('View Projects'),
        ),
      ],
    );
  }

  Widget _buildFeaturedProjects(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final featuredProjects = PortfolioData.featuredProjects;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Featured Projects', style: AppTheme.headingSmall),

        const SizedBox(height: AppTheme.spacingL),

        if (ResponsiveHelper.isMobile(screenWidth))
          // Mobile: Single column
          Column(
            children: featuredProjects
                .take(2)
                .map(
                  (project) => Padding(
                    padding: const EdgeInsets.only(bottom: AppTheme.spacingM),
                    child: ProjectCard(project: project, isCompact: true),
                  ),
                )
                .toList(),
          )
        else
          // Desktop/Tablet: Row layout
          Row(
            children: featuredProjects
                .take(2)
                .map(
                  (project) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: AppTheme.spacingM),
                      child: ProjectCard(project: project, isCompact: true),
                    ),
                  ),
                )
                .toList(),
          ),
      ],
    );
  }

  void _scrollToSection(BuildContext context, int sectionIndex) {
    // This would need to be implemented with a scroll controller
    // For now, we'll use a simple scroll behavior
    final portfolioScreen = context.findAncestorStateOfType<State>();
    if (portfolioScreen != null) {
      // Implementation would go here to scroll to specific section
    }
  }
}

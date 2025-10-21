import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../models/project.dart';
import '../theme/app_theme.dart';
import '../utils/responsive_helper.dart';
import '../utils/url_helper.dart';
import '../widgets/lazy_image.dart';

class ProjectCaseStudy extends StatefulWidget {
  final Project project;

  const ProjectCaseStudy({super.key, required this.project});

  @override
  State<ProjectCaseStudy> createState() => _ProjectCaseStudyState();
}

class _ProjectCaseStudyState extends State<ProjectCaseStudy> {
  final PageController _pageController = PageController();
  final int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isMobile = ResponsiveHelper.isMobile(screenWidth);

    return Scaffold(
      backgroundColor:
          isDark ? AppTheme.darkBackgroundColor : AppTheme.backgroundColor,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                // Hero section (full viewport height)
                _buildHeroSection(context, screenHeight),

                // Content section
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: ResponsiveHelper.getMaxWidth(screenWidth),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal:
                          ResponsiveHelper.getHorizontalPadding(screenWidth),
                      vertical: AppTheme.spacingXL,
                    ),
                    child: AnimationLimiter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: AnimationConfiguration.toStaggeredList(
                          duration: const Duration(milliseconds: 375),
                          childAnimationBuilder: (widget) => SlideAnimation(
                            verticalOffset: 50.0,
                            child: FadeInAnimation(child: widget),
                          ),
                          children: [
                            _buildProjectOverview(),
                            const SizedBox(height: AppTheme.spacingXXL),
                            _buildTechnicalDetails(),
                            const SizedBox(height: AppTheme.spacingXXL),
                            if (widget.project.galleryImages != null &&
                                widget.project.galleryImages!.isNotEmpty)
                              _buildGallerySection(isMobile),
                            if (widget.project.galleryImages != null &&
                                widget.project.galleryImages!.isNotEmpty)
                              const SizedBox(height: AppTheme.spacingXXL),
                            _buildChallengesAndSolutions(),
                            const SizedBox(height: AppTheme.spacingXXL),
                            _buildLessonsLearned(),
                            const SizedBox(height: AppTheme.spacingXXL),
                            _buildActionButtons(context),
                            const SizedBox(height: AppTheme.spacingXXL),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Back button overlay
          Positioned(
            top: 16,
            left: 16,
            child: SafeArea(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.2),
                        width: 1,
                      ),
                    ),
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context, double screenHeight) {
    // Calculate total pages based on gallery images + 1 for main hero
    final totalPages = (widget.project.galleryImages?.length ?? 0) + 1;
    final heroHeight = screenHeight * 0.5; // 50% of screen height, max 500px
    final clampedHeight = heroHeight.clamp(350.0, 500.0);

    return Container(
      width: double.infinity,
      height: clampedHeight,
      decoration: const BoxDecoration(
        gradient: AppTheme.primaryGradient,
      ),
      child: Stack(
        children: [
          if (widget.project.imageUrl != null)
            LazyImage(
              imageUrl: widget.project.imageUrl!,
              width: double.infinity,
              height: clampedHeight,
              fit: BoxFit.contain,
            ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withValues(alpha: 0.3),
                  Colors.black.withValues(alpha: 0.7),
                ],
              ),
            ),
          ),

          // Page indicator badge (like "1/9")
          if (totalPages > 1)
            Positioned(
              top: 16,
              right: 16,
              child: SafeArea(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.2),
                      width: 1,
                    ),
                  ),
                  child: Text(
                    '${_currentPage + 1}/$totalPages',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),

          Positioned(
            bottom: AppTheme.spacingXXL,
            left: AppTheme.spacingXL,
            right: AppTheme.spacingXL,
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.project.title,
                    style: AppTheme.headingLarge.copyWith(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: AppTheme.spacingM),
                  Text(
                    widget.project.shortDescription,
                    style: AppTheme.bodyLarge.copyWith(
                      color: Colors.white.withValues(alpha: 0.95),
                      fontSize: 16,
                      shadows: [
                        Shadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 8,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectOverview() {
    return Builder(
      builder: (context) {
        final isDark = Theme.of(context).brightness == Brightness.dark;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Project Overview',
              style: AppTheme.headingLarge.copyWith(
                color: isDark ? AppTheme.darkTextPrimary : AppTheme.textPrimary,
              ),
            ),
            const SizedBox(height: AppTheme.spacingL),
            Container(
              padding: const EdgeInsets.all(AppTheme.spacingL),
              decoration: BoxDecoration(
                color:
                    isDark ? AppTheme.darkSurfaceColor : AppTheme.surfaceColor,
                borderRadius: BorderRadius.circular(AppTheme.radiusM),
                border: Border.all(
                  color:
                      (isDark ? AppTheme.darkAccentColor : AppTheme.accentColor)
                          .withValues(alpha: 0.1),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _getProjectOverviewText(),
                    style: AppTheme.bodyLarge.copyWith(
                      height: 1.6,
                      color: isDark
                          ? AppTheme.darkTextSecondary
                          : AppTheme.textSecondary,
                    ),
                  ),
                  if (widget.project.id == 'emosense-app')
                    _buildEmosenseFeatures(isDark),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildTechnicalDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Technical Stack', style: AppTheme.headingLarge),
        const SizedBox(height: AppTheme.spacingL),
        Wrap(
          spacing: AppTheme.spacingM,
          runSpacing: AppTheme.spacingM,
          children: widget.project.technologies.map((tech) {
            return Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppTheme.spacingM,
                vertical: AppTheme.spacingS,
              ),
              decoration: BoxDecoration(
                color: AppTheme.accentColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(AppTheme.radiusS),
                border: Border.all(
                  color: AppTheme.accentColor.withValues(alpha: 0.3),
                ),
              ),
              child: Text(
                tech,
                style: AppTheme.bodyMedium.copyWith(
                  color: AppTheme.accentColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildGallerySection(bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Screenshots & Gallery', style: AppTheme.headingLarge),
        const SizedBox(height: AppTheme.spacingL),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: isMobile ? 2 : 3,
            crossAxisSpacing: AppTheme.spacingM,
            mainAxisSpacing: AppTheme.spacingM,
            childAspectRatio: 0.65,
          ),
          itemCount: widget.project.galleryImages!.length,
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(AppTheme.radiusM),
              child: LazyImage(
                imageUrl: widget.project.galleryImages![index],
                fit: BoxFit.contain,
                borderRadius: BorderRadius.circular(AppTheme.radiusM),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildChallengesAndSolutions() {
    final challenges = _getProjectChallenges();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Challenges & Solutions', style: AppTheme.headingLarge),
        const SizedBox(height: AppTheme.spacingL),
        ...challenges.map((challenge) {
          return Container(
            margin: const EdgeInsets.only(bottom: AppTheme.spacingL),
            padding: const EdgeInsets.all(AppTheme.spacingL),
            decoration: BoxDecoration(
              color: AppTheme.surfaceColor,
              borderRadius: BorderRadius.circular(AppTheme.radiusM),
              border: Border.all(
                color: AppTheme.accentColor.withValues(alpha: 0.1),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.lightbulb_outline,
                      color: AppTheme.accentColor,
                      size: 20,
                    ),
                    const SizedBox(width: AppTheme.spacingS),
                    Text(
                      challenge['title']!,
                      style: AppTheme.headingSmall.copyWith(
                        color: AppTheme.accentColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppTheme.spacingM),
                Text(
                  challenge['description']!,
                  style: AppTheme.bodyMedium.copyWith(height: 1.5),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }

  Widget _buildLessonsLearned() {
    final lessons = _getProjectLessons();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Key Learnings', style: AppTheme.headingLarge),
        const SizedBox(height: AppTheme.spacingL),
        ...lessons.map((lesson) {
          return Container(
            margin: const EdgeInsets.only(bottom: AppTheme.spacingM),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 6),
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: AppTheme.accentColor,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: AppTheme.spacingM),
                Expanded(
                  child: Text(
                    lesson,
                    style: AppTheme.bodyMedium.copyWith(height: 1.5),
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      children: [
        // View Case Study button (primary)
        if (widget.project.liveUrl != null)
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () => UrlHelper.launchURL(widget.project.liveUrl!),
              icon: const Icon(Icons.description_outlined, size: 20),
              label: const Text('View Case Study'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 18),
                backgroundColor:
                    isDark ? AppTheme.darkAccentColor : AppTheme.accentColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              ),
            ),
          ),

        if (widget.project.liveUrl != null && widget.project.githubUrl != null)
          const SizedBox(height: AppTheme.spacingM),

        // View Code button (secondary)
        if (widget.project.githubUrl != null)
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () => UrlHelper.launchURL(widget.project.githubUrl!),
              icon: const Icon(Icons.code_outlined, size: 20),
              label: const Text('View Code'),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 18),
                side: BorderSide(
                  color:
                      isDark ? AppTheme.darkAccentColor : AppTheme.accentColor,
                  width: 2,
                ),
                foregroundColor:
                    isDark ? AppTheme.darkAccentColor : AppTheme.accentColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
      ],
    );
  }

  List<Map<String, String>> _getProjectChallenges() {
    // This could be dynamically generated based on project type/technologies
    switch (widget.project.id) {
      case 'emosense-app':
        return [
          {
            'title': 'Multimodal Data Integration',
            'description':
                'Combining audio and video processing required careful synchronization and data preprocessing to ensure accurate emotion detection across different modalities.',
          },
          {
            'title': 'Privacy-First Design',
            'description':
                'Implementing local processing while maintaining accuracy was challenging, but essential for user privacy in mental health applications.',
          },
        ];
      case 'music-player':
        return [
          {
            'title': 'Background Audio Processing',
            'description':
                'Implementing smooth background playback while maintaining UI responsiveness required careful state management and audio session handling.',
          },
          {
            'title': 'Cross-Platform Audio Support',
            'description':
                'Ensuring consistent audio playback across different platforms required platform-specific optimizations and fallback mechanisms.',
          },
        ];
      default:
        return [
          {
            'title': 'Performance Optimization',
            'description':
                'Ensuring smooth performance across different devices required careful optimization of rendering and state management.',
          },
          {
            'title': 'User Experience Design',
            'description':
                'Creating an intuitive interface that works well on both mobile and web platforms required responsive design considerations.',
          },
        ];
    }
  }

  List<String> _getProjectLessons() {
    switch (widget.project.id) {
      case 'emosense-app':
        return [
          'Deep understanding of machine learning model evaluation and performance metrics',
          'Experience with multimodal data processing and synchronization',
          'Privacy-first development approaches for sensitive applications',
          'Importance of comprehensive testing with diverse datasets',
        ];
      case 'music-player':
        return [
          'Advanced state management patterns for complex audio applications',
          'Platform-specific optimizations for Flutter applications',
          'Audio processing and background task management',
          'Modern UI/UX design principles for media applications',
        ];
      default:
        return [
          'Flutter best practices for scalable application architecture',
          'Responsive design techniques for multi-platform support',
          'Performance optimization strategies for smooth user experience',
          'Modern development practices and testing methodologies',
        ];
    }
  }

  String _getProjectOverviewText() {
    if (widget.project.id == 'emosense-app') {
      return 'Emosense represents the culmination of my academic journey, combining cutting-edge AI technology with real-world applications. '
          'This multimodal emotion recognition system demonstrates expertise in machine learning, computer vision, and audio processing. '
          'The project addresses critical needs in mental health monitoring and customer service enhancement through innovative technology.';
    }
    return widget.project.description;
  }

  Widget _buildEmosenseFeatures(bool isDark) {
    final features = [
      {
        'icon': Icons.psychology,
        'title': 'Real-time Emotion Detection',
        'description':
            'Advanced ML models analyze facial expressions and vocal patterns for accurate emotion recognition'
      },
      {
        'icon': Icons.security,
        'title': 'Privacy-First Architecture',
        'description':
            'Built with privacy by design principles, ensuring user data protection and compliance'
      },
      {
        'icon': Icons.multitrack_audio,
        'title': 'Multimodal Analysis',
        'description':
            'Combines audio and video processing for comprehensive emotion understanding'
      },
      {
        'icon': Icons.analytics,
        'title': 'Advanced Analytics',
        'description':
            'Comprehensive emotion analytics dashboard with insights and reporting capabilities'
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: AppTheme.spacingXL),
        Text(
          'Key Features',
          style: AppTheme.headingMedium.copyWith(
            color: isDark ? AppTheme.darkTextPrimary : AppTheme.textPrimary,
          ),
        ),
        const SizedBox(height: AppTheme.spacingL),
        ...features.map((feature) => Padding(
              padding: const EdgeInsets.only(bottom: AppTheme.spacingL),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(AppTheme.spacingS),
                    decoration: BoxDecoration(
                      color: (isDark
                              ? AppTheme.darkAccentColor
                              : AppTheme.accentColor)
                          .withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(AppTheme.radiusS),
                    ),
                    child: Icon(
                      feature['icon'] as IconData,
                      color: isDark
                          ? AppTheme.darkAccentColor
                          : AppTheme.accentColor,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: AppTheme.spacingM),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          feature['title'] as String,
                          style: AppTheme.headingSmall.copyWith(
                            color: isDark
                                ? AppTheme.darkTextPrimary
                                : AppTheme.textPrimary,
                          ),
                        ),
                        const SizedBox(height: AppTheme.spacingS),
                        Text(
                          feature['description'] as String,
                          style: AppTheme.bodyMedium.copyWith(
                            color: isDark
                                ? AppTheme.darkTextSecondary
                                : AppTheme.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../models/project.dart';
import '../theme/app_theme.dart';
import '../utils/responsive_helper.dart';
import '../utils/url_helper.dart';
import '../widgets/lazy_image.dart';

class ProjectCaseStudy extends StatelessWidget {
  final Project project;

  const ProjectCaseStudy({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor:
          isDark ? AppTheme.darkBackgroundColor : AppTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor:
            isDark ? AppTheme.darkSurfaceColor : AppTheme.surfaceColor,
        elevation: 1,
        title: Text(
          project.title,
          style: AppTheme.headingMedium.copyWith(
            color: isDark ? AppTheme.darkTextPrimary : AppTheme.textPrimary,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: isDark ? AppTheme.darkTextPrimary : AppTheme.textPrimary,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: ResponsiveHelper.getMaxWidth(screenWidth),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ResponsiveHelper.getHorizontalPadding(screenWidth),
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
                    _buildHeroSection(context),
                    const SizedBox(height: AppTheme.spacingXXL),
                    _buildProjectOverview(),
                    const SizedBox(height: AppTheme.spacingXXL),
                    _buildTechnicalDetails(),
                    const SizedBox(height: AppTheme.spacingXXL),
                    if (project.galleryImages != null &&
                        project.galleryImages!.isNotEmpty)
                      _buildGallerySection(),
                    const SizedBox(height: AppTheme.spacingXXL),
                    _buildChallengesAndSolutions(),
                    const SizedBox(height: AppTheme.spacingXXL),
                    _buildLessonsLearned(),
                    const SizedBox(height: AppTheme.spacingXXL),
                    _buildActionButtons(context),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppTheme.radiusL),
        gradient: AppTheme.primaryGradient,
      ),
      child: Stack(
        children: [
          if (project.imageUrl != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(AppTheme.radiusL),
              child: LazyImage(
                imageUrl: project.imageUrl!,
                width: double.infinity,
                height: 400,
                fit: BoxFit.cover,
                borderRadius: BorderRadius.circular(AppTheme.radiusL),
              ),
            ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppTheme.radiusL),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.7),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: AppTheme.spacingXL,
            left: AppTheme.spacingXL,
            right: AppTheme.spacingXL,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  project.title,
                  style: AppTheme.headingLarge.copyWith(
                    color: Colors.white,
                    fontSize: 32,
                  ),
                ),
                const SizedBox(height: AppTheme.spacingM),
                Text(
                  project.shortDescription,
                  style: AppTheme.bodyLarge.copyWith(
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
              ],
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
                          .withOpacity(0.1),
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
                  if (project.id == 'emosense-app')
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
          children: project.technologies.map((tech) {
            return Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppTheme.spacingM,
                vertical: AppTheme.spacingS,
              ),
              decoration: BoxDecoration(
                color: AppTheme.accentColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(AppTheme.radiusS),
                border: Border.all(
                  color: AppTheme.accentColor.withOpacity(0.3),
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

  Widget _buildGallerySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Screenshots & Gallery', style: AppTheme.headingLarge),
        const SizedBox(height: AppTheme.spacingL),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: AppTheme.spacingM,
            mainAxisSpacing: AppTheme.spacingM,
            childAspectRatio: 0.7,
          ),
          itemCount: project.galleryImages!.length,
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(AppTheme.radiusM),
              child: LazyImage(
                imageUrl: project.galleryImages![index],
                fit: BoxFit.cover,
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
                color: AppTheme.accentColor.withOpacity(0.1),
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
        }).toList(),
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
        }).toList(),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      children: [
        if (project.githubUrl != null)
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () => UrlHelper.launchURL(project.githubUrl!),
              icon: const Icon(Icons.code),
              label: const Text('View Source Code'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: AppTheme.accentColor,
                foregroundColor: Colors.white,
              ),
            ),
          ),
        if (project.githubUrl != null && project.liveUrl != null)
          const SizedBox(width: AppTheme.spacingM),
        if (project.liveUrl != null)
          Expanded(
            child: OutlinedButton.icon(
              onPressed: () => UrlHelper.launchURL(project.liveUrl!),
              icon: const Icon(Icons.launch),
              label: const Text('Live Demo'),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                side: BorderSide(color: AppTheme.accentColor),
                foregroundColor: AppTheme.accentColor,
              ),
            ),
          ),
      ],
    );
  }

  List<Map<String, String>> _getProjectChallenges() {
    // This could be dynamically generated based on project type/technologies
    switch (project.id) {
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
    switch (project.id) {
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
    if (project.id == 'emosense-app') {
      return 'Emosense represents the culmination of my academic journey, combining cutting-edge AI technology with real-world applications. '
          'This multimodal emotion recognition system demonstrates expertise in machine learning, computer vision, and audio processing. '
          'The project addresses critical needs in mental health monitoring and customer service enhancement through innovative technology.';
    }
    return project.description;
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
        ...features
            .map((feature) => Padding(
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
                              .withOpacity(0.1),
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
                ))
            .toList(),
      ],
    );
  }
}

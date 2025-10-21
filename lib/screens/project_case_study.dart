import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../models/project.dart';
import '../theme/app_theme.dart';
import '../utils/responsive_helper.dart';
import '../widgets/project_case_study/hero_section_widget.dart';
import '../widgets/project_case_study/back_button_widget.dart';
import '../widgets/project_case_study/project_overview_widget.dart';
import '../widgets/project_case_study/technical_stack_widget.dart';
import '../widgets/project_case_study/gallery_section_widget.dart';
import '../widgets/project_case_study/challenges_solutions_widget.dart';
import '../widgets/project_case_study/key_learnings_widget.dart';
import '../widgets/project_case_study/action_buttons_widget.dart';
import '../widgets/project_case_study/project_content_helper.dart';

/// Project Case Study Screen
///
/// Full-screen view displaying detailed information about a project.
/// Uses modular widget architecture for better maintainability.
///
/// Features:
/// - Hero image gallery with PageView
/// - Project overview with custom content
/// - Technology stack display
/// - Screenshot gallery with lightbox
/// - Challenges and solutions
/// - Key learnings section
/// - Call-to-action buttons
/// - Staggered animations for smooth entrance
/// - Theme-aware responsive design
class ProjectCaseStudy extends StatefulWidget {
  /// Project data to display
  final Project project;

  const ProjectCaseStudy({super.key, required this.project});

  @override
  State<ProjectCaseStudy> createState() => _ProjectCaseStudyState();
}

class _ProjectCaseStudyState extends State<ProjectCaseStudy> {
  /// Controller for hero image PageView (allows swiping through images)
  final PageController _pageController = PageController();

  /// Current page index in the hero PageView
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    // Listen to page changes and update state for page indicator
    _pageController.addListener(() {
      final newPage = _pageController.page?.round() ?? 0;
      if (newPage != _currentPage) {
        setState(() {
          _currentPage = newPage;
        });
      }
    });
  }

  @override
  void dispose() {
    // Clean up controller to prevent memory leaks
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions for responsive layout
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Detect current theme mode
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Determine if mobile layout should be used
    final isMobile = ResponsiveHelper.isMobile(screenWidth);

    // Get project-specific custom content from helper
    final overviewText = ProjectContentHelper.getProjectOverviewText(
      widget.project.id,
      widget.project.description,
    );
    final challenges =
        ProjectContentHelper.getProjectChallenges(widget.project.id);
    final lessons = ProjectContentHelper.getProjectLessons(widget.project.id);

    return Scaffold(
      backgroundColor:
          isDark ? AppTheme.darkBackgroundColor : AppTheme.backgroundColor,
      body: Stack(
        children: [
          // Main scrollable content
          SingleChildScrollView(
            child: Column(
              children: [
                // Hero section with swipeable image gallery (PageView)
                SizedBox(
                  // Responsive height: 60% of screen, clamped between 400-600px
                  height: (screenHeight * 0.6).clamp(400.0, 600.0),
                  child: PageView(
                    controller: _pageController,
                    children: [
                      // Main project hero image
                      HeroSectionWidget(
                        project: widget.project,
                        currentPage: _currentPage,
                        screenHeight: screenHeight,
                      ),
                      // Additional gallery images as hero pages
                      if (widget.project.galleryImages != null)
                        ...widget.project.galleryImages!.map(
                          (imageUrl) => HeroSectionWidget(
                            // Create temporary project with gallery image as main image
                            project: Project(
                              id: widget.project.id,
                              title: widget.project.title,
                              description: widget.project.description,
                              shortDescription: widget.project.shortDescription,
                              technologies: widget.project.technologies,
                              imageUrl: imageUrl, // Use gallery image
                              createdAt: widget.project.createdAt,
                            ),
                            currentPage: _currentPage,
                            screenHeight: screenHeight,
                          ),
                        ),
                    ],
                  ),
                ),

                // Content section with max width constraint
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
                    // Staggered animations for smooth entrance
                    child: AnimationLimiter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: AnimationConfiguration.toStaggeredList(
                          duration: const Duration(milliseconds: 375),
                          // Slide up + fade in animation for each widget
                          childAnimationBuilder: (widget) => SlideAnimation(
                            verticalOffset: 50.0,
                            child: FadeInAnimation(child: widget),
                          ),
                          children: [
                            // Project overview with custom content
                            ProjectOverviewWidget(
                              project: widget.project,
                              overviewText: overviewText,
                            ),
                            const SizedBox(height: AppTheme.spacingXXL),

                            // Technology stack chips
                            TechnicalStackWidget(
                              technologies: widget.project.technologies,
                            ),
                            const SizedBox(height: AppTheme.spacingXXL),

                            // Gallery section (only if images exist)
                            if (widget.project.galleryImages != null &&
                                widget.project.galleryImages!.isNotEmpty) ...[
                              GallerySectionWidget(
                                galleryImages: widget.project.galleryImages!,
                                isMobile: isMobile,
                                projectId: widget.project.id,
                              ),
                              const SizedBox(height: AppTheme.spacingXXL),
                            ],

                            // Challenges and solutions cards
                            ChallengesSolutionsWidget(
                              challenges: challenges,
                            ),
                            const SizedBox(height: AppTheme.spacingXXL),

                            // Key learnings bullet list
                            KeyLearningsWidget(
                              lessons: lessons,
                            ),
                            const SizedBox(height: AppTheme.spacingXXL),

                            // Call-to-action buttons (View Case Study / View Code)
                            ActionButtonsWidget(
                              liveUrl: widget.project.liveUrl,
                              githubUrl: widget.project.githubUrl,
                            ),
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

          // Floating back button overlay (top-left corner)
          const BackButtonWidget(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../models/project.dart';
import '../utils/assets/app_constants.dart';
import '../utils/responsive_helper.dart';
import '../widgets/project_case_study/hero_section_widget.dart';
import '../widgets/project_case_study/project_overview_widget.dart';
import '../widgets/project_case_study/technical_stack_widget.dart';
import '../widgets/project_case_study/gallery_section_widget.dart';
import '../widgets/project_case_study/documents_section_widget.dart';
import '../widgets/project_case_study/challenges_solutions_widget.dart';
import '../widgets/project_case_study/key_learnings_widget.dart';
import '../widgets/project_case_study/action_buttons_widget.dart';
import '../widgets/project_case_study/project_content_helper.dart';
import '../widgets/project_case_study/project_case_study_app_bar.dart';

import '../theme/app_theme.dart';

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

  /// Current section index for navigation
  int _currentSection = 0;

  /// GlobalKeys for section scrolling
  final GlobalKey _overviewKey = GlobalKey();
  final GlobalKey _techStackKey = GlobalKey();
  final GlobalKey _documentsKey = GlobalKey();
  final GlobalKey _galleryKey = GlobalKey();
  final GlobalKey _challengesKey = GlobalKey();
  final GlobalKey _learningsKey = GlobalKey();

  /// Scroll controller for detecting scroll position
  final ScrollController _scrollController = ScrollController();

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

    // Listen to scroll changes to update current section
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    // Get positions of all sections
    final sections = [
      _overviewKey,
      _techStackKey,
      _documentsKey,
      _galleryKey,
      _challengesKey,
      _learningsKey,
    ];

    // Calculate app bar height dynamically
    final appBarHeight =
        AppBar().preferredSize.height + MediaQuery.of(context).padding.top;

    // Define the detection zone (area where we check for active section)
    // Using top 30% of viewport after app bar for more stable detection
    final detectionThreshold = appBarHeight + 150;

    int? closestSection;
    double closestDistance = double.infinity;

    // Find the section closest to the detection threshold
    for (int i = 0; i < sections.length; i++) {
      final key = sections[i];
      final context = key.currentContext;

      if (context != null) {
        final renderBox = context.findRenderObject() as RenderBox?;
        if (renderBox != null) {
          final position = renderBox.localToGlobal(Offset.zero);
          final size = renderBox.size;

          // Check if section is in viewport
          final isInViewport =
              position.dy < MediaQuery.of(context).size.height &&
                  position.dy + size.height > appBarHeight;

          if (isInViewport) {
            // Calculate distance from detection threshold to section top
            final distance = (position.dy - detectionThreshold).abs();

            // Prioritize sections that have passed the threshold
            // or are close to it
            if (position.dy <= detectionThreshold &&
                distance < closestDistance) {
              closestDistance = distance;
              closestSection = i;
            } else if (closestSection == null &&
                position.dy > detectionThreshold) {
              // If no section has passed threshold, use the first visible one
              closestSection = i;
            }
          }
        }
      }
    }

    // Update current section if changed (prevents unnecessary rebuilds)
    if (closestSection != null && _currentSection != closestSection) {
      setState(() {
        _currentSection = closestSection!;
      });
    }
  }

  @override
  void dispose() {
    // Clean up controllers to prevent memory leaks
    _pageController.dispose();
    _scrollController.dispose();
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
          isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      appBar: ProjectCaseStudyAppBar(
        projectTitle: widget.project.title,
        projectImageUrl: widget.project.imageUrl,
        currentSection: _currentSection,
        onSectionSelected: (index) {
          setState(() {
            _currentSection = index;
          });
        },
        overviewKey: _overviewKey,
        techStackKey: _techStackKey,
        documentsKey: _documentsKey,
        galleryKey: _galleryKey,
        challengesKey: _challengesKey,
        learningsKey: _learningsKey,
      ),
      body: Stack(
        children: [
          // Main scrollable content
          SingleChildScrollView(
            controller: _scrollController,
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
                              key: _overviewKey,
                              project: widget.project,
                              overviewText: overviewText,
                            ),
                            const SizedBox(height: AppTheme.spacingXXL),

                            // Technology stack chips
                            TechnicalStackWidget(
                              key: _techStackKey,
                              technologies: widget.project.technologies,
                            ),
                            const SizedBox(height: AppTheme.spacingXXL),

                            // Documents section
                            DocumentsSectionWidget(
                              key: _documentsKey,
                              projectId: widget.project.id,
                            ),
                            const SizedBox(height: AppTheme.spacingXXL),

                            // Gallery section (only if images exist)
                            if (widget.project.galleryImages != null &&
                                widget.project.galleryImages!.isNotEmpty) ...[
                              GallerySectionWidget(
                                key: _galleryKey,
                                galleryImages: widget.project.galleryImages!,
                                isMobile: isMobile,
                                projectId: widget.project.id,
                              ),
                              const SizedBox(height: AppTheme.spacingXXL),
                            ],

                            // Challenges and solutions cards
                            ChallengesSolutionsWidget(
                              key: _challengesKey,
                              challenges: challenges,
                            ),
                            const SizedBox(height: AppTheme.spacingXXL),

                            // Key learnings bullet list
                            KeyLearningsWidget(
                              key: _learningsKey,
                              lessons: lessons,
                            ),
                            const SizedBox(height: AppTheme.spacingXXL),

                            // Call-to-action buttons (Watch Demo / Watch Short / View Case Study / View Code)
                            ActionButtonsWidget(
                              videoUrl: widget.project.videoUrl,
                              shortVideoUrl: widget.project.shortVideoUrl,
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
        ],
      ),
    );
  }
}

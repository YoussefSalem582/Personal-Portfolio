import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../../../models/project.dart';
import '../../../../theme/app_theme.dart';
import '../../../../utils/assets/app_constants.dart';
import '../../../../utils/data/localized/localized_extensions.dart';
import '../../../../utils/responsive_helper.dart';
import '../widgets/project_case_study/action_buttons_widget.dart';
import '../widgets/project_case_study/challenges_solutions_widget.dart';
import '../widgets/project_case_study/documents_section_widget.dart';
import '../widgets/project_case_study/gallery_section_widget.dart';
import '../widgets/project_case_study/hero_section_widget.dart';
import '../widgets/project_case_study/key_learnings_widget.dart';
import '../widgets/project_case_study/project_case_study_app_bar.dart';
import '../widgets/project_case_study/project_content_helper.dart';
import '../widgets/project_case_study/project_overview_widget.dart';
import '../widgets/project_case_study/technical_stack_widget.dart';

/// Full-screen project case study ([AttendancePage]-style presentation entry).
class ProjectCaseStudy extends StatefulWidget {
  const ProjectCaseStudy({super.key, required this.project});

  final Project project;

  @override
  State<ProjectCaseStudy> createState() => _ProjectCaseStudyState();
}

class _ProjectCaseStudyState extends State<ProjectCaseStudy> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  int _currentSection = 0;

  final GlobalKey _overviewKey = GlobalKey();
  final GlobalKey _techStackKey = GlobalKey();
  final GlobalKey _documentsKey = GlobalKey();
  final GlobalKey _galleryKey = GlobalKey();
  final GlobalKey _challengesKey = GlobalKey();
  final GlobalKey _learningsKey = GlobalKey();

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      final newPage = _pageController.page?.round() ?? 0;
      if (newPage != _currentPage) {
        setState(() {
          _currentPage = newPage;
        });
      }
    });

    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final sections = [
      _overviewKey,
      _techStackKey,
      _documentsKey,
      _galleryKey,
      _challengesKey,
      _learningsKey,
    ];

    final appBarHeight =
        AppBar().preferredSize.height + MediaQuery.of(context).padding.top;

    final detectionThreshold = appBarHeight + 150;

    int? closestSection;
    double closestDistance = double.infinity;

    for (int i = 0; i < sections.length; i++) {
      final key = sections[i];
      final context = key.currentContext;

      if (context != null) {
        final renderBox = context.findRenderObject() as RenderBox?;
        if (renderBox != null) {
          final position = renderBox.localToGlobal(Offset.zero);
          final size = renderBox.size;

          final isInViewport =
              position.dy < MediaQuery.of(context).size.height &&
                  position.dy + size.height > appBarHeight;

          if (isInViewport) {
            final distance = (position.dy - detectionThreshold).abs();

            if (position.dy <= detectionThreshold &&
                distance < closestDistance) {
              closestDistance = distance;
              closestSection = i;
            } else if (closestSection == null &&
                position.dy > detectionThreshold) {
              closestSection = i;
            }
          }
        }
      }
    }

    if (closestSection != null && _currentSection != closestSection) {
      setState(() {
        _currentSection = closestSection!;
      });
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final isDark = Theme.of(context).brightness == Brightness.dark;

    final isMobile = ResponsiveHelper.isMobile(screenWidth);
    final isSmallMobile = screenWidth < 375;

    final overviewText = ProjectContentHelper.getProjectOverviewText(
      widget.project.id,
      widget.project.localizedDescription,
    );
    final challenges =
        ProjectContentHelper.getProjectChallenges(widget.project.id);
    final lessons = ProjectContentHelper.getProjectLessons(widget.project.id);

    return Scaffold(
      backgroundColor:
          isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      appBar: ProjectCaseStudyAppBar(
        projectTitle: widget.project.localizedTitle,
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
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                SizedBox(
                  height: isMobile
                      ? (screenHeight * 0.5).clamp(350.0, 450.0)
                      : (screenHeight * 0.6).clamp(400.0, 600.0),
                  child: PageView(
                    controller: _pageController,
                    children: [
                      HeroSectionWidget(
                        project: widget.project,
                        currentPage: _currentPage,
                        screenHeight: screenHeight,
                      ),
                      if (widget.project.galleryImages != null)
                        ...widget.project.galleryImages!.map(
                          (imageUrl) => HeroSectionWidget(
                            project: Project(
                              id: widget.project.id,
                              title: widget.project.title,
                              description: widget.project.description,
                              shortDescription: widget.project.shortDescription,
                              technologies: widget.project.technologies,
                              imageUrl: imageUrl,
                              createdAt: widget.project.createdAt,
                            ),
                            currentPage: _currentPage,
                            screenHeight: screenHeight,
                          ),
                        ),
                    ],
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: ResponsiveHelper.getMaxWidth(screenWidth),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal:
                          ResponsiveHelper.getHorizontalPadding(screenWidth),
                      vertical:
                          isMobile ? AppTheme.spacingL : AppTheme.spacingXL,
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
                            ProjectOverviewWidget(
                              key: _overviewKey,
                              project: widget.project,
                              overviewText: overviewText,
                              isMobile: isMobile,
                              isSmallMobile: isSmallMobile,
                            ),
                            SizedBox(
                                height: isMobile
                                    ? AppTheme.spacingXL
                                    : AppTheme.spacingXXL),
                            TechnicalStackWidget(
                              key: _techStackKey,
                              technologies: widget.project.technologies,
                              isMobile: isMobile,
                              isSmallMobile: isSmallMobile,
                            ),
                            SizedBox(
                                height: isMobile
                                    ? AppTheme.spacingXL
                                    : AppTheme.spacingXXL),
                            DocumentsSectionWidget(
                              key: _documentsKey,
                              projectId: widget.project.id,
                              isMobile: isMobile,
                              isSmallMobile: isSmallMobile,
                            ),
                            SizedBox(
                                height: isMobile
                                    ? AppTheme.spacingXL
                                    : AppTheme.spacingXXL),
                            if (widget.project.galleryImages != null &&
                                widget.project.galleryImages!.isNotEmpty) ...[
                              GallerySectionWidget(
                                key: _galleryKey,
                                galleryImages: widget.project.galleryImages!,
                                isMobile: isMobile,
                                projectId: widget.project.id,
                              ),
                              SizedBox(
                                  height: isMobile
                                      ? AppTheme.spacingXL
                                      : AppTheme.spacingXXL),
                            ],
                            ChallengesSolutionsWidget(
                              key: _challengesKey,
                              challenges: challenges,
                              isMobile: isMobile,
                              isSmallMobile: isSmallMobile,
                            ),
                            SizedBox(
                                height: isMobile
                                    ? AppTheme.spacingXL
                                    : AppTheme.spacingXXL),
                            KeyLearningsWidget(
                              key: _learningsKey,
                              lessons: lessons,
                              isMobile: isMobile,
                              isSmallMobile: isSmallMobile,
                            ),
                            SizedBox(
                                height: isMobile
                                    ? AppTheme.spacingXL
                                    : AppTheme.spacingXXL),
                            ActionButtonsWidget(
                              videoUrl: widget.project.videoUrl,
                              shortVideoUrl: widget.project.shortVideoUrl,
                              liveUrl: widget.project.liveUrl,
                              githubUrl: widget.project.githubUrl,
                              isMobile: isMobile,
                              isSmallMobile: isSmallMobile,
                            ),
                            SizedBox(
                                height: isMobile
                                    ? AppTheme.spacingXL
                                    : AppTheme.spacingXXL),
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/assets/app_constants.dart';
import '../models/project.dart';
import '../utils/url_helper.dart';
import '../routes/app_routes.dart';
import 'lazy_image.dart';

import '../theme/app_theme.dart';

class ProjectCard extends StatefulWidget {
  final Project project;
  final bool isCompact;

  const ProjectCard({super.key, required this.project, this.isCompact = false});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _elevationAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.02).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
    _elevationAnimation = Tween<double>(begin: 4.0, end: 12.0).animate(
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
    // Fixed dimensions - no flex!
    final double cardHeight = widget.isCompact ? 190.0 : 220.0;
    final double imageHeight = widget.isCompact ? 145.0 : 165.0;
    final double contentHeight = cardHeight - imageHeight;

    return MouseRegion(
      onEnter: (_) {
        setState(() => _isHovered = true);
        _controller.forward();
      },
      onExit: (_) {
        setState(() => _isHovered = false);
        _controller.reverse();
      },
      cursor: SystemMouseCursors.click,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Container(
              width: double.infinity,
              height: cardHeight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppTheme.radiusL),
                boxShadow: [
                  BoxShadow(
                    color: _isHovered
                        ? (isDark
                            ? AppColors.accentDark.withOpacity(0.3)
                            : AppColors.accentLight.withOpacity(0.3))
                        : AppColors.black.withOpacity(0.1),
                    blurRadius: _elevationAnimation.value * 2,
                    offset: Offset(0, _elevationAnimation.value / 2),
                    spreadRadius: _isHovered ? 2 : 0,
                  ),
                ],
              ),
              child: Card(
                elevation: 0,
                margin: EdgeInsets.zero,
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppTheme.radiusL),
                  side: BorderSide(
                    color: _isHovered
                        ? (isDark
                            ? AppColors.accentDark.withOpacity(0.5)
                            : AppColors.accentLight.withOpacity(0.5))
                        : AppColors.transparent,
                    width: _isHovered ? 2 : 0,
                  ),
                ),
                child: InkWell(
                  onTap: () => _showProjectDetails(context),
                  child: Container(
                    width: double.infinity,
                    height: cardHeight,
                    decoration: BoxDecoration(
                      gradient: isDark
                          ? AppColors.cardGradientDark
                          : AppColors.cardGradientLight,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Fixed Image Section
                        _buildImageSection(context, isDark, imageHeight),

                        // Fixed Content Section
                        _buildContentSection(isDark, contentHeight),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildImageSection(BuildContext context, bool isDark, double height) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Image with perfect fitting - shows full mobile mockup
          widget.project.imageUrl != null
              ? Container(
                  color: isDark
                      ? AppColors.cardDark.withOpacity(0.5)
                      : AppColors.gray100,
                  child: LazyImage(
                    imageUrl: widget.project.imageUrl!,
                    fit: BoxFit.contain,
                    width: double.infinity,
                    height: double.infinity,
                    errorWidget: _buildPlaceholderImage(),
                  ),
                )
              : _buildPlaceholderImage(),

          // Subtle gradient overlay (less aggressive to show full image)
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.transparent,
                  AppColors.black.withOpacity(0.3),
                ],
                stops: const [0.7, 1.0],
              ),
            ),
          ),

          // Featured Badge
          if (widget.project.isFeatured)
            Positioned(
              top: 12,
              right: 12,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.accentLight,
                      AppColors.primaryLight,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.accentLight.withOpacity(0.5),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      AppIcons.featured,
                      size: 16,
                      color: AppColors.white,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Featured',
                      style: AppFonts.bodySmall().copyWith(
                        color: AppColors.white,
                        fontWeight: AppFonts.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

          // Hover Overlay with View Project button
          AnimatedOpacity(
            duration: const Duration(milliseconds: 200),
            opacity: _isHovered ? 1.0 : 0.0,
            child: Container(
              color: AppColors.black.withOpacity(0.5),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.accentLight,
                        AppColors.primaryLight,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.accentLight.withOpacity(0.5),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        AppIcons.view,
                        color: AppColors.white,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'View Project',
                        style: AppFonts.bodyMedium().copyWith(
                          color: AppColors.white,
                          fontWeight: AppFonts.bold,
                        ),
                      ),
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

  Widget _buildContentSection(bool isDark, double height) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            // Title with icon - Fixed height
            SizedBox(
              height: 18.0,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.project.title,
                      style: AppFonts.labelMedium().copyWith(
                        fontWeight: AppFonts.bold,
                        color: _isHovered
                            ? (isDark
                                ? AppColors.accentDark
                                : AppColors.accentLight)
                            : (isDark
                                ? AppColors.textPrimaryDark
                                : AppColors.textPrimaryLight),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Icon(
                    AppIcons.arrowRight,
                    size: 11,
                    color: _isHovered
                        ? (isDark
                            ? AppColors.accentDark
                            : AppColors.accentLight)
                        : (isDark
                            ? AppColors.textSecondaryDark
                            : AppColors.textSecondaryLight),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 3),

            // Description - Fixed height
            SizedBox(
              height: 13.0,
              child: Text(
                widget.project.shortDescription,
                style: AppFonts.bodyXS().copyWith(
                  color: isDark
                      ? AppColors.textSecondaryDark
                      : AppColors.textSecondaryLight,
                  height: 1.2,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),

            const SizedBox(height: 3),

            // Technology Chips - Fixed height
            SizedBox(
              height: 16.0,
              child: Wrap(
                spacing: 2,
                runSpacing: 2,
                children: widget.project.technologies
                    .take(widget.isCompact ? 2 : 3)
                    .map(
                      (tech) => Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 4,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              (isDark
                                      ? AppColors.accentDark
                                      : AppColors.accentLight)
                                  .withOpacity(0.15),
                              (isDark
                                      ? AppColors.accentDark
                                      : AppColors.accentLight)
                                  .withOpacity(0.05),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: (isDark
                                    ? AppColors.accentDark
                                    : AppColors.accentLight)
                                .withOpacity(0.3),
                            width: 1,
                          ),
                        ),
                        child: Text(
                          tech,
                          style: AppFonts.bodyXS().copyWith(
                            color: isDark
                                ? AppColors.accentDark
                                : AppColors.accentLight,
                            fontWeight: AppFonts.semiBold,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlaceholderImage() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.accentLight.withOpacity(0.2),
            AppColors.primaryLight.withOpacity(0.2),
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.accentLight.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.code,
              size: 48,
              color: AppColors.accentLight,
            ),
          ),
          const SizedBox(height: AppTheme.spacingM),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              widget.project.title,
              style: AppFonts.bodyMedium().copyWith(
                color: AppColors.accentLight,
                fontWeight: AppFonts.bold,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  void _showProjectDetails(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => ProjectDetailsDialog(project: widget.project),
    );
  }
}

class ProjectDetailsDialog extends StatelessWidget {
  final Project project;

  const ProjectDetailsDialog({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Dialog(
      backgroundColor: AppColors.transparent,
      insetPadding: const EdgeInsets.all(AppTheme.spacingM),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 600, maxHeight: 700),
        decoration: BoxDecoration(
          color: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
          borderRadius: BorderRadius.circular(AppTheme.radiusL),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header with close button
            Padding(
              padding: const EdgeInsets.all(AppTheme.spacingM),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      project.title,
                      style: AppFonts.h2().copyWith(
                        color: isDark
                            ? AppColors.textPrimaryDark
                            : AppColors.textPrimaryLight,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(
                      AppIcons.close,
                      color: isDark
                          ? AppColors.textPrimaryDark
                          : AppColors.textPrimaryLight,
                    ),
                  ),
                ],
              ),
            ),

            const Divider(height: 1),

            // Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(AppTheme.spacingM),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Project image gallery or single image
                    if (project.imageUrl != null ||
                        (project.galleryImages != null &&
                            project.galleryImages!.isNotEmpty))
                      _buildImageGallery(),

                    const SizedBox(height: AppTheme.spacingL),

                    // Description
                    Text(
                      'Description',
                      style: AppFonts.h3().copyWith(
                        color: isDark
                            ? AppColors.textPrimaryDark
                            : AppColors.textPrimaryLight,
                      ),
                    ),
                    const SizedBox(height: AppTheme.spacingS),
                    Text(
                      project.description,
                      style: AppFonts.bodyMedium().copyWith(
                        color: isDark
                            ? AppColors.textSecondaryDark
                            : AppColors.textSecondaryLight,
                      ),
                    ),

                    const SizedBox(height: AppTheme.spacingL),

                    // Technologies
                    Text(
                      'Technologies Used',
                      style: AppFonts.h3().copyWith(
                        color: isDark
                            ? AppColors.textPrimaryDark
                            : AppColors.textPrimaryLight,
                      ),
                    ),
                    const SizedBox(height: AppTheme.spacingS),
                    Wrap(
                      spacing: AppTheme.spacingS,
                      runSpacing: AppTheme.spacingS,
                      children: project.technologies
                          .map(
                            (tech) => Chip(
                              label: Text(
                                tech,
                                style: AppFonts.bodySmall().copyWith(
                                  color: isDark
                                      ? AppColors.accentDark
                                      : AppColors.accentLight,
                                ),
                              ),
                              backgroundColor: (isDark
                                      ? AppColors.accentDark
                                      : AppColors.accentLight)
                                  .withOpacity(0.1),
                              side: BorderSide.none,
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),

            const Divider(height: 1),

            // Action buttons
            Padding(
              padding: const EdgeInsets.all(AppTheme.spacingM),
              child: Column(
                children: [
                  // Case Study button for featured projects
                  if (project.isFeatured)
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(bottom: AppTheme.spacingM),
                      child: ElevatedButton.icon(
                        onPressed: () => Get.toNamed(
                          AppRoutes.project,
                          parameters: {'id': project.id},
                        ),
                        icon: Icon(AppIcons.blog),
                        label: const Text('View Case Study'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isDark
                              ? AppColors.accentDark
                              : AppColors.primaryLight,
                          foregroundColor: AppColors.white,
                        ),
                      ),
                    ),

                  // Original action buttons
                  Row(
                    children: [
                      if (project.githubUrl != null)
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () =>
                                UrlHelper.launchURL(project.githubUrl!),
                            icon: Icon(Icons.code),
                            label: const Text('View Code'),
                          ),
                        ),
                      if (project.githubUrl != null && project.liveUrl != null)
                        const SizedBox(width: AppTheme.spacingM),
                      if (project.liveUrl != null)
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () =>
                                UrlHelper.launchURL(project.liveUrl!),
                            icon: Icon(AppIcons.demo),
                            label: const Text('Live Demo'),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageGallery() {
    final List<String> images = project.galleryImages ??
        (project.imageUrl != null ? [project.imageUrl!] : []);

    if (images.isEmpty) return const SizedBox.shrink();

    // Controller for PageView navigation
    final PageController pageController = PageController();
    final ValueNotifier<int> currentPageNotifier = ValueNotifier<int>(0);

    return Container(
      width: double.infinity,
      height: 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppTheme.radiusM),
        color: AppColors.gray100,
      ),
      child: images.length == 1
          ? ClipRRect(
              borderRadius: BorderRadius.circular(AppTheme.radiusM),
              child: LazyImage(
                imageUrl: images.first,
                fit: BoxFit.contain,
                borderRadius: BorderRadius.circular(AppTheme.radiusM),
                errorWidget: _buildImagePlaceholder(),
              ),
            )
          : Stack(
              children: [
                // PageView with images
                PageView.builder(
                  controller: pageController,
                  itemCount: images.length,
                  onPageChanged: (index) {
                    currentPageNotifier.value = index;
                  },
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(AppTheme.radiusM),
                        child: Stack(
                          children: [
                            LazyImage(
                              imageUrl: images[index],
                              fit: BoxFit.contain,
                              width: double.infinity,
                              borderRadius:
                                  BorderRadius.circular(AppTheme.radiusM),
                              errorWidget: _buildImagePlaceholder(),
                            ),
                            // Image counter overlay
                            Positioned(
                              top: 8,
                              right: 8,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.black.withOpacity(0.7),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  '${index + 1}/${images.length}',
                                  style: AppFonts.bodySmall().copyWith(
                                    color: AppColors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),

                // Previous button (left arrow)
                ValueListenableBuilder<int>(
                  valueListenable: currentPageNotifier,
                  builder: (context, currentPage, _) {
                    if (currentPage == 0) return const SizedBox.shrink();
                    return Positioned(
                      left: 16,
                      top: 0,
                      bottom: 0,
                      child: Center(
                        child: _buildNavigationButton(
                          icon: AppIcons.back,
                          onPressed: () {
                            pageController.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),

                // Next button (right arrow)
                ValueListenableBuilder<int>(
                  valueListenable: currentPageNotifier,
                  builder: (context, currentPage, _) {
                    if (currentPage == images.length - 1) {
                      return const SizedBox.shrink();
                    }
                    return Positioned(
                      right: 16,
                      top: 0,
                      bottom: 0,
                      child: Center(
                        child: _buildNavigationButton(
                          icon: AppIcons.forward,
                          onPressed: () {
                            pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),

                // Page indicator dots (bottom center)
                Positioned(
                  bottom: 16,
                  left: 0,
                  right: 0,
                  child: ValueListenableBuilder<int>(
                    valueListenable: currentPageNotifier,
                    builder: (context, currentPage, _) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          images.length,
                          (index) => Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            width: currentPage == index ? 24 : 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: currentPage == index
                                  ? AppColors.accentLight
                                  : AppColors.white.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildNavigationButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return Material(
      color: AppColors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.black.withOpacity(0.6),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withOpacity(0.3),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Icon(
            icon,
            color: AppColors.white,
            size: 20,
          ),
        ),
      ),
    );
  }

  Widget _buildImagePlaceholder() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.accentLight.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppTheme.radiusM),
      ),
      child: const Center(
        child: Icon(AppIcons.image, size: 50, color: AppColors.accentLight),
      ),
    );
  }
}

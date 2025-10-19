import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../theme/app_theme.dart';
import '../models/project.dart';
import '../utils/url_helper.dart';
import '../routes/app_routes.dart';
import 'lazy_image.dart';

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
              height: widget.isCompact ? 260 : 360,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppTheme.radiusL),
                boxShadow: [
                  BoxShadow(
                    color: _isHovered
                        ? (isDark
                            ? AppTheme.darkAccentColor.withValues(alpha: 0.3)
                            : AppTheme.accentColor.withValues(alpha: 0.3))
                        : Colors.black.withValues(alpha: 0.1),
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
                            ? AppTheme.darkAccentColor.withValues(alpha: 0.5)
                            : AppTheme.accentColor.withValues(alpha: 0.5))
                        : Colors.transparent,
                    width: _isHovered ? 2 : 0,
                  ),
                ),
                child: InkWell(
                  onTap: () => _showProjectDetails(context),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: isDark
                          ? AppTheme.darkCardGradient
                          : AppTheme.cardGradient,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Enhanced Project Image Section
                        _buildImageSection(context, isDark),

                        // Enhanced Content Section
                        _buildContentSection(isDark),
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

  Widget _buildImageSection(BuildContext context, bool isDark) {
    return SizedBox(
      height: widget.isCompact ? 140 : 200,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Image with perfect fitting - shows full mobile mockup
          widget.project.imageUrl != null
              ? Container(
                  color: isDark
                      ? AppTheme.darkCardColor.withValues(alpha: 0.5)
                      : Colors.grey.shade100,
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
                  Colors.transparent,
                  Colors.black.withValues(alpha: 0.3),
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
                      AppTheme.accentColor,
                      AppTheme.primaryColor,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.accentColor.withValues(alpha: 0.5),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.star_rounded,
                      size: 16,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Featured',
                      style: AppTheme.bodySmall.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
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
              color: Colors.black.withValues(alpha: 0.5),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppTheme.accentColor,
                        AppTheme.primaryColor,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: AppTheme.accentColor.withValues(alpha: 0.5),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.visibility_rounded,
                        color: Colors.white,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'View Project',
                        style: AppTheme.bodyMedium.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
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

  Widget _buildContentSection(bool isDark) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Title with icon
            Row(
              children: [
                Expanded(
                  child: Text(
                    widget.project.title,
                    style: AppTheme.headingSmall.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: _isHovered
                          ? (isDark
                              ? AppTheme.darkAccentColor
                              : AppTheme.accentColor)
                          : (isDark
                              ? AppTheme.darkTextPrimary
                              : AppTheme.textPrimary),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_rounded,
                  size: 16,
                  color: _isHovered
                      ? (isDark
                          ? AppTheme.darkAccentColor
                          : AppTheme.accentColor)
                      : (isDark
                          ? AppTheme.darkTextSecondary
                          : AppTheme.textSecondary),
                ),
              ],
            ),

            const SizedBox(height: 6),

            // Description
            Flexible(
              child: Text(
                widget.project.shortDescription,
                style: AppTheme.bodyMedium.copyWith(
                  color: isDark
                      ? AppTheme.darkTextSecondary
                      : AppTheme.textSecondary,
                  height: 1.3,
                  fontSize: 12,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),

            const SizedBox(height: 6),

            // Enhanced Technology Chips
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: widget.project.technologies
                  .take(widget.isCompact ? 2 : 4)
                  .map(
                    (tech) => Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            (isDark
                                    ? AppTheme.darkAccentColor
                                    : AppTheme.accentColor)
                                .withValues(alpha: 0.15),
                            (isDark
                                    ? AppTheme.darkAccentColor
                                    : AppTheme.accentColor)
                                .withValues(alpha: 0.05),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: (isDark
                                  ? AppTheme.darkAccentColor
                                  : AppTheme.accentColor)
                              .withValues(alpha: 0.3),
                          width: 1,
                        ),
                      ),
                      child: Text(
                        tech,
                        style: AppTheme.bodySmall.copyWith(
                          color: isDark
                              ? AppTheme.darkAccentColor
                              : AppTheme.accentColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  )
                  .toList(),
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
            AppTheme.accentColor.withValues(alpha: 0.2),
            AppTheme.primaryColor.withValues(alpha: 0.2),
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppTheme.accentColor.withValues(alpha: 0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.code_rounded,
              size: 48,
              color: AppTheme.accentColor,
            ),
          ),
          const SizedBox(height: AppTheme.spacingM),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              widget.project.title,
              style: AppTheme.bodyMedium.copyWith(
                color: AppTheme.accentColor,
                fontWeight: FontWeight.bold,
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
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(AppTheme.spacingM),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 600, maxHeight: 700),
        decoration: BoxDecoration(
          color: isDark ? AppTheme.darkSurfaceColor : AppTheme.surfaceColor,
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
                      style: AppTheme.headingMedium.copyWith(
                        color: isDark
                            ? AppTheme.darkTextPrimary
                            : AppTheme.textPrimary,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(
                      Icons.close,
                      color: isDark
                          ? AppTheme.darkTextPrimary
                          : AppTheme.textPrimary,
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
                      style: AppTheme.headingSmall.copyWith(
                        color: isDark
                            ? AppTheme.darkTextPrimary
                            : AppTheme.textPrimary,
                      ),
                    ),
                    const SizedBox(height: AppTheme.spacingS),
                    Text(
                      project.description,
                      style: AppTheme.bodyMedium.copyWith(
                        color: isDark
                            ? AppTheme.darkTextSecondary
                            : AppTheme.textSecondary,
                      ),
                    ),

                    const SizedBox(height: AppTheme.spacingL),

                    // Technologies
                    Text(
                      'Technologies Used',
                      style: AppTheme.headingSmall.copyWith(
                        color: isDark
                            ? AppTheme.darkTextPrimary
                            : AppTheme.textPrimary,
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
                                style: AppTheme.bodySmall.copyWith(
                                  color: isDark
                                      ? AppTheme.darkAccentColor
                                      : AppTheme.accentColor,
                                ),
                              ),
                              backgroundColor: (isDark
                                      ? AppTheme.darkAccentColor
                                      : AppTheme.accentColor)
                                  .withValues(alpha: 0.1),
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
                        icon: const Icon(Icons.article_outlined),
                        label: const Text('View Case Study'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isDark
                              ? AppTheme.darkAccentColor
                              : AppTheme.primaryColor,
                          foregroundColor: Colors.white,
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
                            icon: const Icon(Icons.code),
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
                            icon: const Icon(Icons.launch),
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

    return Container(
      width: double.infinity,
      height: 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppTheme.radiusM),
        color: Colors.grey.shade100,
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
          : PageView.builder(
              itemCount: images.length,
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
                          borderRadius: BorderRadius.circular(AppTheme.radiusM),
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
                              color: Colors.black.withValues(alpha: 0.7),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              '${index + 1}/${images.length}',
                              style: AppTheme.bodySmall.copyWith(
                                color: Colors.white,
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
    );
  }

  Widget _buildImagePlaceholder() {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.accentColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppTheme.radiusM),
      ),
      child: const Center(
        child: Icon(Icons.image, size: 50, color: AppTheme.accentColor),
      ),
    );
  }
}

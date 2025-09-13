import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../models/project.dart';
import '../utils/url_helper.dart';
import '../screens/project_case_study.dart';
import 'lazy_image.dart';

class ProjectCard extends StatelessWidget {
  final Project project;
  final bool isCompact;

  const ProjectCard({super.key, required this.project, this.isCompact = false});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Card(
      elevation: 4,
      shadowColor: Colors.black12,
      child: InkWell(
        onTap: () => _showProjectDetails(context),
        borderRadius: BorderRadius.circular(AppTheme.radiusL),
        child: Container(
          height: isCompact ? 200 : 280,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppTheme.radiusL),
            gradient:
                isDark ? AppTheme.darkCardGradient : AppTheme.cardGradient,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Project image
              Expanded(
                flex: isCompact ? 2 : 3,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(AppTheme.radiusL),
                    ),
                    color: AppTheme.accentColor.withOpacity(0.1),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(AppTheme.radiusL),
                    ),
                    child: project.imageUrl != null
                        ? LazyImage(
                            imageUrl: project.imageUrl!,
                            fit: BoxFit.cover,
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(AppTheme.radiusL),
                            ),
                            errorWidget: _buildPlaceholderImage(),
                          )
                        : _buildPlaceholderImage(),
                  ),
                ),
              ),

              // Project info
              Expanded(
                flex: isCompact ? 3 : 2,
                child: Padding(
                  padding: const EdgeInsets.all(AppTheme.spacingM),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      Text(
                        project.title,
                        style: AppTheme.headingSmall.copyWith(
                          fontSize: 18,
                          color: isDark
                              ? AppTheme.darkTextPrimary
                              : AppTheme.textPrimary,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),

                      const SizedBox(height: AppTheme.spacingS),

                      // Description
                      Expanded(
                        child: Text(
                          project.shortDescription,
                          style: AppTheme.bodyMedium.copyWith(
                            color: isDark
                                ? AppTheme.darkTextSecondary
                                : AppTheme.textSecondary,
                          ),
                          maxLines: isCompact ? 2 : 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),

                      const SizedBox(height: AppTheme.spacingS),

                      // Technologies
                      Wrap(
                        spacing: AppTheme.spacingXS,
                        runSpacing: AppTheme.spacingXS,
                        children: project.technologies
                            .take(isCompact ? 2 : 3)
                            .map(
                              (tech) => Chip(
                                label: Text(
                                  tech,
                                  style: AppTheme.bodySmall.copyWith(
                                    color: AppTheme.accentColor,
                                  ),
                                ),
                                backgroundColor:
                                    AppTheme.accentColor.withOpacity(0.1),
                                side: BorderSide.none,
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlaceholderImage() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppTheme.accentColor.withOpacity(0.1),
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(AppTheme.radiusL),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.code, size: 40, color: AppTheme.accentColor),
          const SizedBox(height: AppTheme.spacingS),
          Text(
            project.title,
            style: AppTheme.bodyMedium.copyWith(
              color: AppTheme.accentColor,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  void _showProjectDetails(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => ProjectDetailsDialog(project: project),
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
                        onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                ProjectCaseStudy(project: project),
                          ),
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
      height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppTheme.radiusM),
        color: AppTheme.accentColor.withOpacity(0.1),
      ),
      child: images.length == 1
          ? LazyImage(
              imageUrl: images.first,
              fit: BoxFit.cover,
              borderRadius: BorderRadius.circular(AppTheme.radiusM),
              errorWidget: _buildImagePlaceholder(),
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
                          fit: BoxFit.cover,
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
                              color: Colors.black.withOpacity(0.7),
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
        color: AppTheme.accentColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppTheme.radiusM),
      ),
      child: const Center(
        child: Icon(Icons.image, size: 50, color: AppTheme.accentColor),
      ),
    );
  }
}

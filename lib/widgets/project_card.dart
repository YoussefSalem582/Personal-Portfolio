import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../models/project.dart';
import '../utils/url_helper.dart';

class ProjectCard extends StatelessWidget {
  final Project project;
  final bool isCompact;

  const ProjectCard({super.key, required this.project, this.isCompact = false});

  @override
  Widget build(BuildContext context) {
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
            gradient: AppTheme.cardGradient,
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
                        ? Image.asset(
                            project.imageUrl!,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return _buildPlaceholderImage();
                            },
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
                        style: AppTheme.headingSmall.copyWith(fontSize: 18),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),

                      const SizedBox(height: AppTheme.spacingS),

                      // Description
                      Expanded(
                        child: Text(
                          project.shortDescription,
                          style: AppTheme.bodyMedium,
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
                                backgroundColor: AppTheme.accentColor
                                    .withOpacity(0.1),
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
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(AppTheme.spacingM),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 600, maxHeight: 700),
        decoration: BoxDecoration(
          color: AppTheme.surfaceColor,
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
                    child: Text(project.title, style: AppTheme.headingMedium),
                  ),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close),
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
                    // Project image
                    if (project.imageUrl != null)
                      Container(
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppTheme.radiusM),
                          color: AppTheme.accentColor.withOpacity(0.1),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(AppTheme.radiusM),
                          child: Image.asset(
                            project.imageUrl!,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                decoration: BoxDecoration(
                                  color: AppTheme.accentColor.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(
                                    AppTheme.radiusM,
                                  ),
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.image,
                                    size: 50,
                                    color: AppTheme.accentColor,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),

                    const SizedBox(height: AppTheme.spacingL),

                    // Description
                    Text('Description', style: AppTheme.headingSmall),
                    const SizedBox(height: AppTheme.spacingS),
                    Text(project.description, style: AppTheme.bodyMedium),

                    const SizedBox(height: AppTheme.spacingL),

                    // Technologies
                    Text('Technologies Used', style: AppTheme.headingSmall),
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
                                  color: AppTheme.accentColor,
                                ),
                              ),
                              backgroundColor: AppTheme.accentColor.withOpacity(
                                0.1,
                              ),
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
              child: Row(
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
                        onPressed: () => UrlHelper.launchURL(project.liveUrl!),
                        icon: const Icon(Icons.launch),
                        label: const Text('Live Demo'),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

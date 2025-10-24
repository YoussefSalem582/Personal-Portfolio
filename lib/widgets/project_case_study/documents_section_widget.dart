import 'package:flutter/material.dart';
import '../../utils/assets/app_constants.dart';
import '../../utils/url_helper.dart';
import '../../theme/app_theme.dart';

/// Documents Section Widget
///
/// Displays available project documentation and reports
class DocumentsSectionWidget extends StatelessWidget {
  final String projectId;

  const DocumentsSectionWidget({
    super.key,
    required this.projectId,
  });

  /// Get documents for the current project
  List<DocumentInfo> _getProjectDocuments() {
    final List<DocumentInfo> docs = [];

    switch (projectId) {
      case 'emosense-app':
        docs.addAll([
          DocumentInfo(
            title: 'Project Documentation',
            description: 'Complete project documentation and features',
            path: ProjectDocuments.emosenseApp,
            icon: Icons.description,
          ),
          DocumentInfo(
            title: 'Technical Report',
            description: 'Detailed technical implementation report',
            path: ProjectDocuments.emosenseAppReport,
            icon: Icons.article,
          ),
        ]);
        break;

      case 'chat-app':
        docs.add(DocumentInfo(
          title: 'Project Documentation',
          description: 'Chat application features and architecture',
          path: ProjectDocuments.chatApp,
          icon: Icons.description,
        ));
        break;

      case 'music-player':
        docs.add(DocumentInfo(
          title: 'Project Documentation',
          description: 'Music player app documentation',
          path: ProjectDocuments.musicApp,
          icon: Icons.description,
        ));
        break;

      case 'chargehub':
        docs.add(DocumentInfo(
          title: 'Project Documentation',
          description: 'EV station finder app documentation',
          path: ProjectDocuments.chargeHubApp,
          icon: Icons.description,
        ));
        break;

      case 'gogesh-marketplace':
        docs.add(DocumentInfo(
          title: 'Project Documentation',
          description: 'E-commerce marketplace documentation',
          path: ProjectDocuments.gogeshApp,
          icon: Icons.description,
        ));
        break;

      case 'gopooling-carpool':
        docs.add(DocumentInfo(
          title: 'Project Report',
          description: 'Comprehensive carpool app project report',
          path: ProjectDocuments.carpoolRideSharingApp,
          icon: Icons.article,
        ));
        break;

      case 'pothole-detection':
        docs.addAll([
          DocumentInfo(
            title: 'Research Report',
            description:
                'Comparative analysis of ML models for pothole detection',
            path: ProjectDocuments.potholeDetectionReport,
            icon: Icons.science,
          ),
          DocumentInfo(
            title: 'Source Code',
            description: 'Complete implementation code and notebooks',
            path: ProjectDocuments.potholeDetectionCode,
            icon: Icons.code,
            isHtml: true,
          ),
        ]);
        break;

      case 'sign-language-translator':
        docs.add(DocumentInfo(
          title: 'Project Report',
          description: 'Sign language recognition system documentation',
          path: ProjectDocuments.signLanguageTranslatorReport,
          icon: Icons.article,
        ));
        break;

      case 'interactive-learning-assistant':
        docs.add(DocumentInfo(
          title: 'Project Documentation',
          description: '3D avatar learning assistant documentation',
          path: ProjectDocuments.threejsProject,
          icon: Icons.description,
        ));
        break;

      case 'facial-recognition':
        docs.add(DocumentInfo(
          title: 'Project Report',
          description: 'Facial recognition system documentation and analysis',
          path: ProjectDocuments.facialRecognitionSystem,
          icon: Icons.science,
        ));
        break;
    }

    return docs;
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final documents = _getProjectDocuments();

    if (documents.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Header - matching other sections style
        Row(
          children: [
            // Gradient icon container with folder icon
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                gradient: isDark
                    ? AppColors.primaryGradientDark
                    : AppColors.primaryGradientLight,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color:
                        (isDark ? AppColors.accentDark : AppColors.accentLight)
                            .withValues(alpha: 0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Icon(
                Icons.folder_open,
                color: AppColors.white,
                size: 24,
              ),
            ),
            const SizedBox(width: AppTheme.spacingM),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Project Documents',
                    style: AppFonts.h4(
                      color: isDark
                          ? AppColors.textPrimaryDark
                          : AppColors.textPrimaryLight,
                    ).copyWith(
                      fontWeight: AppFonts.extraBold,
                    ),
                  ),
                  Container(
                    height: 3,
                    width: 60,
                    margin: const EdgeInsets.only(top: 8),
                    decoration: BoxDecoration(
                      gradient: isDark
                          ? AppColors.primaryGradientDark
                          : AppColors.primaryGradientLight,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        const SizedBox(height: AppTheme.spacingXL),

        // Documents Grid/List
        ...documents.map((doc) => _buildDocumentCard(context, doc, isDark)),
      ],
    );
  }

  Widget _buildDocumentCard(
    BuildContext context,
    DocumentInfo doc,
    bool isDark,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppTheme.spacingM),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => _openDocument(doc.path),
          borderRadius: BorderRadius.circular(AppTheme.radiusL),
          child: Container(
            padding: const EdgeInsets.all(AppTheme.spacingL),
            decoration: BoxDecoration(
              // Gradient background matching other cards
              gradient: LinearGradient(
                colors: isDark
                    ? [
                        AppColors.surfaceDark.withValues(alpha: 0.6),
                        AppColors.surfaceDark.withValues(alpha: 0.4),
                      ]
                    : [
                        AppColors.surfaceLight,
                        AppColors.surfaceLight.withValues(alpha: 0.8),
                      ],
              ),
              borderRadius: BorderRadius.circular(AppTheme.radiusL),
              // Enhanced border matching gallery style
              border: Border.all(
                color: (isDark ? AppColors.accentDark : AppColors.accentLight)
                    .withValues(alpha: 0.2),
                width: 1.5,
              ),
              // Enhanced shadow for depth
              boxShadow: [
                BoxShadow(
                  color: (isDark ? AppColors.black : AppColors.gray300)
                      .withValues(alpha: 0.2),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                // Icon with gradient background
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: isDark
                          ? [
                              AppColors.accentDark.withValues(alpha: 0.3),
                              AppColors.primaryDark.withValues(alpha: 0.3),
                            ]
                          : [
                              AppColors.accentLight.withValues(alpha: 0.2),
                              AppColors.primaryLight.withValues(alpha: 0.2),
                            ],
                    ),
                    borderRadius: BorderRadius.circular(AppTheme.radiusM),
                    border: Border.all(
                      color: (isDark
                              ? AppColors.accentDark
                              : AppColors.accentLight)
                          .withValues(alpha: 0.4),
                      width: 1,
                    ),
                  ),
                  child: Icon(
                    doc.icon,
                    color:
                        isDark ? AppColors.accentDark : AppColors.accentLight,
                    size: 28,
                  ),
                ),

                const SizedBox(width: AppTheme.spacingL),

                // Content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        doc.title,
                        style: AppFonts.h5().copyWith(
                          color: isDark
                              ? AppColors.textPrimaryDark
                              : AppColors.textPrimaryLight,
                          fontWeight: AppFonts.bold,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        doc.description,
                        style: AppFonts.bodySmall().copyWith(
                          color: isDark
                              ? AppColors.textSecondaryDark
                              : AppColors.textSecondaryLight,
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Document type badge
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: (isDark
                                  ? AppColors.accentDark
                                  : AppColors.accentLight)
                              .withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: (isDark
                                    ? AppColors.accentDark
                                    : AppColors.accentLight)
                                .withValues(alpha: 0.3),
                            width: 1,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              doc.isHtml ? Icons.code : Icons.picture_as_pdf,
                              size: 14,
                              color: isDark
                                  ? AppColors.accentDark
                                  : AppColors.accentLight,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              doc.isHtml ? 'HTML' : 'PDF',
                              style: AppFonts.labelSmall().copyWith(
                                color: isDark
                                    ? AppColors.accentDark
                                    : AppColors.accentLight,
                                fontWeight: AppFonts.semiBold,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: AppTheme.spacingM),

                // Arrow Icon with gradient background
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color:
                        (isDark ? AppColors.accentDark : AppColors.accentLight)
                            .withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color:
                        isDark ? AppColors.accentDark : AppColors.accentLight,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _openDocument(String path) {
    // Use the openFile method which properly handles web asset paths
    try {
      UrlHelper.openFile(path);
    } catch (e) {
      debugPrint('Error opening document: $e');
      // Fallback: try to open with launchURL
      try {
        UrlHelper.launchURL(path);
      } catch (e2) {
        debugPrint('Fallback also failed: $e2');
      }
    }
  }
}

/// Document information model
class DocumentInfo {
  final String title;
  final String description;
  final String path;
  final IconData icon;
  final bool isHtml;

  const DocumentInfo({
    required this.title,
    required this.description,
    required this.path,
    required this.icon,
    this.isHtml = false,
  });
}

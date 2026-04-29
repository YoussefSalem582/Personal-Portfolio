import 'package:flutter/material.dart';
import '../../../../../core/locale/app_locale_binding.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../core/utils/assets/app_constants.dart';
import 'package:youssef_hassan_portfolio/features/projects/data/localized/case_study_documents_ar.dart';
import '../../../../../core/utils/url_helper.dart';
import '../../../../../core/theme/app_theme.dart';

/// Documents Section Widget
///
/// Displays available project documentation and reports
class DocumentsSectionWidget extends StatelessWidget {
  final String projectId;
  final bool isMobile;
  final bool isSmallMobile;

  const DocumentsSectionWidget({
    super.key,
    required this.projectId,
    this.isMobile = false,
    this.isSmallMobile = false,
  });

  /// Get documents for the current project
  List<DocumentInfo> _getProjectDocuments() {
    final List<DocumentInfo> docs = [];

    switch (projectId) {
      case 'emosense-app':
        docs.addAll([
          const DocumentInfo(
            title: 'Project Documentation',
            description: 'Complete project documentation and features',
            path: ProjectDocuments.emosenseApp,
            icon: Icons.description,
          ),
          const DocumentInfo(
            title: 'Technical Report',
            description: 'Detailed technical implementation report',
            path: ProjectDocuments.emosenseAppReport,
            icon: Icons.article,
          ),
        ]);
        break;

      case 'chat-app':
        docs.add(const DocumentInfo(
          title: 'Project Documentation',
          description: 'Chat application features and architecture',
          path: ProjectDocuments.chatApp,
          icon: Icons.description,
        ));
        break;

      case 'music-player':
        docs.add(const DocumentInfo(
          title: 'Project Documentation',
          description: 'Music player app documentation',
          path: ProjectDocuments.musicApp,
          icon: Icons.description,
        ));
        break;

      case 'chargehub':
        docs.add(const DocumentInfo(
          title: 'Project Documentation',
          description: 'EV station finder app documentation',
          path: ProjectDocuments.chargeHubApp,
          icon: Icons.description,
        ));
        break;

      case 'gogesh-marketplace':
        docs.add(const DocumentInfo(
          title: 'Project Documentation',
          description: 'E-commerce marketplace documentation',
          path: ProjectDocuments.gogeshApp,
          icon: Icons.description,
        ));
        break;

      case 'gopooling-carpool':
        docs.add(const DocumentInfo(
          title: 'Project Report',
          description: 'Comprehensive carpool app project report',
          path: ProjectDocuments.carpoolRideSharingApp,
          icon: Icons.article,
        ));
        break;

      case 'pothole-detection':
        docs.addAll([
          const DocumentInfo(
            title: 'Research Report',
            description:
                'Comparative analysis of ML models for pothole detection',
            path: ProjectDocuments.potholeDetectionReport,
            icon: Icons.science,
          ),
          const DocumentInfo(
            title: 'Source Code',
            description: 'Complete implementation code and notebooks',
            path: ProjectDocuments.potholeDetectionCode,
            icon: Icons.code,
            isHtml: true,
          ),
        ]);
        break;

      case 'sign-language-translator':
        docs.add(const DocumentInfo(
          title: 'Project Report',
          description: 'Sign language recognition system documentation',
          path: ProjectDocuments.signLanguageTranslatorReport,
          icon: Icons.article,
        ));
        break;

      case 'interactive-learning-assistant':
        docs.add(const DocumentInfo(
          title: 'Project Documentation',
          description: '3D avatar learning assistant documentation',
          path: ProjectDocuments.threejsProject,
          icon: Icons.description,
        ));
        break;

      case 'facial-recognition':
        docs.add(const DocumentInfo(
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
    final l10n = AppLocalizations.of(context);

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
              padding: EdgeInsets.all(isMobile ? 10 : 12),
              decoration: BoxDecoration(
                gradient: isDark
                    ? AppColors.primaryGradientDark
                    : AppColors.primaryGradientLight,
                borderRadius: BorderRadius.circular(isMobile ? 10 : 12),
                boxShadow: [
                  BoxShadow(
                    color:
                        (isDark ? AppColors.accentDark : AppColors.accentLight)
                            .withOpacity(0.3),
                    blurRadius: isMobile ? 8 : 12,
                    offset: Offset(0, isMobile ? 2 : 4),
                  ),
                ],
              ),
              child: Icon(
                Icons.folder_open,
                color: AppColors.white,
                size: isMobile ? 20 : 24,
              ),
            ),
            SizedBox(width: isMobile ? AppTheme.spacingS : AppTheme.spacingM),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.caseStudySectionProjectDocuments,
                    style: TextStyle(
                      fontSize: isMobile ? (isSmallMobile ? 20 : 22) : 28,
                      fontWeight: AppFonts.extraBold,
                      color: isDark
                          ? AppColors.textPrimaryDark
                          : AppColors.textPrimaryLight,
                    ),
                  ),
                  Container(
                    height: isMobile ? 2 : 3,
                    width: isMobile ? 45 : 60,
                    margin: EdgeInsets.only(top: isMobile ? 6 : 8),
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

        SizedBox(height: isMobile ? AppTheme.spacingL : AppTheme.spacingXL),

        // Documents Grid/List
        ...documents.map((doc) => _buildDocumentCard(context, doc, isDark)),
      ],
    );
  }

  String _docTitle(DocumentInfo doc) {
    final ar = CaseStudyDocumentsAr.forPath(doc.path);
    if (ar == null || !AppLocaleBinding.isArabic) return doc.title;
    return ar.title;
  }

  String _docDescription(DocumentInfo doc) {
    final ar = CaseStudyDocumentsAr.forPath(doc.path);
    if (ar == null || !AppLocaleBinding.isArabic) return doc.description;
    return ar.description;
  }

  Widget _buildDocumentCard(
    BuildContext context,
    DocumentInfo doc,
    bool isDark,
  ) {
    final l10n = AppLocalizations.of(context);
    return Padding(
      padding: EdgeInsets.only(
          bottom: isMobile ? AppTheme.spacingS : AppTheme.spacingM),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => _openDocument(doc.path),
          borderRadius: BorderRadius.circular(
              isMobile ? AppTheme.radiusM : AppTheme.radiusL),
          child: Container(
            padding: EdgeInsets.all(
                isMobile ? AppTheme.spacingM : AppTheme.spacingL),
            decoration: BoxDecoration(
              // Gradient background matching other cards
              gradient: LinearGradient(
                colors: isDark
                    ? [
                        AppColors.surfaceDark.withOpacity(0.6),
                        AppColors.surfaceDark.withOpacity(0.4),
                      ]
                    : [
                        AppColors.surfaceLight,
                        AppColors.surfaceLight.withOpacity(0.8),
                      ],
              ),
              borderRadius: BorderRadius.circular(
                  isMobile ? AppTheme.radiusM : AppTheme.radiusL),
              // Enhanced border matching gallery style
              border: Border.all(
                color: (isDark ? AppColors.accentDark : AppColors.accentLight)
                    .withOpacity(0.2),
                width: 1.5,
              ),
              // Enhanced shadow for depth
              boxShadow: [
                BoxShadow(
                  color: (isDark ? AppColors.black : AppColors.gray300)
                      .withOpacity(0.2),
                  blurRadius: isMobile ? 8 : 12,
                  offset: Offset(0, isMobile ? 2 : 4),
                ),
              ],
            ),
            child: Row(
              children: [
                // Icon with gradient background
                Container(
                  width: isMobile ? (isSmallMobile ? 50 : 55) : 60,
                  height: isMobile ? (isSmallMobile ? 50 : 55) : 60,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: isDark
                          ? [
                              AppColors.accentDark.withOpacity(0.3),
                              AppColors.primaryDark.withOpacity(0.3),
                            ]
                          : [
                              AppColors.accentLight.withOpacity(0.2),
                              AppColors.primaryLight.withOpacity(0.2),
                            ],
                    ),
                    borderRadius: BorderRadius.circular(
                        isMobile ? AppTheme.radiusS : AppTheme.radiusM),
                    border: Border.all(
                      color: (isDark
                              ? AppColors.accentDark
                              : AppColors.accentLight)
                          .withOpacity(0.4),
                      width: 1,
                    ),
                  ),
                  child: Icon(
                    doc.icon,
                    color:
                        isDark ? AppColors.accentDark : AppColors.accentLight,
                    size: isMobile ? (isSmallMobile ? 24 : 26) : 28,
                  ),
                ),

                SizedBox(
                    width: isMobile ? AppTheme.spacingM : AppTheme.spacingL),

                // Content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _docTitle(doc),
                        style: TextStyle(
                          fontSize: isMobile ? (isSmallMobile ? 15 : 16) : 18,
                          fontWeight: AppFonts.bold,
                          color: isDark
                              ? AppColors.textPrimaryDark
                              : AppColors.textPrimaryLight,
                        ),
                      ),
                      SizedBox(height: isMobile ? 4 : 6),
                      Text(
                        _docDescription(doc),
                        style: TextStyle(
                          fontSize: isMobile ? (isSmallMobile ? 12 : 13) : 14,
                          color: isDark
                              ? AppColors.textSecondaryDark
                              : AppColors.textSecondaryLight,
                        ),
                      ),
                      SizedBox(height: isMobile ? 8 : 10),
                      // Document type badge
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: isMobile ? 10 : 12,
                          vertical: isMobile ? 3 : 4,
                        ),
                        decoration: BoxDecoration(
                          color: (isDark
                                  ? AppColors.accentDark
                                  : AppColors.accentLight)
                              .withOpacity(0.15),
                          borderRadius:
                              BorderRadius.circular(isMobile ? 10 : 12),
                          border: Border.all(
                            color: (isDark
                                    ? AppColors.accentDark
                                    : AppColors.accentLight)
                                .withOpacity(0.3),
                            width: 1,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              doc.isHtml ? Icons.code : Icons.picture_as_pdf,
                              size: isMobile ? 12 : 14,
                              color: isDark
                                  ? AppColors.accentDark
                                  : AppColors.accentLight,
                            ),
                            SizedBox(width: isMobile ? 4 : 6),
                            Text(
                              doc.isHtml ? l10n.labelHtml : l10n.labelPdf,
                              style: TextStyle(
                                fontSize:
                                    isMobile ? (isSmallMobile ? 10 : 11) : 12,
                                fontWeight: AppFonts.semiBold,
                                color: isDark
                                    ? AppColors.accentDark
                                    : AppColors.accentLight,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                    width: isMobile ? AppTheme.spacingS : AppTheme.spacingM),

                // Arrow Icon with gradient background
                Container(
                  padding: EdgeInsets.all(isMobile ? 6 : 8),
                  decoration: BoxDecoration(
                    color:
                        (isDark ? AppColors.accentDark : AppColors.accentLight)
                            .withOpacity(0.15),
                    borderRadius: BorderRadius.circular(isMobile ? 6 : 8),
                  ),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: isMobile ? 14 : 16,
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

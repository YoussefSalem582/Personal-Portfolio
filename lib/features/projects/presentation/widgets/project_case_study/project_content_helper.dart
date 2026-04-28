import '../../../../../core/locale/app_locale_binding.dart';
import '../../../data/project_case_study_data.dart';
import 'package:youssef_hassan_portfolio/features/projects/data/localized/project_case_study_data_ar.dart';

/// Bridges callers to [ProjectCaseStudyData] (`features/projects/data/`).
///
/// Prefer calling [ProjectCaseStudyData] directly from new code.
class ProjectContentHelper {
  static List<Map<String, String>> getProjectChallenges(String projectId) {
    if (AppLocaleBinding.isArabic) {
      return ProjectCaseStudyDataAr.getProjectChallenges(projectId);
    }
    return ProjectCaseStudyData.getProjectChallenges(projectId);
  }

  static List<String> getProjectLessons(String projectId) {
    if (AppLocaleBinding.isArabic) {
      return ProjectCaseStudyDataAr.getProjectLessons(projectId);
    }
    return ProjectCaseStudyData.getProjectLessons(projectId);
  }

  static String getProjectOverviewText(String projectId, String description) {
    if (AppLocaleBinding.isArabic) {
      return ProjectCaseStudyDataAr.getProjectOverviewText(
          projectId, description);
    }
    return ProjectCaseStudyData.getProjectOverviewText(projectId, description);
  }

  static List<Map<String, dynamic>>? getProjectFeatures(String projectId) {
    if (AppLocaleBinding.isArabic) {
      return ProjectCaseStudyDataAr.getProjectFeatures(projectId);
    }
    return ProjectCaseStudyData.getProjectFeatures(projectId);
  }
}

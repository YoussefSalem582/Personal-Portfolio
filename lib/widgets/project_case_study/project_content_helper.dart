import '../../utils/data/project_case_study_data.dart';

/// Helper class for project-specific content
///
/// This class now delegates to ProjectCaseStudyData in lib/utils/data
/// for better separation of concerns. Keep this file for backward compatibility.
///
/// @deprecated Use ProjectCaseStudyData from lib/utils/data instead
class ProjectContentHelper {
  /// Gets project-specific challenges and solutions
  ///
  /// @deprecated Use ProjectCaseStudyData.getProjectChallenges instead
  static List<Map<String, String>> getProjectChallenges(String projectId) {
    return ProjectCaseStudyData.getProjectChallenges(projectId);
  }

  /// Gets project-specific key learnings
  ///
  /// @deprecated Use ProjectCaseStudyData.getProjectLessons instead
  static List<String> getProjectLessons(String projectId) {
    return ProjectCaseStudyData.getProjectLessons(projectId);
  }

  /// Gets project-specific overview text
  ///
  /// @deprecated Use ProjectCaseStudyData.getProjectOverviewText instead
  static String getProjectOverviewText(String projectId, String description) {
    return ProjectCaseStudyData.getProjectOverviewText(projectId, description);
  }
}

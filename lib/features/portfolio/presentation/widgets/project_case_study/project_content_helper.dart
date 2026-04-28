import '../../../data/project_case_study_data.dart';

/// Bridges legacy callers to [ProjectCaseStudyData] (`features/portfolio/data/`).
///
/// Prefer calling [ProjectCaseStudyData] directly from new code.
class ProjectContentHelper {
  static List<Map<String, String>> getProjectChallenges(String projectId) {
    return ProjectCaseStudyData.getProjectChallenges(projectId);
  }

  static List<String> getProjectLessons(String projectId) {
    return ProjectCaseStudyData.getProjectLessons(projectId);
  }

  static String getProjectOverviewText(String projectId, String description) {
    return ProjectCaseStudyData.getProjectOverviewText(projectId, description);
  }
}

import '../../../models/project.dart';

/// Pure filter logic for the projects grid (used by [ProjectsBloc]).
class ProjectFilter {
  ProjectFilter._();

  static List<Project> apply(List<Project> projects, String selectedFilter) {
    if (selectedFilter == 'All') {
      return List<Project>.from(projects);
    }
    return projects.where((project) {
      final projectTechs = project.technologies.join(' ').toLowerCase();
      final projectTitle = project.title.toLowerCase();
      final projectDesc = project.description.toLowerCase();

      switch (selectedFilter) {
        case 'Flutter':
          return projectTechs.contains('flutter') ||
              projectTechs.contains('dart');
        case 'GetX':
          return projectTechs.contains('getx') || projectTechs.contains('get');
        case 'BLoC/Cubit':
          return projectTechs.contains('bloc') ||
              projectTechs.contains('cubit');
        case 'E-commerce':
          return projectTitle.contains('shop') ||
              projectTitle.contains('gogesh') ||
              projectTitle.contains('marketplace') ||
              projectDesc.contains('shopping') ||
              projectDesc.contains('e-commerce') ||
              projectDesc.contains('commercial') ||
              projectDesc.contains('payment') ||
              projectTechs.contains('payment');
        case 'Chat Apps':
          return projectTitle.contains('chat') ||
              projectDesc.contains('messaging') ||
              projectDesc.contains('chat') ||
              projectTechs.contains('chat') ||
              projectTechs.contains('messaging') ||
              projectTechs.contains('real-time database');
        case 'Education':
          return projectTitle.contains('quiz') ||
              projectTitle.contains('learning') ||
              projectDesc.contains('education') ||
              projectDesc.contains('quiz') ||
              projectDesc.contains('exam') ||
              projectDesc.contains('learning');
        case 'Firebase':
          return projectTechs.contains('firebase') ||
              projectTechs.contains('firestore') ||
              projectTechs.contains('real-time database') ||
              projectTechs.contains('cloud functions') ||
              projectTechs.contains('authentication') ||
              projectTechs.contains('fcm');
        case 'Maps & GPS':
          return projectTechs.contains('maps') ||
              projectTechs.contains('location') ||
              projectTechs.contains('google maps') ||
              projectTechs.contains('gps') ||
              projectTechs.contains('geolocator') ||
              projectTechs.contains('flutter_map') ||
              projectDesc.contains('carpool') ||
              projectDesc.contains('navigation');
        case 'AI/ML':
          return projectTechs.contains('machine learning') ||
              projectTechs.contains('tensorflow') ||
              projectTechs.contains('ai') ||
              projectTechs.contains('ml') ||
              projectTechs.contains('computer vision') ||
              projectTechs.contains('opencv') ||
              projectDesc.contains('emotion recognition') ||
              projectDesc.contains('facial recognition') ||
              projectDesc.contains('sign language');
        case 'Clean Architecture':
          return projectTechs.contains('clean architecture') ||
              projectTechs.contains('repository pattern') ||
              projectDesc.contains('clean architecture');
        case 'Enterprise':
          return projectDesc.contains('enterprise') ||
              projectTitle.contains('emosense') ||
              projectTitle.contains('gogesh') ||
              projectTechs.contains('enterprise') ||
              projectTechs.contains('jwt') ||
              projectTechs.contains('oauth');
        default:
          return project.technologies.contains(selectedFilter);
      }
    }).toList();
  }

  static List<Project> applyLimited(
    List<Project> projects,
    String selectedFilter,
    int displayedCount,
  ) {
    final filtered = apply(projects, selectedFilter);
    if (filtered.length > displayedCount) {
      return filtered.take(displayedCount).toList();
    }
    return filtered;
  }
}

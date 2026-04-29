import '../../domain/entities/project.dart';
import '../../../../utils/data/portfolio_data.dart';
import '../../domain/entities/projects_content_entity.dart';
import 'projects_local_datasource.dart';

class ProjectsLocalDataSourceImpl implements ProjectsLocalDataSource {
  const ProjectsLocalDataSourceImpl();

  @override
  ProjectsContentEntity getContentSync() {
    return ProjectsContentEntity(
      projects: PortfolioData.projects,
      featuredProjects: PortfolioData.featuredProjects,
    );
  }

  @override
  Project? resolveProjectSegment(String segment) =>
      _findProjectById(segment) ?? _findProjectBySlug(segment);

  Project? _findProjectById(String id) {
    for (final p in PortfolioData.projects) {
      if (p.id == id) return p;
    }
    return null;
  }

  Project? _findProjectBySlug(String slug) {
    final normalized = slug.toLowerCase();
    for (final p in PortfolioData.projects) {
      if (p.title.toLowerCase().replaceAll(' ', '-') == normalized) {
        return p;
      }
    }
    return null;
  }
}

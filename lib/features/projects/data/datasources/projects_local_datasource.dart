import '../../../../models/project.dart';
import '../../domain/entities/projects_content_entity.dart';

abstract class ProjectsLocalDataSource {
  ProjectsContentEntity getContentSync();

  Project? resolveProjectSegment(String segment);
}

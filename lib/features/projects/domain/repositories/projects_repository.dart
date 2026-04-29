import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/project.dart';
import '../entities/projects_content_entity.dart';

abstract class ProjectsRepository {
  Future<Either<Failure, ProjectsContentEntity>> loadProjectsContent();

  /// Resolve URL segment to a project (local static index).
  Project? resolveProjectSegment(String segment);
}

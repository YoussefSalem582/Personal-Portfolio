import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/project.dart';
import '../../domain/entities/projects_content_entity.dart';
import '../../domain/repositories/projects_repository.dart';
import '../datasources/projects_local_datasource.dart';

class ProjectsRepositoryImpl implements ProjectsRepository {
  ProjectsRepositoryImpl({required ProjectsLocalDataSource local}) : _local = local;

  final ProjectsLocalDataSource _local;

  @override
  Future<Either<Failure, ProjectsContentEntity>> loadProjectsContent() async {
    try {
      return Right(_local.getContentSync());
    } catch (e, st) {
      return Left(UnexpectedFailure(message: '$e\n$st'));
    }
  }

  @override
  Project? resolveProjectSegment(String segment) =>
      _local.resolveProjectSegment(segment);
}

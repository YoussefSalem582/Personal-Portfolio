import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/projects_content_entity.dart';
import '../repositories/projects_repository.dart';

class LoadProjectsContentUseCase
    implements UseCase<ProjectsContentEntity, NoParams> {
  LoadProjectsContentUseCase(this._repository);

  final ProjectsRepository _repository;

  @override
  Future<Either<Failure, ProjectsContentEntity>> call(NoParams params) =>
      _repository.loadProjectsContent();
}

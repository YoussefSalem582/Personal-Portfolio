import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/skills_content_entity.dart';
import '../repositories/skills_repository.dart';

class LoadSkillsContentUseCase
    implements UseCase<SkillsContentEntity, NoParams> {
  LoadSkillsContentUseCase(this._repository);

  final SkillsRepository _repository;

  @override
  Future<Either<Failure, SkillsContentEntity>> call(NoParams params) =>
      _repository.loadSkillsContent();
}

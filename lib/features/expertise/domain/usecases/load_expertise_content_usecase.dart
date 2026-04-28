import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/expertise_content_entity.dart';
import '../repositories/expertise_repository.dart';

class LoadExpertiseContentUseCase
    implements UseCase<ExpertiseContentEntity, NoParams> {
  LoadExpertiseContentUseCase(this._repository);

  final ExpertiseRepository _repository;

  @override
  Future<Either<Failure, ExpertiseContentEntity>> call(NoParams params) =>
      _repository.loadExpertiseContent();
}

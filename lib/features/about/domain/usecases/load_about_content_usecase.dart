import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/about_content_entity.dart';
import '../repositories/about_repository.dart';

class LoadAboutContentUseCase
    implements UseCase<AboutContentEntity, NoParams> {
  LoadAboutContentUseCase(this._repository);

  final AboutRepository _repository;

  @override
  Future<Either<Failure, AboutContentEntity>> call(NoParams params) =>
      _repository.loadAboutContent();
}

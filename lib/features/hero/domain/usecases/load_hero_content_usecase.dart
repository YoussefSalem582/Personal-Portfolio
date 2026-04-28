import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/hero_content_entity.dart';
import '../repositories/hero_repository.dart';

class LoadHeroContentUseCase implements UseCase<HeroContentEntity, NoParams> {
  LoadHeroContentUseCase(this._repository);

  final HeroRepository _repository;

  @override
  Future<Either<Failure, HeroContentEntity>> call(NoParams params) =>
      _repository.loadHeroContent();
}

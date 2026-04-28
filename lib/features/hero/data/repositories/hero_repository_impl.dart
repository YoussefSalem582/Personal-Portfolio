import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/hero_content_entity.dart';
import '../../domain/repositories/hero_repository.dart';
import '../datasources/hero_local_datasource.dart';

class HeroRepositoryImpl implements HeroRepository {
  HeroRepositoryImpl({required HeroLocalDataSource local}) : _local = local;

  final HeroLocalDataSource _local;

  @override
  Future<Either<Failure, HeroContentEntity>> loadHeroContent() async {
    try {
      return Right(_local.getContentSync());
    } catch (e, st) {
      return Left(UnexpectedFailure(message: '$e\n$st'));
    }
  }
}

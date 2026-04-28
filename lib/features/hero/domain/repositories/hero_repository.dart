import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/hero_content_entity.dart';

abstract class HeroRepository {
  Future<Either<Failure, HeroContentEntity>> loadHeroContent();
}

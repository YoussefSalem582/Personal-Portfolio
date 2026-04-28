import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/expertise_content_entity.dart';

abstract class ExpertiseRepository {
  Future<Either<Failure, ExpertiseContentEntity>> loadExpertiseContent();
}

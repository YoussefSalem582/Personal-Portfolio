import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/skills_content_entity.dart';

abstract class SkillsRepository {
  Future<Either<Failure, SkillsContentEntity>> loadSkillsContent();
}

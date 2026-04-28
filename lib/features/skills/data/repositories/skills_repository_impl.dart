import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/skills_content_entity.dart';
import '../../domain/repositories/skills_repository.dart';
import '../datasources/skills_local_datasource.dart';

class SkillsRepositoryImpl implements SkillsRepository {
  SkillsRepositoryImpl({required SkillsLocalDataSource local}) : _local = local;

  final SkillsLocalDataSource _local;

  @override
  Future<Either<Failure, SkillsContentEntity>> loadSkillsContent() async {
    try {
      return Right(_local.getContentSync());
    } catch (e, st) {
      return Left(UnexpectedFailure(message: '$e\n$st'));
    }
  }
}

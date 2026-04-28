import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/expertise_content_entity.dart';
import '../../domain/repositories/expertise_repository.dart';
import '../datasources/expertise_local_datasource.dart';

class ExpertiseRepositoryImpl implements ExpertiseRepository {
  ExpertiseRepositoryImpl({required ExpertiseLocalDataSource local})
      : _local = local;

  final ExpertiseLocalDataSource _local;

  @override
  Future<Either<Failure, ExpertiseContentEntity>> loadExpertiseContent() async {
    try {
      return Right(_local.getContentSync());
    } catch (e, st) {
      return Left(UnexpectedFailure(message: '$e\n$st'));
    }
  }
}

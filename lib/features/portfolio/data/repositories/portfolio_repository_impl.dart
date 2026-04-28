import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../models/project.dart';
import '../../domain/entities/portfolio_snapshot_entity.dart';
import '../../domain/repositories/portfolio_repository.dart';
import '../datasources/portfolio_local_datasource.dart';

/// Portfolio repository backed by local static data ([AttendanceRepositoryImpl] analogue).
class PortfolioRepositoryImpl implements PortfolioRepository {
  PortfolioRepositoryImpl({required PortfolioLocalDataSource local}) : _local = local;

  final PortfolioLocalDataSource _local;

  @override
  Future<Either<Failure, PortfolioSnapshotEntity>> loadSnapshot() async {
    try {
      return Right(_local.getSnapshotSync());
    } catch (e, st) {
      return Left(UnexpectedFailure(message: '$e\n$st'));
    }
  }

  @override
  Project? resolveProjectSegment(String segment) =>
      _local.resolveProjectSegment(segment);
}

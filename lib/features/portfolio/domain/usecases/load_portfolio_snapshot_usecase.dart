import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/portfolio_snapshot_entity.dart';
import '../repositories/portfolio_repository.dart';

/// Loads the static portfolio aggregate through the repository boundary.
class LoadPortfolioSnapshotUseCase
    implements UseCase<PortfolioSnapshotEntity, NoParams> {
  LoadPortfolioSnapshotUseCase(this._repository);

  final PortfolioRepository _repository;

  @override
  Future<Either<Failure, PortfolioSnapshotEntity>> call(NoParams params) =>
      _repository.loadSnapshot();
}

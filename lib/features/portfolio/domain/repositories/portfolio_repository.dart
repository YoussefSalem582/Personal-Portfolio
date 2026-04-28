import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../models/project.dart';
import '../entities/portfolio_snapshot_entity.dart';

/// Portfolio domain contract ([AttendanceRepository] analogue).
abstract class PortfolioRepository {
  Future<Either<Failure, PortfolioSnapshotEntity>> loadSnapshot();

  /// Resolve URL segment to a project (local static index; not [Either]).
  Project? resolveProjectSegment(String segment);
}

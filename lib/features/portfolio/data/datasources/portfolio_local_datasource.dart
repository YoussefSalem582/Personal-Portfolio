import '../../../../models/project.dart';
import '../../domain/entities/portfolio_snapshot_entity.dart';

/// Local/static portfolio source ([attendance] local datasource analogue).
abstract class PortfolioLocalDataSource {
  PortfolioSnapshotEntity getSnapshotSync();

  Project? resolveProjectSegment(String segment);
}

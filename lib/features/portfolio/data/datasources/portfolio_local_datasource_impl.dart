import '../../../../models/project.dart';
import '../../../../utils/data/portfolio_data.dart';
import '../../domain/entities/portfolio_snapshot_entity.dart';
import '../models/portfolio_snapshot_model.dart';
import 'portfolio_local_datasource.dart';

class PortfolioLocalDataSourceImpl implements PortfolioLocalDataSource {
  const PortfolioLocalDataSourceImpl();

  @override
  PortfolioSnapshotEntity getSnapshotSync() {
    return PortfolioSnapshotModel.toEntity();
  }

  @override
  Project? resolveProjectSegment(String segment) =>
      _findProjectById(segment) ?? _findProjectBySlug(segment);

  Project? _findProjectById(String id) {
    for (final p in PortfolioData.projects) {
      if (p.id == id) return p;
    }
    return null;
  }

  Project? _findProjectBySlug(String slug) {
    final normalized = slug.toLowerCase();
    for (final p in PortfolioData.projects) {
      if (p.title.toLowerCase().replaceAll(' ', '-') == normalized) {
        return p;
      }
    }
    return null;
  }
}

import '../../domain/entities/portfolio_snapshot_entity.dart';

/// Bundled snapshot projection into [PortfolioSnapshotEntity] (data/models layer parity with attendance).
abstract final class PortfolioSnapshotModel {
  PortfolioSnapshotModel._();

  /// Maps static bundles to the domain aggregate (no REST JSON in this app).
  static PortfolioSnapshotEntity toEntity() =>
      PortfolioSnapshotEntity.fromPortfolioData();
}

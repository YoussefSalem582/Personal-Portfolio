import 'package:equatable/equatable.dart';

abstract class PortfolioEvent extends Equatable {
  const PortfolioEvent();

  @override
  List<Object?> get props => [];
}

/// Emitted by UI pull-to-refresh or future CMS sync hooks (no-op today).
final class PortfolioRefreshRequested extends PortfolioEvent {
  const PortfolioRefreshRequested();
}

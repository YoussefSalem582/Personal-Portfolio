import 'package:equatable/equatable.dart';

abstract class PortfolioState extends Equatable {
  const PortfolioState();

  @override
  List<Object?> get props => [];
}

/// Static portfolio — data is available immediately from [PortfolioRepository].
final class PortfolioReady extends PortfolioState {
  const PortfolioReady();
}

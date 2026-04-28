import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/usecase/usecase.dart';
import '../../domain/usecases/load_portfolio_snapshot_usecase.dart';
import 'portfolio_event.dart';
import 'portfolio_state.dart';

/// Portfolio feature BLoC (see [AttendanceBloc] layering: use cases in).
class PortfolioBloc extends Bloc<PortfolioEvent, PortfolioState> {
  PortfolioBloc({
    required LoadPortfolioSnapshotUseCase loadPortfolioSnapshotUseCase,
  })  : _loadPortfolioSnapshotUseCase = loadPortfolioSnapshotUseCase,
        super(const PortfolioReady()) {
    on<PortfolioRefreshRequested>(_onRefresh);
  }

  final LoadPortfolioSnapshotUseCase _loadPortfolioSnapshotUseCase;

  Future<void> _onRefresh(
    PortfolioRefreshRequested event,
    Emitter<PortfolioState> emit,
  ) async {
    await _loadPortfolioSnapshotUseCase(const NoParams());
  }
}

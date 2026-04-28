import 'package:flutter_test/flutter_test.dart';
import 'package:youssef_hassan_portfolio/features/portfolio/data/datasources/portfolio_local_datasource_impl.dart';
import 'package:youssef_hassan_portfolio/features/portfolio/data/repositories/portfolio_repository_impl.dart';
import 'package:youssef_hassan_portfolio/features/portfolio/domain/usecases/load_portfolio_snapshot_usecase.dart';
import 'package:youssef_hassan_portfolio/features/portfolio/presentation/bloc/portfolio_bloc.dart';
import 'package:youssef_hassan_portfolio/features/portfolio/presentation/bloc/portfolio_event.dart';
import 'package:youssef_hassan_portfolio/features/portfolio/presentation/bloc/portfolio_state.dart';
void main() {
  late PortfolioBloc bloc;

  setUp(() {
    final repo = PortfolioRepositoryImpl(
      local: const PortfolioLocalDataSourceImpl(),
    );
    final useCase = LoadPortfolioSnapshotUseCase(repo);
    bloc = PortfolioBloc(loadPortfolioSnapshotUseCase: useCase);
  });

  tearDown(() async {
    await bloc.close();
  });

  test('initial state is PortfolioReady', () {
    expect(bloc.state, equals(const PortfolioReady()));
  });

  test('PortfolioRefreshRequested runs snapshot use case without error',
      () async {
    bloc.add(const PortfolioRefreshRequested());
    await Future<void>.delayed(Duration.zero);
    expect(bloc.state, equals(const PortfolioReady()));
  });
}

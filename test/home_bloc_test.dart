import 'package:flutter_test/flutter_test.dart';
import 'package:youssef_salem_portfolio/features/home/data/datasources/home_local_datasource_impl.dart';
import 'package:youssef_salem_portfolio/features/home/data/repositories/home_repository_impl.dart';
import 'package:youssef_salem_portfolio/features/home/domain/entities/home_layout.dart';
import 'package:youssef_salem_portfolio/features/home/domain/usecases/resolve_initial_home_section_usecase.dart';
import 'package:youssef_salem_portfolio/features/home/presentation/bloc/home_bloc.dart';
import 'package:youssef_salem_portfolio/features/home/presentation/bloc/home_event.dart';
import 'package:youssef_salem_portfolio/features/home/presentation/bloc/home_state.dart';

void main() {
  late ResolveInitialHomeSectionUseCase resolve;

  setUp(() {
    final repo = HomeRepositoryImpl(
      local: const HomeLocalDataSourceImpl(),
    );
    resolve = ResolveInitialHomeSectionUseCase(repo);
  });

  test('starts at route override', () {
    final bloc = HomeBloc(
      resolveInitialSection: resolve,
      routeSectionOverride: 3,
    );
    expect(bloc.state.currentSection, 3);
    bloc.close();
  });

  test('hero when no route override', () {
    final bloc = HomeBloc(
      resolveInitialSection: resolve,
    );
    expect(bloc.state.currentSection, 0);
    bloc.close();
  });

  test('emits when section index changes', () async {
    final bloc = HomeBloc(
      resolveInitialSection: resolve,
    );
    final expectFuture = expectLater(
      bloc.stream,
      emitsInOrder(<HomeState>[
        const HomeState(currentSection: 2),
      ]),
    );
    bloc.add(const HomeSectionIndexChanged(2));
    await expectFuture;
    await bloc.close();
  });

  test('ignores duplicate section index', () async {
    final bloc = HomeBloc(
      resolveInitialSection: resolve,
      routeSectionOverride: 1,
    );
    var emissions = 0;
    final sub = bloc.stream.listen((_) => emissions++);
    bloc.add(const HomeSectionIndexChanged(1));
    await Future<void>.delayed(Duration.zero);
    expect(emissions, 0);
    await sub.cancel();
    await bloc.close();
  });

  test('clamps route override to section range', () {
    final bloc = HomeBloc(
      resolveInitialSection: resolve,
      routeSectionOverride: 99,
    );
    expect(bloc.state.currentSection, HomeLayout.sectionCount - 1);
    bloc.close();
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:youssef_hassan_portfolio/features/theme/data/datasources/theme_local_datasource_impl.dart';
import 'package:youssef_hassan_portfolio/features/theme/data/repositories/theme_repository_impl.dart';
import 'package:youssef_hassan_portfolio/features/theme/domain/usecases/load_initial_theme_mode_usecase.dart';
import 'package:youssef_hassan_portfolio/features/theme/domain/usecases/persist_theme_mode_usecase.dart';
import 'package:youssef_hassan_portfolio/features/theme/presentation/bloc/theme_bloc.dart';
import 'package:youssef_hassan_portfolio/features/theme/presentation/bloc/theme_event.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('ThemeBloc', () {
    late SharedPreferences prefs;

    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      prefs = await SharedPreferences.getInstance();
    });

    test('hydrate defaults to system when prefs empty', () async {
      final repo = ThemeRepositoryImpl(
        local: ThemeLocalDataSourceImpl(sharedPreferences: prefs),
      );
      final bloc = ThemeBloc(
        loadInitialThemeMode: LoadInitialThemeModeUseCase(repo),
        persistThemeMode: PersistThemeModeUseCase(repo),
      );
      await Future<void>.delayed(Duration.zero);
      expect(bloc.state.themeMode, ThemeMode.system);
      await bloc.close();
    });

    test('ThemeModeSubmitted persists and reloads', () async {
      final repo = ThemeRepositoryImpl(
        local: ThemeLocalDataSourceImpl(sharedPreferences: prefs),
      );
      final bloc = ThemeBloc(
        loadInitialThemeMode: LoadInitialThemeModeUseCase(repo),
        persistThemeMode: PersistThemeModeUseCase(repo),
      );
      bloc.add(const ThemeModeSubmitted(ThemeMode.dark));
      await Future<void>.delayed(Duration.zero);
      expect(bloc.state.themeMode, ThemeMode.dark);
      expect(prefs.getString('portfolio_theme_mode'), 'dark');
      await bloc.close();

      final bloc2 = ThemeBloc(
        loadInitialThemeMode: LoadInitialThemeModeUseCase(repo),
        persistThemeMode: PersistThemeModeUseCase(repo),
      );
      await Future<void>.delayed(Duration.zero);
      expect(bloc2.state.themeMode, ThemeMode.dark);
      await bloc2.close();
    });
  });
}

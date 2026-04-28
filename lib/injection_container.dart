import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'config/routes/app_router.dart';
import 'features/portfolio/data/datasources/portfolio_local_datasource.dart';
import 'features/portfolio/data/datasources/portfolio_local_datasource_impl.dart';
import 'features/portfolio/data/repositories/portfolio_repository_impl.dart';
import 'features/portfolio/domain/repositories/portfolio_repository.dart';
import 'features/portfolio/domain/usecases/load_portfolio_snapshot_usecase.dart';
import 'features/portfolio/presentation/bloc/portfolio_bloc.dart';
import 'features/theme/data/datasources/theme_local_datasource.dart';
import 'features/theme/data/datasources/theme_local_datasource_impl.dart';
import 'features/theme/data/repositories/theme_repository_impl.dart';
import 'features/theme/domain/repositories/theme_repository.dart';
import 'features/theme/domain/usecases/load_initial_theme_mode_usecase.dart';
import 'features/theme/domain/usecases/persist_theme_mode_usecase.dart';
import 'features/locale/data/datasources/locale_local_datasource.dart';
import 'features/locale/data/datasources/locale_local_datasource_impl.dart';
import 'features/locale/data/repositories/locale_repository_impl.dart';
import 'features/locale/domain/repositories/locale_repository.dart';
import 'features/locale/domain/usecases/load_initial_locale_usecase.dart';
import 'features/locale/domain/usecases/persist_locale_usecase.dart';
import 'features/locale/presentation/bloc/locale_bloc.dart';
import 'features/theme/presentation/bloc/theme_bloc.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  final prefs = await SharedPreferences.getInstance();
  sl.registerSingleton<SharedPreferences>(prefs);

  // Portfolio (local datasource → repository → use case → bloc)
  sl.registerLazySingleton<PortfolioLocalDataSource>(
    () => const PortfolioLocalDataSourceImpl(),
  );
  sl.registerLazySingleton<PortfolioRepository>(
    () => PortfolioRepositoryImpl(local: sl()),
  );
  sl.registerLazySingleton(() => LoadPortfolioSnapshotUseCase(sl()));
  sl.registerLazySingleton(
    () => PortfolioBloc(loadPortfolioSnapshotUseCase: sl()),
  );

  // Theme (local datasource → repository → use cases → bloc)
  sl.registerLazySingleton<ThemeLocalDataSource>(
    () => ThemeLocalDataSourceImpl(sharedPreferences: sl()),
  );
  sl.registerLazySingleton<ThemeRepository>(
    () => ThemeRepositoryImpl(local: sl()),
  );
  sl.registerLazySingleton(() => LoadInitialThemeModeUseCase(sl()));
  sl.registerLazySingleton(() => PersistThemeModeUseCase(sl()));
  sl.registerLazySingleton(
    () => ThemeBloc(
      loadInitialThemeMode: sl(),
      persistThemeMode: sl(),
    ),
  );

  // Locale (language preference)
  sl.registerLazySingleton<LocaleLocalDataSource>(
    () => LocaleLocalDataSourceImpl(sharedPreferences: sl()),
  );
  sl.registerLazySingleton<LocaleRepository>(
    () => LocaleRepositoryImpl(local: sl()),
  );
  sl.registerLazySingleton(() => LoadInitialLocaleUseCase(sl()));
  sl.registerLazySingleton(() => PersistLocaleUseCase(sl()));
  sl.registerLazySingleton(
    () => LocaleBloc(
      loadInitialLocale: sl(),
      persistLocale: sl(),
    ),
  );

  sl.registerLazySingleton<GoRouter>(createPortfolioRouter);
}

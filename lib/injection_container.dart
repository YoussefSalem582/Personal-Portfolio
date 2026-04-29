import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/config/routes/app_router.dart';
import 'features/projects/data/datasources/projects_local_datasource.dart';
import 'features/projects/data/datasources/projects_local_datasource_impl.dart';
import 'features/projects/data/repositories/projects_repository_impl.dart';
import 'features/projects/domain/repositories/projects_repository.dart';
import 'features/projects/domain/usecases/load_projects_content_usecase.dart';
import 'features/projects/presentation/bloc/projects_bloc.dart';
import 'features/theme/data/datasources/theme_local_datasource.dart';
import 'features/theme/data/datasources/theme_local_datasource_impl.dart';
import 'features/theme/data/repositories/theme_repository_impl.dart';
import 'features/theme/domain/repositories/theme_repository.dart';
import 'features/theme/domain/usecases/load_initial_theme_mode_usecase.dart';
import 'features/theme/domain/usecases/persist_theme_mode_usecase.dart';
import 'features/home/data/datasources/home_local_datasource.dart';
import 'features/home/data/datasources/home_local_datasource_impl.dart';
import 'features/home/data/repositories/home_repository_impl.dart';
import 'features/home/domain/repositories/home_repository.dart';
import 'features/home/domain/usecases/resolve_initial_home_section_usecase.dart';
import 'features/locale/data/datasources/locale_local_datasource.dart';
import 'features/locale/data/datasources/locale_local_datasource_impl.dart';
import 'features/locale/data/repositories/locale_repository_impl.dart';
import 'features/locale/domain/repositories/locale_repository.dart';
import 'features/locale/domain/usecases/load_initial_locale_usecase.dart';
import 'features/locale/domain/usecases/persist_locale_usecase.dart';
import 'features/about/data/datasources/about_local_datasource.dart';
import 'features/about/data/datasources/about_local_datasource_impl.dart';
import 'features/about/data/repositories/about_repository_impl.dart';
import 'features/about/domain/repositories/about_repository.dart';
import 'features/about/domain/usecases/load_about_content_usecase.dart';
import 'features/about/presentation/bloc/about_bloc.dart';
import 'features/certificates/data/datasources/certificates_local_datasource.dart';
import 'features/certificates/data/datasources/certificates_local_datasource_impl.dart';
import 'features/certificates/data/repositories/certificates_repository_impl.dart';
import 'features/certificates/domain/repositories/certificates_repository.dart';
import 'features/certificates/domain/usecases/load_certificates_content_usecase.dart';
import 'features/certificates/presentation/bloc/certificates_bloc.dart';
import 'features/contact/data/datasources/contact_local_datasource.dart';
import 'features/contact/data/datasources/contact_local_datasource_impl.dart';
import 'features/contact/data/datasources/contact_remote_datasource.dart';
import 'features/contact/data/datasources/contact_remote_datasource_impl.dart';
import 'features/contact/data/repositories/contact_repository_impl.dart';
import 'features/contact/domain/repositories/contact_repository.dart';
import 'features/contact/domain/usecases/submit_contact_usecase.dart';
import 'features/contact/presentation/bloc/contact_bloc.dart';
import 'features/expertise/data/datasources/expertise_local_datasource.dart';
import 'features/expertise/data/datasources/expertise_local_datasource_impl.dart';
import 'features/expertise/data/repositories/expertise_repository_impl.dart';
import 'features/expertise/domain/repositories/expertise_repository.dart';
import 'features/expertise/domain/usecases/load_expertise_content_usecase.dart';
import 'features/expertise/presentation/bloc/expertise_bloc.dart';
import 'features/hero/data/datasources/hero_local_datasource.dart';
import 'features/hero/data/datasources/hero_local_datasource_impl.dart';
import 'features/hero/data/repositories/hero_repository_impl.dart';
import 'features/hero/domain/repositories/hero_repository.dart';
import 'features/hero/domain/usecases/load_hero_content_usecase.dart';
import 'features/hero/presentation/bloc/hero_bloc.dart';
import 'features/locale/presentation/bloc/locale_bloc.dart';
import 'features/skills/data/datasources/skills_local_datasource.dart';
import 'features/skills/data/datasources/skills_local_datasource_impl.dart';
import 'features/skills/data/repositories/skills_repository_impl.dart';
import 'features/skills/domain/repositories/skills_repository.dart';
import 'features/skills/domain/usecases/load_skills_content_usecase.dart';
import 'features/skills/presentation/bloc/skills_bloc.dart';
import 'features/theme/presentation/bloc/theme_bloc.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  final prefs = await SharedPreferences.getInstance();
  sl.registerSingleton<SharedPreferences>(prefs);

  // Projects (listing + case-study routing)
  sl.registerLazySingleton<ProjectsLocalDataSource>(
    () => const ProjectsLocalDataSourceImpl(),
  );
  sl.registerLazySingleton<ProjectsRepository>(
    () => ProjectsRepositoryImpl(local: sl()),
  );
  sl.registerLazySingleton(() => LoadProjectsContentUseCase(sl()));
  sl.registerFactory(() => ProjectsBloc(loadProjectsContent: sl()));
  sl.registerLazySingleton<HeroLocalDataSource>(
    () => const HeroLocalDataSourceImpl(),
  );
  sl.registerLazySingleton<HeroRepository>(
    () => HeroRepositoryImpl(local: sl()),
  );
  sl.registerLazySingleton(() => LoadHeroContentUseCase(sl()));
  sl.registerFactory(() => HeroBloc(loadHeroContent: sl()));

  sl.registerLazySingleton<AboutLocalDataSource>(
    () => const AboutLocalDataSourceImpl(),
  );
  sl.registerLazySingleton<AboutRepository>(
    () => AboutRepositoryImpl(local: sl()),
  );
  sl.registerLazySingleton(() => LoadAboutContentUseCase(sl()));
  sl.registerFactory(() => AboutBloc(loadAboutContent: sl()));

  sl.registerLazySingleton<SkillsLocalDataSource>(
    () => const SkillsLocalDataSourceImpl(),
  );
  sl.registerLazySingleton<SkillsRepository>(
    () => SkillsRepositoryImpl(local: sl()),
  );
  sl.registerLazySingleton(() => LoadSkillsContentUseCase(sl()));
  sl.registerFactory(() => SkillsBloc(loadSkillsContent: sl()));

  sl.registerLazySingleton<ExpertiseLocalDataSource>(
    () => const ExpertiseLocalDataSourceImpl(),
  );
  sl.registerLazySingleton<ExpertiseRepository>(
    () => ExpertiseRepositoryImpl(local: sl()),
  );
  sl.registerLazySingleton(() => LoadExpertiseContentUseCase(sl()));
  sl.registerFactory(() => ExpertiseBloc(loadExpertiseContent: sl()));

  sl.registerLazySingleton<CertificatesLocalDataSource>(
    () => const CertificatesLocalDataSourceImpl(),
  );
  sl.registerLazySingleton<CertificatesRepository>(
    () => CertificatesRepositoryImpl(local: sl()),
  );
  sl.registerLazySingleton(() => LoadCertificatesContentUseCase(sl()));
  sl.registerFactory(() => CertificatesBloc(loadCertificates: sl()));

  sl.registerLazySingleton<ContactLocalDataSource>(
    () => const ContactLocalDataSourceImpl(),
  );
  sl.registerLazySingleton<ContactRemoteDataSource>(
    () => ContactRemoteDataSourceImpl(),
  );
  sl.registerLazySingleton<ContactRepository>(
    () => ContactRepositoryImpl(local: sl(), remote: sl()),
  );
  sl.registerLazySingleton(() => SubmitContactUseCase(sl()));
  sl.registerFactory(
    () => ContactBloc(
      contactRepository: sl(),
      submitContactUseCase: sl(),
    ),
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

  // Home shell (landing section index bootstrap)
  sl.registerLazySingleton<HomeLocalDataSource>(
    () => const HomeLocalDataSourceImpl(),
  );
  sl.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(local: sl()),
  );
  sl.registerLazySingleton(
    () => ResolveInitialHomeSectionUseCase(sl()),
  );

  sl.registerLazySingleton<GoRouter>(createPortfolioRouter);
}

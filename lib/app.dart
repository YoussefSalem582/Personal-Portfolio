import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'core/locale/app_locale_binding.dart';
import 'features/locale/presentation/bloc/locale_bloc.dart';
import 'features/locale/presentation/bloc/locale_state.dart';
import 'features/theme/presentation/bloc/theme_bloc.dart';
import 'features/theme/presentation/bloc/theme_state.dart';
import 'injection_container.dart';
import 'l10n/app_localizations.dart';
import 'core/theme/app_theme.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>.value(value: sl<ThemeBloc>()),
        BlocProvider<LocaleBloc>.value(value: sl<LocaleBloc>()),
      ],
      child: BlocBuilder<LocaleBloc, LocaleUiState>(
        buildWhen: (previous, current) => previous.locale != current.locale,
        builder: (context, localeState) {
          AppLocaleBinding.update(localeState.locale);
          return BlocBuilder<ThemeBloc, ThemeUiState>(
            builder: (context, themeState) {
              return MaterialApp.router(
                routerConfig: sl<GoRouter>(),
                onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
                debugShowCheckedModeBanner: false,
                locale: localeState.locale,
                supportedLocales: AppLocalizations.supportedLocales,
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                themeMode: themeState.themeMode,
                builder: (context, child) => ResponsiveBreakpoints.builder(
                  child: child!,
                  breakpoints: const [
                    Breakpoint(start: 0, end: 450, name: MOBILE),
                    Breakpoint(start: 451, end: 800, name: TABLET),
                    Breakpoint(start: 801, end: 1920, name: DESKTOP),
                    Breakpoint(start: 1921, end: double.infinity, name: '4K'),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

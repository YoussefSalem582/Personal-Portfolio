import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/usecase/usecase.dart';
import '../../domain/usecases/load_initial_theme_mode_usecase.dart';
import '../../domain/usecases/persist_theme_mode_usecase.dart';
import 'theme_event.dart';
import 'theme_state.dart';

/// Theme mode from preferences via repository + use cases (attendance-style layering).
class ThemeBloc extends Bloc<ThemeEvent, ThemeUiState> {
  ThemeBloc({
    required LoadInitialThemeModeUseCase loadInitialThemeMode,
    required PersistThemeModeUseCase persistThemeMode,
  })  : _loadInitialThemeMode = loadInitialThemeMode,
        _persistThemeMode = persistThemeMode,
        super(const ThemeUiState()) {
    on<ThemeHydrateRequested>(_onHydrate);
    on<ThemeModeSubmitted>(_onModeSubmitted);
    on<ThemeToggleSubmitted>(_onToggle);
    add(const ThemeHydrateRequested());
  }

  final LoadInitialThemeModeUseCase _loadInitialThemeMode;
  final PersistThemeModeUseCase _persistThemeMode;

  bool isDarkModeEffective(BuildContext context) {
    if (state.themeMode == ThemeMode.system) {
      return Theme.of(context).brightness == Brightness.dark;
    }
    return state.themeMode == ThemeMode.dark;
  }

  Future<void> _onHydrate(
    ThemeHydrateRequested event,
    Emitter<ThemeUiState> emit,
  ) async {
    final result = await _loadInitialThemeMode(const NoParams());
    result.fold(
      (_) {},
      (mode) => emit(state.copyWith(themeMode: mode)),
    );
  }

  Future<void> _onModeSubmitted(
    ThemeModeSubmitted event,
    Emitter<ThemeUiState> emit,
  ) async {
    emit(state.copyWith(themeMode: event.mode));
    await _persistThemeMode(ThemeModeParams(event.mode));
  }

  Future<void> _onToggle(
    ThemeToggleSubmitted event,
    Emitter<ThemeUiState> emit,
  ) async {
    final mode = state.themeMode;
    final ThemeMode next;
    if (mode == ThemeMode.system) {
      next =
          event.ambientBrightness == Brightness.dark ? ThemeMode.light : ThemeMode.dark;
    } else {
      next =
          mode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    }
    emit(state.copyWith(themeMode: next));
    await _persistThemeMode(ThemeModeParams(next));
  }
}

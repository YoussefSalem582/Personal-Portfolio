import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/locale/app_locale_binding.dart';
import '../../../../core/usecase/usecase.dart';
import '../../domain/usecases/load_initial_locale_usecase.dart';
import '../../domain/usecases/persist_locale_usecase.dart';
import 'locale_event.dart';
import 'locale_state.dart';

class LocaleBloc extends Bloc<LocaleEvent, LocaleUiState> {
  LocaleBloc({
    required LoadInitialLocaleUseCase loadInitialLocale,
    required PersistLocaleUseCase persistLocale,
  })  : _loadInitialLocale = loadInitialLocale,
        _persistLocale = persistLocale,
        super(const LocaleUiState()) {
    on<LocaleHydrateRequested>(_onHydrate);
    on<LocaleChanged>(_onLocaleChanged);
    on<LocaleToggled>(_onToggled);
    add(const LocaleHydrateRequested());
  }

  final LoadInitialLocaleUseCase _loadInitialLocale;
  final PersistLocaleUseCase _persistLocale;

  static const Locale english = Locale('en');
  static const Locale arabic = Locale('ar');

  Future<void> _onHydrate(
    LocaleHydrateRequested event,
    Emitter<LocaleUiState> emit,
  ) async {
    final result = await _loadInitialLocale(const NoParams());
    result.fold(
      (_) {},
      (locale) {
        AppLocaleBinding.update(locale);
        emit(state.copyWith(locale: locale));
      },
    );
  }

  Future<void> _onLocaleChanged(
    LocaleChanged event,
    Emitter<LocaleUiState> emit,
  ) async {
    AppLocaleBinding.update(event.locale);
    emit(state.copyWith(locale: event.locale));
    await _persistLocale(LocaleParams(event.locale));
  }

  Future<void> _onToggled(
    LocaleToggled event,
    Emitter<LocaleUiState> emit,
  ) async {
    final next = state.locale.languageCode == 'ar' ? english : arabic;
    AppLocaleBinding.update(next);
    emit(state.copyWith(locale: next));
    await _persistLocale(LocaleParams(next));
  }
}

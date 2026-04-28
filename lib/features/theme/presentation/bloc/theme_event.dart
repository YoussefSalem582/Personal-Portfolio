import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object?> get props => [];
}

/// Load persisted preference on startup ([SharedPreferences]).
final class ThemeHydrateRequested extends ThemeEvent {
  const ThemeHydrateRequested();
}

final class ThemeModeSubmitted extends ThemeEvent {
  const ThemeModeSubmitted(this.mode);

  final ThemeMode mode;

  @override
  List<Object?> get props => [mode];
}

/// Toggle light/dark. Pass [ambientBrightness] from [Theme.of] for system-theme branch.
final class ThemeToggleSubmitted extends ThemeEvent {
  const ThemeToggleSubmitted({required this.ambientBrightness});

  final Brightness ambientBrightness;

  @override
  List<Object?> get props => [ambientBrightness];
}

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// Persistence + [MaterialApp] `themeMode` source of truth.
final class ThemeUiState extends Equatable {
  final ThemeMode themeMode;

  const ThemeUiState({this.themeMode = ThemeMode.system});

  ThemeUiState copyWith({ThemeMode? themeMode}) =>
      ThemeUiState(themeMode: themeMode ?? this.themeMode);

  @override
  List<Object?> get props => [themeMode];
}

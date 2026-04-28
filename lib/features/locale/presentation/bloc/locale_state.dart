import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

final class LocaleUiState extends Equatable {
  final Locale locale;

  const LocaleUiState({this.locale = const Locale('en')});

  LocaleUiState copyWith({Locale? locale}) =>
      LocaleUiState(locale: locale ?? this.locale);

  @override
  List<Object?> get props => [locale];
}

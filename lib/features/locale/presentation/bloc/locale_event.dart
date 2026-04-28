import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class LocaleEvent extends Equatable {
  const LocaleEvent();

  @override
  List<Object?> get props => [];
}

final class LocaleHydrateRequested extends LocaleEvent {
  const LocaleHydrateRequested();
}

final class LocaleChanged extends LocaleEvent {
  const LocaleChanged(this.locale);

  final Locale locale;

  @override
  List<Object?> get props => [locale];
}

final class LocaleToggled extends LocaleEvent {
  const LocaleToggled();
}

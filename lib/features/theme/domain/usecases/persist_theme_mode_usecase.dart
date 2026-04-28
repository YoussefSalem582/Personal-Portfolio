import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/theme_repository.dart';

/// Persists user's theme preference.
class ThemeModeParams extends Equatable {
  const ThemeModeParams(this.mode);

  final ThemeMode mode;

  @override
  List<Object?> get props => [mode];
}

class PersistThemeModeUseCase implements UseCase<Unit, ThemeModeParams> {
  PersistThemeModeUseCase(this._repository);

  final ThemeRepository _repository;

  @override
  Future<Either<Failure, Unit>> call(ThemeModeParams params) =>
      _repository.persistThemeMode(params.mode);
}

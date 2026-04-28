import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/theme_repository.dart';

/// Resolves persisted or system theme preference.
class LoadInitialThemeModeUseCase implements UseCase<ThemeMode, NoParams> {
  LoadInitialThemeModeUseCase(this._repository);

  final ThemeRepository _repository;

  @override
  Future<Either<Failure, ThemeMode>> call(NoParams params) =>
      _repository.resolveInitialThemeMode();
}

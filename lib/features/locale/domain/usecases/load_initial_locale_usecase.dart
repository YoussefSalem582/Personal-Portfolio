import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/locale_repository.dart';

/// Loads persisted or device locale preference.
class LoadInitialLocaleUseCase implements UseCase<Locale, NoParams> {
  LoadInitialLocaleUseCase(this._repository);

  final LocaleRepository _repository;

  @override
  Future<Either<Failure, Locale>> call(NoParams params) =>
      _repository.resolveInitialLocale();
}

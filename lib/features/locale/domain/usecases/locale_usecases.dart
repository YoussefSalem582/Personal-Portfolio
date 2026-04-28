import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/locale_repository.dart';

class LoadInitialLocaleUseCase implements UseCase<Locale, NoParams> {
  LoadInitialLocaleUseCase(this._repository);

  final LocaleRepository _repository;

  @override
  Future<Either<Failure, Locale>> call(NoParams params) =>
      _repository.resolveInitialLocale();
}

class LocaleParams extends Equatable {
  const LocaleParams(this.locale);

  final Locale locale;

  @override
  List<Object?> get props => [locale];
}

class PersistLocaleUseCase implements UseCase<Unit, LocaleParams> {
  PersistLocaleUseCase(this._repository);

  final LocaleRepository _repository;

  @override
  Future<Either<Failure, Unit>> call(LocaleParams params) =>
      _repository.persistLocale(params.locale);
}

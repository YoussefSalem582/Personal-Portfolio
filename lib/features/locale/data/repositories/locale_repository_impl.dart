import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/error/failures.dart';
import '../../domain/repositories/locale_repository.dart';
import '../datasources/locale_local_datasource.dart';

class LocaleRepositoryImpl implements LocaleRepository {
  LocaleRepositoryImpl({required LocaleLocalDataSource local}) : _local = local;

  final LocaleLocalDataSource _local;
  static const String _en = 'en';
  static const String _ar = 'ar';

  @override
  Future<Either<Failure, Locale>> resolveInitialLocale() async {
    try {
      final raw = _local.readLanguageCodeSync();
      if (raw == null) return const Right(Locale(_en));
      if (raw == _ar) return const Right(Locale(_ar));
      return const Right(Locale(_en));
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> persistLocale(Locale locale) async {
    try {
      final code =
          locale.languageCode == _ar ? _ar : _en;
      await _local.writeLanguageCode(code);
      return const Right(unit);
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }
}

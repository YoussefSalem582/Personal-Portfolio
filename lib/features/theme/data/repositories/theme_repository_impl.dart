import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/error/failures.dart';
import '../../domain/repositories/theme_repository.dart';
import '../datasources/theme_local_datasource.dart';

class ThemeRepositoryImpl implements ThemeRepository {
  ThemeRepositoryImpl({required ThemeLocalDataSource local}) : _local = local;

  final ThemeLocalDataSource _local;

  @override
  Future<Either<Failure, ThemeMode>> resolveInitialThemeMode() async {
    try {
      final raw = _local.readThemeModeRawSync();
      if (raw == null) return const Right(ThemeMode.system);
      switch (raw) {
        case 'dark':
          return const Right(ThemeMode.dark);
        case 'light':
          return const Right(ThemeMode.light);
        case 'system':
        default:
          return const Right(ThemeMode.system);
      }
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> persistThemeMode(ThemeMode mode) async {
    try {
      await _local.writeThemeModeRaw(mode.name);
      return const Right(unit);
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }
}

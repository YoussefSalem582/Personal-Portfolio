import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/error/failures.dart';

/// Theme preference contract (domain).
abstract class ThemeRepository {
  Future<Either<Failure, ThemeMode>> resolveInitialThemeMode();

  Future<Either<Failure, Unit>> persistThemeMode(ThemeMode mode);
}

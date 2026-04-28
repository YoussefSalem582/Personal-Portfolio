import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/error/failures.dart';

abstract class LocaleRepository {
  Future<Either<Failure, Locale>> resolveInitialLocale();

  Future<Either<Failure, Unit>> persistLocale(Locale locale);
}

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../error/failures.dart';

/// Base use case ([technology_ninety_two_app] style).
abstract class UseCase<Result, Params> {
  Future<Either<Failure, Result>> call(Params params);
}

/// No-parameter use cases.
class NoParams extends Equatable {
  const NoParams();

  @override
  List<Object?> get props => [];
}

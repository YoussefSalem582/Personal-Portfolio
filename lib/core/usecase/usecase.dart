import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../error/failures.dart';

/// Callable use-case base: single [call] entry returning [Either]<[Failure], [Result]>.
abstract class UseCase<Result, Params> {
  Future<Either<Failure, Result>> call(Params params);
}

/// No-parameter use cases.
class NoParams extends Equatable {
  const NoParams();

  @override
  List<Object?> get props => [];
}

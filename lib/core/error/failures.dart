import 'package:equatable/equatable.dart';

/// Base failure for domain / repository error handling (`dartz` / Clean Architecture style).
abstract class Failure extends Equatable {
  final String message;
  final int? statusCode;

  const Failure({required this.message, this.statusCode});

  @override
  List<Object?> get props => [message, statusCode];
}

class ServerFailure extends Failure {
  final Map<String, dynamic>? errors;

  const ServerFailure({required super.message, super.statusCode, this.errors});

  @override
  List<Object?> get props => [message, statusCode, errors];
}

class NetworkFailure extends Failure {
  const NetworkFailure({super.message = 'No internet connection'});
}

class CacheFailure extends Failure {
  const CacheFailure({super.message = 'Cache error occurred'});
}

class AuthFailure extends Failure {
  const AuthFailure({
    super.message = 'Authentication failed',
    super.statusCode,
  });
}

class ValidationFailure extends Failure {
  final Map<String, List<String>> fieldErrors;

  const ValidationFailure({
    required super.message,
    required this.fieldErrors,
    super.statusCode = 422,
  });

  @override
  List<Object?> get props => [message, statusCode, fieldErrors];
}

class NotFoundFailure extends Failure {
  const NotFoundFailure({
    super.message = 'Resource not found',
    super.statusCode = 404,
  });
}

class ForbiddenFailure extends Failure {
  const ForbiddenFailure({
    super.message = 'Access denied',
    super.statusCode = 403,
  });
}

class UnexpectedFailure extends Failure {
  const UnexpectedFailure({super.message = 'An unexpected error occurred'});
}

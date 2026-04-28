import 'package:equatable/equatable.dart';

/// Typed error for contact form submission (mapped to l10n in UI).
class ContactSubmitError extends Equatable implements Exception {
  const ContactSubmitError(this.kind, {this.statusCode});

  final ContactSubmitErrorKind kind;
  final int? statusCode;

  @override
  List<Object?> get props => [kind, statusCode];
}

enum ContactSubmitErrorKind {
  notConfigured,
  invalidForm,
  formDisabled,
  rateLimit,
  failedWithStatus,
  timeout,
  network,
  badCertificate,
}

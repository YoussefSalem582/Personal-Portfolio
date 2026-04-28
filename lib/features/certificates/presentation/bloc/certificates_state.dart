import 'package:equatable/equatable.dart';

import '../../domain/entities/certificates_content_entity.dart';

abstract class CertificatesState extends Equatable {
  const CertificatesState();

  @override
  List<Object?> get props => [];
}

final class CertificatesInitial extends CertificatesState {
  const CertificatesInitial();
}

final class CertificatesLoading extends CertificatesState {
  const CertificatesLoading();
}

final class CertificatesLoaded extends CertificatesState {
  const CertificatesLoaded(this.content);

  final CertificatesContentEntity content;

  @override
  List<Object?> get props => [content];
}

final class CertificatesFailure extends CertificatesState {
  const CertificatesFailure(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}

import 'package:equatable/equatable.dart';

abstract class CertificatesEvent extends Equatable {
  const CertificatesEvent();

  @override
  List<Object?> get props => [];
}

final class CertificatesStarted extends CertificatesEvent {
  const CertificatesStarted();
}

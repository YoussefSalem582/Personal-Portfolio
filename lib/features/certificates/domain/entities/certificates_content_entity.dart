import 'package:equatable/equatable.dart';

import '../../../../models/certificate.dart';

class CertificatesContentEntity extends Equatable {
  const CertificatesContentEntity({required this.certificates});

  final List<Certificate> certificates;

  @override
  List<Object?> get props => [certificates];
}

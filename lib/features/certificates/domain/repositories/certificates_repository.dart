import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/certificates_content_entity.dart';

abstract class CertificatesRepository {
  Future<Either<Failure, CertificatesContentEntity>> loadCertificatesContent();
}

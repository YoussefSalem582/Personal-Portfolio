import '../../domain/entities/certificates_content_entity.dart';

abstract class CertificatesLocalDataSource {
  CertificatesContentEntity getContentSync();
}

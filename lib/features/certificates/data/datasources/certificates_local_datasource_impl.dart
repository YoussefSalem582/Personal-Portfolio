import '../../domain/entities/certificates_content_entity.dart';
import '../local/certificates_data.dart';
import 'certificates_local_datasource.dart';

class CertificatesLocalDataSourceImpl implements CertificatesLocalDataSource {
  const CertificatesLocalDataSourceImpl();

  @override
  CertificatesContentEntity getContentSync() {
    return CertificatesContentEntity(
      certificates: CertificatesData.certificates,
    );
  }
}

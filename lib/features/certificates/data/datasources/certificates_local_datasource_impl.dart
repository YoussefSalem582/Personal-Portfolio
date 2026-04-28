import '../../../../utils/data/portfolio_data.dart';
import '../../domain/entities/certificates_content_entity.dart';
import 'certificates_local_datasource.dart';

class CertificatesLocalDataSourceImpl implements CertificatesLocalDataSource {
  const CertificatesLocalDataSourceImpl();

  @override
  CertificatesContentEntity getContentSync() {
    return CertificatesContentEntity(
      certificates: PortfolioData.certificates,
    );
  }
}

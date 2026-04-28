import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/certificates_content_entity.dart';
import '../../domain/repositories/certificates_repository.dart';
import '../datasources/certificates_local_datasource.dart';

class CertificatesRepositoryImpl implements CertificatesRepository {
  CertificatesRepositoryImpl({required CertificatesLocalDataSource local})
      : _local = local;

  final CertificatesLocalDataSource _local;

  @override
  Future<Either<Failure, CertificatesContentEntity>>
      loadCertificatesContent() async {
    try {
      return Right(_local.getContentSync());
    } catch (e, st) {
      return Left(UnexpectedFailure(message: '$e\n$st'));
    }
  }
}

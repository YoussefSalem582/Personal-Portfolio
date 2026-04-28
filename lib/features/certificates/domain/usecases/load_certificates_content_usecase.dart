import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/certificates_content_entity.dart';
import '../repositories/certificates_repository.dart';

class LoadCertificatesContentUseCase
    implements UseCase<CertificatesContentEntity, NoParams> {
  LoadCertificatesContentUseCase(this._repository);

  final CertificatesRepository _repository;

  @override
  Future<Either<Failure, CertificatesContentEntity>> call(NoParams params) =>
      _repository.loadCertificatesContent();
}

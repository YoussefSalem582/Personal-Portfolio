import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/about_content_entity.dart';
import '../../domain/repositories/about_repository.dart';
import '../datasources/about_local_datasource.dart';

class AboutRepositoryImpl implements AboutRepository {
  AboutRepositoryImpl({required AboutLocalDataSource local}) : _local = local;

  final AboutLocalDataSource _local;

  @override
  Future<Either<Failure, AboutContentEntity>> loadAboutContent() async {
    try {
      return Right(_local.getContentSync());
    } catch (e, st) {
      return Left(UnexpectedFailure(message: '$e\n$st'));
    }
  }
}

import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/about_content_entity.dart';

abstract class AboutRepository {
  Future<Either<Failure, AboutContentEntity>> loadAboutContent();
}

import '../../domain/entities/about_content_entity.dart';

abstract class AboutLocalDataSource {
  AboutContentEntity getContentSync();
}

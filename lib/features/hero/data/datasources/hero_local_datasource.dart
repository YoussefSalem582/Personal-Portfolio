import '../../domain/entities/hero_content_entity.dart';

abstract class HeroLocalDataSource {
  HeroContentEntity getContentSync();
}

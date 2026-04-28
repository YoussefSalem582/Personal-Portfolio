import 'package:equatable/equatable.dart';

import '../../domain/entities/hero_content_entity.dart';

abstract class HeroState extends Equatable {
  const HeroState();

  @override
  List<Object?> get props => [];
}

final class HeroInitial extends HeroState {
  const HeroInitial();
}

final class HeroLoading extends HeroState {
  const HeroLoading();
}

final class HeroLoaded extends HeroState {
  const HeroLoaded(this.content);

  final HeroContentEntity content;

  @override
  List<Object?> get props => [content];
}

final class HeroFailure extends HeroState {
  const HeroFailure(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}

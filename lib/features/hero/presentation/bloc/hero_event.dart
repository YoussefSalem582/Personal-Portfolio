import 'package:equatable/equatable.dart';

abstract class HeroEvent extends Equatable {
  const HeroEvent();

  @override
  List<Object?> get props => [];
}

final class HeroStarted extends HeroEvent {
  const HeroStarted();
}

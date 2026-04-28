import 'package:equatable/equatable.dart';

abstract class ExpertiseEvent extends Equatable {
  const ExpertiseEvent();

  @override
  List<Object?> get props => [];
}

final class ExpertiseStarted extends ExpertiseEvent {
  const ExpertiseStarted();
}

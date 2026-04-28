import 'package:equatable/equatable.dart';

abstract class AboutEvent extends Equatable {
  const AboutEvent();

  @override
  List<Object?> get props => [];
}

final class AboutStarted extends AboutEvent {
  const AboutStarted();
}

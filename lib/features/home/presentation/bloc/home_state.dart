import 'package:equatable/equatable.dart';

import '../../domain/entities/home_layout.dart';

/// Presentation state for landing scroll / nav.
final class HomeState extends Equatable {
  const HomeState({this.currentSection = 0});

  static int get sectionCount => HomeLayout.sectionCount;

  final int currentSection;

  HomeState copyWith({int? currentSection}) {
    return HomeState(currentSection: currentSection ?? this.currentSection);
  }

  @override
  List<Object?> get props => [currentSection];
}

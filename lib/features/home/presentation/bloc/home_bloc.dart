import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/home_layout.dart';
import '../../domain/usecases/resolve_initial_home_section_usecase.dart';
import 'home_event.dart';
import 'home_state.dart';

/// Active section index for landing navigation and scroll sync.
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required ResolveInitialHomeSectionUseCase resolveInitialSection,
    int? routeSectionOverride,
  }) : super(
          HomeState(
            currentSection: resolveInitialSection(
              routeOverride: routeSectionOverride,
            ),
          ),
        ) {
    on<HomeSectionIndexChanged>(_onSectionIndexChanged);
  }

  void _onSectionIndexChanged(
    HomeSectionIndexChanged event,
    Emitter<HomeState> emit,
  ) {
    final i = HomeLayout.clampIndex(event.index);
    if (i != state.currentSection) {
      emit(state.copyWith(currentSection: i));
    }
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/usecase/usecase.dart';
import '../../domain/usecases/load_hero_content_usecase.dart';
import 'hero_event.dart';
import 'hero_state.dart';

class HeroBloc extends Bloc<HeroEvent, HeroState> {
  HeroBloc({required LoadHeroContentUseCase loadHeroContent})
      : _loadHeroContent = loadHeroContent,
        super(const HeroInitial()) {
    on<HeroStarted>(_onStarted);
    add(const HeroStarted());
  }

  final LoadHeroContentUseCase _loadHeroContent;

  Future<void> _onStarted(
    HeroStarted event,
    Emitter<HeroState> emit,
  ) async {
    emit(const HeroLoading());
    final result = await _loadHeroContent(const NoParams());
    result.fold(
      (f) => emit(HeroFailure(f.message)),
      (content) => emit(HeroLoaded(content)),
    );
  }
}

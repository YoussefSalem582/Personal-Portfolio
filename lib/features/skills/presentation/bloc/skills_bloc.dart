import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/usecase/usecase.dart';
import '../../domain/usecases/load_skills_content_usecase.dart';
import 'skills_event.dart';
import 'skills_state.dart';

class SkillsBloc extends Bloc<SkillsEvent, SkillsState> {
  SkillsBloc({required LoadSkillsContentUseCase loadSkillsContent})
      : _loadSkillsContent = loadSkillsContent,
        super(const SkillsInitial()) {
    on<SkillsStarted>(_onStarted);
    add(const SkillsStarted());
  }

  final LoadSkillsContentUseCase _loadSkillsContent;

  Future<void> _onStarted(
    SkillsStarted event,
    Emitter<SkillsState> emit,
  ) async {
    emit(const SkillsLoading());
    final result = await _loadSkillsContent(const NoParams());
    result.fold(
      (f) => emit(SkillsFailure(f.message)),
      (content) => emit(SkillsLoaded(content)),
    );
  }
}

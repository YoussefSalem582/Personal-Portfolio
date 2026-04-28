import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/usecase/usecase.dart';
import '../../domain/usecases/load_expertise_content_usecase.dart';
import 'expertise_event.dart';
import 'expertise_state.dart';

class ExpertiseBloc extends Bloc<ExpertiseEvent, ExpertiseState> {
  ExpertiseBloc({required LoadExpertiseContentUseCase loadExpertiseContent})
      : _loadExpertiseContent = loadExpertiseContent,
        super(const ExpertiseInitial()) {
    on<ExpertiseStarted>(_onStarted);
    add(const ExpertiseStarted());
  }

  final LoadExpertiseContentUseCase _loadExpertiseContent;

  Future<void> _onStarted(
    ExpertiseStarted event,
    Emitter<ExpertiseState> emit,
  ) async {
    emit(const ExpertiseLoading());
    final result = await _loadExpertiseContent(const NoParams());
    result.fold(
      (f) => emit(ExpertiseFailure(f.message)),
      (content) => emit(ExpertiseLoaded(content)),
    );
  }
}

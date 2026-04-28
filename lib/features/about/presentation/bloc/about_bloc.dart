import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/usecase/usecase.dart';
import '../../domain/usecases/load_about_content_usecase.dart';
import 'about_event.dart';
import 'about_state.dart';

class AboutBloc extends Bloc<AboutEvent, AboutState> {
  AboutBloc({required LoadAboutContentUseCase loadAboutContent})
      : _loadAboutContent = loadAboutContent,
        super(const AboutInitial()) {
    on<AboutStarted>(_onStarted);
    add(const AboutStarted());
  }

  final LoadAboutContentUseCase _loadAboutContent;

  Future<void> _onStarted(
    AboutStarted event,
    Emitter<AboutState> emit,
  ) async {
    emit(const AboutLoading());
    final result = await _loadAboutContent(const NoParams());
    result.fold(
      (f) => emit(AboutFailure(f.message)),
      (content) => emit(AboutLoaded(content)),
    );
  }
}

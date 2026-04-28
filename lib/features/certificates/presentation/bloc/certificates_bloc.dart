import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/usecase/usecase.dart';
import '../../domain/usecases/load_certificates_content_usecase.dart';
import 'certificates_event.dart';
import 'certificates_state.dart';

class CertificatesBloc extends Bloc<CertificatesEvent, CertificatesState> {
  CertificatesBloc({required LoadCertificatesContentUseCase loadCertificates})
      : _loadCertificates = loadCertificates,
        super(const CertificatesInitial()) {
    on<CertificatesStarted>(_onStarted);
    add(const CertificatesStarted());
  }

  final LoadCertificatesContentUseCase _loadCertificates;

  Future<void> _onStarted(
    CertificatesStarted event,
    Emitter<CertificatesState> emit,
  ) async {
    emit(const CertificatesLoading());
    final result = await _loadCertificates(const NoParams());
    result.fold(
      (f) => emit(CertificatesFailure(f.message)),
      (content) => emit(CertificatesLoaded(content)),
    );
  }
}

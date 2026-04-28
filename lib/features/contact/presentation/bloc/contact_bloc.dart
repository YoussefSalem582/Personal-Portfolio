import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/repositories/contact_repository.dart';
import '../../domain/usecases/submit_contact_usecase.dart';
import 'contact_event.dart';
import 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactBloc({
    required ContactRepository contactRepository,
    required SubmitContactUseCase submitContactUseCase,
  })  : _submitContactUseCase = submitContactUseCase,
        super(
          ContactState(
            contactInfo: contactRepository.getContactInfoSync(),
          ),
        ) {
    on<ContactFormSubmitted>(_onSubmitted);
  }

  final SubmitContactUseCase _submitContactUseCase;

  Future<void> _onSubmitted(
    ContactFormSubmitted event,
    Emitter<ContactState> emit,
  ) async {
    emit(
      state.copyWith(
        formStatus: ContactFormStatus.submitting,
        clearSubmitError: true,
      ),
    );
    final result = await _submitContactUseCase(event.form);
    result.fold(
      (err) => emit(
        state.copyWith(
          formStatus: ContactFormStatus.failure,
          submitError: err,
        ),
      ),
      (_) => emit(
        state.copyWith(
          formStatus: ContactFormStatus.success,
          clearSubmitError: true,
        ),
      ),
    );
  }
}

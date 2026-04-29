import 'package:dartz/dartz.dart';

import '../entities/contact_entities.dart';
import '../contact_submit_error.dart';
import '../repositories/contact_repository.dart';

class SubmitContactUseCase {
  SubmitContactUseCase(this._repository);

  final ContactRepository _repository;

  Future<Either<ContactSubmitError, void>> call(ContactForm form) =>
      _repository.submitContact(form);
}

import 'package:dartz/dartz.dart';

import '../entities/contact_entities.dart';
import '../contact_submit_error.dart';

abstract class ContactRepository {
  ContactInfo getContactInfoSync();

  Future<Either<ContactSubmitError, void>> submitContact(ContactForm form);
}

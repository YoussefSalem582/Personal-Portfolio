import 'package:dartz/dartz.dart';

import '../../../../models/contact_form.dart';
import '../contact_submit_error.dart';

abstract class ContactRepository {
  ContactInfo getContactInfoSync();

  Future<Either<ContactSubmitError, void>> submitContact(ContactForm form);
}
